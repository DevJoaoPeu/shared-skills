# skill-creator

**Para quê:** Criar uma skill nova ou melhorar uma existente: estrutura o `SKILL.md`, roda avaliações (com e sem a skill), compara resultados e otimiza a descrição para disparar na hora certa.

**Quando usar:**
- Você repete as mesmas instruções para a IA com frequência → vire skill.
- Uma skill sua dispara quando não devia (ou não dispara quando devia).

**Quando não usar:**
- Regra que vale sempre — isso é regra em `rules/`, não skill.

**Como acionar:** "cria uma skill para…", "melhora a descrição da skill X". Ou pelo nome: `/skill-creator`.

**Atenção:** Os scripts de avaliação usam Python e rodam o próprio Claude várias vezes — consome tokens.

**Escopo:** global (todo projeto) · **Origem:** [anthropics/skills](https://github.com/anthropics/skills) @ `683bc88`
