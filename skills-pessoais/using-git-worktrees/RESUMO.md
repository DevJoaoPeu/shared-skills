# using-git-worktrees

**Para quê:** Criar um workspace isolado (git worktree) para a tarefa, instalar dependências e confirmar que os testes passam **antes** de começar — sem mexer na branch em que você está.

**Quando usar:**
- Começar feature enquanto há outra em andamento.
- Antes de executar um plano.

**Quando não usar:**
- Mudança rápida na branch atual.

**Como acionar:** "faz isso num worktree separado". Ou pelo nome: `/using-git-worktrees`.

**Atenção:** Cada worktree tem seu próprio `node_modules`/venv — ocupa disco.

**Escopo:** pessoal (só com `install.sh --projeto`) · **Origem:** [obra/superpowers](https://github.com/obra/superpowers) @ `8ca22db`
