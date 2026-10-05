# vercel-composition-patterns

**Para quê:** Padrões de composição de componentes React que escalam: compound components, context providers, evitar a explosão de props booleanas. Inclui mudanças da API do React 19.

**Quando usar:**
- Componente com muitas props `isX`/`showY` virando bagunça.
- Desenhar componente reutilizável ou biblioteca de componentes.

**Quando não usar:**
- Componente simples de uso único.

**Como acionar:** "refatora esse componente, tem prop demais". Ou pelo nome: `/vercel-composition-patterns`.

**Escopo:** global (todo projeto) · **Origem:** [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) @ `063bee9`
