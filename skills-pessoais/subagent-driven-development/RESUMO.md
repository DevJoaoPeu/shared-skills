# subagent-driven-development

**Para quê:** Executar um plano despachando **um subagente novo por tarefa**, com revisão (spec + qualidade) entre tarefas. Mantém o contexto principal limpo e acelera trabalho longo.

**Quando usar:**
- Plano com várias tarefas independentes.
- Sessões longas onde o contexto enche.

**Quando não usar:**
- Plano curto ou tarefas muito acopladas — use `executing-plans`.

**Como acionar:** "executa o plano com subagentes". Ou pelo nome: `/subagent-driven-development`.

**Atenção:** Consome mais tokens (vários agentes + revisores).

**Escopo:** pessoal (só com `install.sh --projeto`) · **Origem:** [obra/superpowers](https://github.com/obra/superpowers) @ `8ca22db`
