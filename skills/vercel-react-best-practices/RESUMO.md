# vercel-react-best-practices

**Para quê:** Regras de performance de React/Next.js da engenharia da Vercel, priorizadas por impacto: eliminar cascata de requests, tamanho de bundle, server components, re-render, etc.

**Quando usar:**
- Escrever, revisar ou refatorar componentes React ou páginas Next.js.
- Página lenta, bundle grande, re-render demais.

**Quando não usar:**
- Projetos sem React.

**Como acionar:** automático em código React; ou "revisa a performance desse componente". Ou pelo nome: `/vercel-react-best-practices`.

**Atenção:** Algumas regras são específicas de Next.js/Vercel — ignore-as em Vite/SPA.

**Escopo:** global (todo projeto) · **Origem:** [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) @ `063bee9`
