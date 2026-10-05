# skills/

Skills próprias e reutilizáveis entre projetos. Cada skill é uma pasta com um `SKILL.md`:

```
skills/
  minha-skill/
    SKILL.md        # frontmatter (name, description) + instruções
    scripts/        # opcional
    references/     # opcional
```

`scripts/install.sh` cria um symlink de cada pasta daqui em `~/.claude/skills/` e
`~/.codex/skills/` (sem sobrescrever nada que já exista).

Regra da casa: nenhuma skill aqui pode conter nome de cliente, ID de projeto, URL interna
ou credencial — se for específica de um projeto, ela mora no repo do projeto
(`.claude/skills/`).

Para criar uma skill nova, use a skill `skill-creator` (anthropics/skills).
