# supply-chain-risk-auditor

**Para quê:** Auditar o risco das **dependências**: vulnerabilidades conhecidas na versão exata (diretas e do lockfile), pacotes abandonados/arquivados, concentração de publicadores no npm e scripts que rodam na instalação.

**Quando usar:**
- Antes de adotar uma dependência nova importante.
- Auditoria periódica de um projeto.
- Herdou um projeto e quer saber o que tem dentro.

**Quando não usar:**
- Revisar o código do próprio projeto — use `differential-review`.

**Como acionar:** "audita as dependências desse projeto". Ou pelo nome: `/supply-chain-risk-auditor`.

**Atenção:** Precisa de `uv` (roda os scripts Python) e de internet para consultar bases de vulnerabilidade.

**Escopo:** global (todo projeto) · **Origem:** [trailofbits/skills](https://github.com/trailofbits/skills) @ `82fe822`
