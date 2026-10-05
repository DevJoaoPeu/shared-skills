# skills-pessoais/ — só onde você pedir

Skills que **não** são instaladas globalmente porque trazem um fluxo próprio de trabalho
(planejar → executar → revisar → fechar branch) que competiria com o pipeline de
projetos que já têm o seu (ex.: os do trabalho).

Instale por projeto:

```bash
~/Downloads/projetos/pessoal/shared-skills/scripts/install.sh --projeto <dir-do-projeto>
```

Cria symlinks em `<projeto>/.claude/skills/` (Claude Code) e `<projeto>/.agents/skills/`
(Codex) e coloca esses caminhos no `.git/info/exclude` do projeto — não aparecem no
`git status` nem vão para o repositório.

Cada pasta tem um `RESUMO.md` com para quê, quando usar/não usar e cuidados.

| Skill | Origem | Para quê |
|---|---|---|
| `brainstorming` | obra/superpowers | Refinar a ideia em design antes de codar |
| `writing-plans` | obra/superpowers | Transformar o design em plano de tarefas pequenas |
| `executing-plans` | obra/superpowers | Executar o plano com checkpoints |
| `subagent-driven-development` | obra/superpowers | Executar o plano com um subagente por tarefa |
| `requesting-code-review` | obra/superpowers | Pedir revisão entre tarefas |
| `finishing-a-development-branch` | obra/superpowers | Encerrar a branch: merge, PR ou descarte |
| `test-driven-development` | obra/superpowers | Ciclo vermelho → verde → refactor |
| `using-git-worktrees` | obra/superpowers | Trabalho isolado por tarefa |
| `frontend-design` | anthropics/skills | Interface com identidade visual própria |
| `devcontainer-setup` | trailofbits/skills | Ambiente de desenvolvimento em container |
| `deploy-to-vercel` | vercel-labs/agent-skills | Deploy de preview na Vercel |

Observações:
- As skills do superpowers citam umas às outras como `superpowers:<nome>`; aqui elas
  existem sem o prefixo. `writing-skills` não foi incluída — use `skill-creator`.
- `deploy-to-vercel`: sem CLI da Vercel logada, o fallback envia um tarball do projeto
  para um endpoint da Vercel e gera um deploy "reivindicável". As rédeas exigem
  confirmação antes de deploy, mas fique atento.
