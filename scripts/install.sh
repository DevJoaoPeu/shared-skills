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

link_skills() { # origem destino
  local src="$1" dest="$2"
  mkdir -p "$dest"
  for dir in "$src"/*/; do
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

# Symlinks apontam para esta máquina: não devem ir para o git do projeto.
exclude_from_git() { # projeto caminho-relativo
  local exclude="$1/.git/info/exclude"
  [ -f "$exclude" ] || return 0
  grep -qxF "/$2" "$exclude" || echo "/$2" >>"$exclude"
}

# Skills pessoais: só no projeto indicado (Claude lê .claude/skills, Codex lê .agents/skills).
install_project() {
  local proj; proj="$(cd "$1" && pwd)"
  for sub in .claude/skills .agents/skills; do
    for dir in "$REPO"/skills-pessoais/*/; do
      [ -f "$dir/SKILL.md" ] && exclude_from_git "$proj" "$sub/$(basename "$dir")"
    done
    link_skills "$REPO/skills-pessoais" "$proj/$sub"
  done
}

case "${1:-}" in
  --projeto)
    [ -n "${2:-}" ] && [ -d "$2" ] || { echo "uso: $0 --projeto <diretório do projeto>" >&2; exit 1; }
    install_project "$2"
    ;;
  "")
    install_claude_md
    install_codex_md
    [ -d "$HOME/.claude" ] && link_skills "$REPO/skills" "$HOME/.claude/skills"
    [ -d "$HOME/.codex" ] && link_skills "$REPO/skills" "$HOME/.codex/skills"
    ;;
  *)
    echo "uso: $0            # regras + skills globais" >&2
    echo "     $0 --projeto <dir>  # skills pessoais em um projeto" >&2
    exit 1
    ;;
esac
