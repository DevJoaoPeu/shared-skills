# shared-skills

Configuração pessoal de IA (Claude Code e Codex) compartilhada entre todos os meus
projetos: **rédeas** (o que o agente pode/não pode fazer), **boas práticas** de
desenvolvimento e **skills** reutilizáveis.

Nada aqui é específico de projeto. Regra, nome, rota, ID ou stack de um projeto mora no
`CLAUDE.md`/`AGENTS.md` daquele projeto — que tem precedência sobre este repo.

## Estrutura

```
CLAUDE.md                  ponto de entrada: importa rules/*
rules/
  guardrails.md            rédeas: escopo, quando perguntar, ações que exigem confirmação, proibições
  engenharia.md            boas práticas: design, erros, segurança, testes, git, definição de pronto
skills/                    skills próprias (symlinkadas em ~/.claude/skills e ~/.codex/skills)
scripts/install.sh         liga tudo à configuração global
docs/skills-recomendadas.md  skills de terceiros e fontes de confiança
```

## Instalação

```bash
./scripts/install.sh
```

- **Claude Code**: adiciona `@<repo>/CLAUDE.md` em `~/.claude/CLAUDE.md` (memória de
  usuário, carregada em todo projeto). Editou `rules/`? Já vale na próxima sessão.
- **Codex**: copia o conteúdo de `rules/*.md` para um bloco marcado em
  `~/.codex/AGENTS.md` (Codex não suporta `@import`). Editou `rules/`? Rode o script de novo.
- **Skills**: cria symlink de cada `skills/<nome>/` — nunca sobrescreve o que existe.

O script é idempotente e não apaga conteúdo seu dos arquivos globais.

Confira no Claude Code com `/memory` que o arquivo foi carregado.

## Manutenção

- Mantenha as regras curtas: cada linha custa contexto em toda sessão. Se o agente já
  faz certo sem a regra, a regra sai.
- Regra nova nasce de erro real que se repetiu, não de hipótese.
- Antes de adicionar, pergunte: "isso vale para *todos* os projetos?" Se não, vai para o projeto.
