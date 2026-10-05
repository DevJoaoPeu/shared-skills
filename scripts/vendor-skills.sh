#!/usr/bin/env bash
# Copia as skills listadas em skills.lock para este repo, no commit fixado.
# Sobrescreve só as pastas listadas no lock; revise o diff antes de commitar.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE="$(mktemp -d)"
trap 'rm -rf "$CACHE"' EXIT

fetch() { # repo commit -> diretório com o checkout
  local repo="$1" commit="$2" dir="$CACHE/${1//\//_}-$2"
  if [ ! -d "$dir" ]; then
    git init -q "$dir"
    git -C "$dir" fetch -q --depth 1 "https://github.com/$repo" "$commit"
    git -C "$dir" checkout -q FETCH_HEAD
  fi
  echo "$dir"
}

grep -vE '^\s*(#|$)' "$REPO/skills.lock" | while read -r dest repo commit path; do
  src="$(fetch "$repo" "$commit")"
  [ -f "$src/$path/SKILL.md" ] || { echo "! $repo@$commit:$path sem SKILL.md" >&2; exit 1; }
  # RESUMO.md é nosso, não do upstream: preserva entre atualizações.
  resumo=""
  [ -f "$REPO/$dest/RESUMO.md" ] && resumo="$(cat "$REPO/$dest/RESUMO.md")"
  rm -rf "${REPO:?}/$dest"
  mkdir -p "$(dirname "$REPO/$dest")"
  cp -R "$src/$path" "$REPO/$dest"
  [ -n "$resumo" ] && printf '%s\n' "$resumo" >"$REPO/$dest/RESUMO.md"
  # Remove pacotes binários e lixo de macOS: não dá para revisar e duplicam os arquivos.
  find "$REPO/$dest" \( -name '*.zip' -o -name '__MACOSX' -o -name '.DS_Store' \) -prune -exec rm -rf {} +
  # Mantém a licença do repo de origem junto da skill, quando a skill não traz a própria.
  if ! ls "$REPO/$dest" | grep -qi '^licen'; then
    for lic in "$src"/LICENSE*; do [ -f "$lic" ] && cp "$lic" "$REPO/$dest/"; done
  fi
  echo "+ $dest <- $repo@${commit:0:7}"
done
