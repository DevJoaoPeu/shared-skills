# Skills recomendadas e fontes de confiança

Levantamento de 2026-10-05. Todas as fontes abaixo foram conferidas no GitHub nessa data
(repositório existe, ativo, não arquivado).

## Antes de instalar qualquer skill

Uma skill é **instrução que o agente segue** e às vezes **script que ele executa** — tem o
mesmo risco de rodar código de terceiros.

1. Leia o `SKILL.md` e todo script incluído antes de instalar.
2. Prefira plugin/marketplace com versão a copiar pasta solta; se copiar, anote o commit.
3. Desconfie de skill que pede rede, credenciais ou `curl | bash` sem motivo claro.
4. Instale poucas. Cada skill ocupa contexto com a descrição e pode disparar quando não
   devia. Comece com 5–8 e adicione conforme sentir falta.

## Fontes de confiança

| Repo | Quem mantém | Para quê |
|---|---|---|
| [anthropics/skills](https://github.com/anthropics/skills) | Anthropic (oficial) | Skills de referência: documentos, `skill-creator`, `mcp-builder`, `webapp-testing`, `frontend-design` |
| [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) | Anthropic (oficial) | Marketplace oficial de plugins do Claude Code (review, commits, LSPs, segurança) |
| [obra/superpowers](https://github.com/obra/superpowers) | Jesse Vincent | Disciplina de engenharia: TDD, debug sistemático, planos, verificação, worktrees |
| [trailofbits/skills](https://github.com/trailofbits/skills) | Trail of Bits (empresa de segurança) | Auditoria, análise estática, supply chain, testes por propriedade |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | Vercel | React/Next.js, diretrizes de UI web |
| [supabase/agent-skills](https://github.com/supabase/agent-skills) | Supabase | Boas práticas de PostgreSQL |
| [cloudflare/skills](https://github.com/cloudflare/skills) | Cloudflare | Workers, edge, plataforma Cloudflare |
| [hashicorp/agent-skills](https://github.com/hashicorp/agent-skills) | HashiCorp | Terraform e afins |
| [getsentry/skills](https://github.com/getsentry/skills) | Sentry | Fluxos de engenharia usados pelo time do Sentry |

**Listas curadas** (bom para descobrir, mas *não* são auditadas — aplique o checklist acima):
[hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code),
[travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills).

Regra prática: prefira repositório de **quem mantém a tecnologia** (Vercel para Next,
Supabase para Postgres, etc.) ou de empresa com reputação a perder.

## Recomendação para o dia a dia

### Núcleo (instale primeiro)

| Skill / plugin | Fonte | Por quê |
|---|---|---|
| `systematic-debugging` | superpowers | Força achar a causa antes de mexer — evita "tentativa e erro" |
| `test-driven-development` | superpowers | Teste falhando → código → refactor |
| `verification-before-completion` | superpowers | Não declara pronto sem rodar a prova (casa com as rédeas) |
| `brainstorming` + `writing-plans` + `executing-plans` | superpowers | Desenha antes de codar em mudanças maiores |
| `using-git-worktrees` | superpowers | Trabalho isolado por tarefa sem bagunçar a branch atual |
| `code-review`, `pr-review-toolkit` | claude-plugins-official | Revisão antes de abrir PR |
| `commit-commands` | claude-plugins-official | Commit/PR com mensagem padronizada |
| `security-guidance` | claude-plugins-official | Alerta de padrões inseguros enquanto edita |
| `skill-creator` | anthropics/skills | Para criar as suas próprias skills em `skills/` |

### Por stack (só se usar)

| Situação | Skill | Fonte |
|---|---|---|
| TypeScript/Python/Go etc. | `typescript-lsp`, `pyright-lsp`, `gopls-lsp`… | claude-plugins-official |
| React / Next.js | `react-best-practices`, `composition-patterns` | vercel-labs/agent-skills |
| Interface web | `web-design-guidelines`, `frontend-design` | vercel-labs / anthropics |
| Teste E2E de app web | `webapp-testing` (Playwright) | anthropics/skills |
| PostgreSQL | `supabase-postgres-best-practices` | supabase/agent-skills |
| Criar servidor MCP | `mcp-builder` | anthropics/skills |
| Python moderno | `modern-python` | trailofbits/skills |
| Testes por propriedade | `property-based-testing` | trailofbits/skills |

### Segurança (quando o projeto pedir)

`differential-review` (revisão de segurança de diff), `insecure-defaults`,
`supply-chain-risk-auditor`, `static-analysis` (Semgrep/CodeQL) — todos em trailofbits/skills.

## Como instalar

```bash
# Marketplaces de plugins (dentro do Claude Code)
/plugin marketplace add anthropics/claude-plugins-official
/plugin marketplace add obra/superpowers
/plugin marketplace add trailofbits/skills
/plugin                       # navegar e instalar

# Skill solta (repo sem marketplace): copie a pasta para ~/.claude/skills/
# ou para skills/ deste repo, anotando o commit de origem.
```

Confira o README de cada repo para o comando exato — alguns publicam marketplace,
outros só a pasta de skills.

## O que já está vendorizado neste repo

Veja `skills/README.md` (globais) e `skills-pessoais/README.md` (por projeto); a origem
e o commit de cada uma estão em `skills.lock`.

Não são skills — são **plugins** e se instalam pelo `/plugin` do Claude Code (marketplace
`anthropics/claude-plugins-official`): `typescript-lsp`, `pyright-lsp`, `commit-commands`,
`security-guidance`, `claude-md-management`, `pr-review-toolkit`. O `code-review` já vem
embutido no Claude Code como `/code-review`. `insecure-defaults` (Trail of Bits) virou
comando/workflow de plugin, não skill — instale pelo marketplace `trailofbits/skills`.
