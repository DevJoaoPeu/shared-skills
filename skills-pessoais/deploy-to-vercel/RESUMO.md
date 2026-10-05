# deploy-to-vercel

**Para quê:** Fazer deploy (preview por padrão) na Vercel, levando o projeto para o setup ideal: repo ligado à Vercel com deploy a cada push.

**Quando usar:**
- "Coloca no ar", "me dá um link de preview" em projeto pessoal.

**Quando não usar:**
- Projetos que não hospedam na Vercel; produção sem pedir explicitamente.

**Como acionar:** "faz deploy de preview na Vercel". Ou pelo nome: `/deploy-to-vercel`.

**Atenção:** Sem a CLI da Vercel logada, o fallback **envia o projeto compactado** para um endpoint da Vercel e gera um deploy "reivindicável". Garanta `vercel login` antes se não quiser isso.

**Escopo:** pessoal (só com `install.sh --projeto`) · **Origem:** [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) @ `063bee9`
