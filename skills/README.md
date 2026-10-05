# skills/ — globais

Ficam disponíveis em **todo projeto**, no Claude Code (`~/.claude/skills`) e no Codex
(`~/.codex/skills`), via symlink criado por `scripts/install.sh`. Uma skill só entra no
contexto quando a tarefa bate com a descrição dela.

Cada pasta tem um `RESUMO.md` com para quê, quando usar/não usar e cuidados.

| Skill | Origem | Quando dispara |
|---|---|---|
| `systematic-debugging` | obra/superpowers | Bug, teste falhando, comportamento inesperado |
| `verification-before-completion` | obra/superpowers | Antes de declarar algo pronto |
| `skill-creator` | anthropics/skills | Criar ou melhorar uma skill |
| `mcp-builder` | anthropics/skills | Criar servidor MCP |
| `webapp-testing` | anthropics/skills | Testar app web com Playwright |
| `vercel-react-best-practices` | vercel-labs/agent-skills | Código React/Next.js |
| `vercel-composition-patterns` | vercel-labs/agent-skills | Arquitetura de componentes React |
| `web-design-guidelines` | vercel-labs/agent-skills | Revisar UI e acessibilidade |
| `supabase-postgres-best-practices` | supabase/agent-skills | Schema, queries e índices PostgreSQL |
| `differential-review` | trailofbits/skills | Revisão de segurança de diff/PR |
| `supply-chain-risk-auditor` | trailofbits/skills | Avaliar risco das dependências |
| `property-based-testing` | trailofbits/skills | Testes por propriedade |

## Terceiros vs. próprias

- **De terceiros**: listadas em `../skills.lock` com commit fixo e copiadas por
  `scripts/vendor-skills.sh`. Não edite à mão — a próxima atualização sobrescreve.
  Para customizar, copie com outro nome e tire do lock.
- **Próprias**: crie uma pasta com `SKILL.md` (use a skill `skill-creator`). Nenhuma
  pode conter nome de cliente, ID de projeto, URL interna ou credencial.
