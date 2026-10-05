#!/usr/bin/env bash
# Liga este repo à configuração global do Claude Code e do Codex.
# Idempotente e não destrutivo: nunca sobrescreve arquivo ou skill existente.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MARK_BEGIN="<!-- shared-skills:begin -->"
MARK_END="<!-- shared-skills:end -->"

install_claude_md() {
  local target="$HOME/.claude/CLAUDE.md"
  mkdir -p "$HOME/.claude"
  if grep -qF "$MARK_BEGIN" "$target" 2>/dev/null; then
    echo "= ~/.claude/CLAUDE.md já importa as regras"
    return
  fi
  printf '\n%s\n@%s/CLAUDE.md\n%s\n' "$MARK_BEGIN" "$REPO" "$MARK_END" >>"$target"
  echo "+ ~/.claude/CLAUDE.md importa $REPO/CLAUDE.md"
}

# Codex não suporta @import: gera um bloco com o conteúdo das regras.
# Rode de novo depois de editar rules/ para atualizar.
install_codex_md() {
  [ -d "$HOME/.codex" ] || { echo "- Codex não encontrado, pulando"; return; }
  local target="$HOME/.codex/AGENTS.md" tmp
  tmp="$(mktemp)"
  if [ -f "$target" ]; then
    sed "/$MARK_BEGIN/,/$MARK_END/d" "$target" >"$tmp"
  fi
  {
    echo "$MARK_BEGIN"
    echo "<!-- Gerado por $REPO/scripts/install.sh — edite as regras lá, não aqui. -->"
    for f in "$REPO"/rules/*.md; do echo; cat "$f"; done
    echo "$MARK_END"
  } >>"$tmp"
  mv "$tmp" "$target"
  echo "+ ~/.codex/AGENTS.md atualizado com rules/*.md"
}

link_skills() {
  local dest="$1"
  [ -d "$(dirname "$dest")" ] || return 0
  mkdir -p "$dest"
  for dir in "$REPO"/skills/*/; do
    [ -f "$dir/SKILL.md" ] || continue
    local name; name="$(basename "$dir")"
    if [ -e "$dest/$name" ] || [ -L "$dest/$name" ]; then
      echo "= $dest/$name já existe, mantido"
    else
      ln -s "${dir%/}" "$dest/$name"
      echo "+ $dest/$name -> ${dir%/}"
    fi
  done
}

install_claude_md
install_codex_md
link_skills "$HOME/.claude/skills"
link_skills "$HOME/.codex/skills"
