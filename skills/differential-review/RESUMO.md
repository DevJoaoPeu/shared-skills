# differential-review

**Para quê:** Revisão de **segurança** de um diff/PR: usa `git blame` para contexto, mede o raio de impacto (quem chama o código alterado), checa se a mudança reabre bug antigo e se o código alterado tem teste. Gera relatório em markdown.

**Quando usar:**
- Antes de mergear PR que mexe em autenticação, autorização, dinheiro, dados pessoais ou entrada externa.
- "O que mais essa mudança pode quebrar?"

**Quando não usar:**
- Código novo sem histórico, mudança só de docs ou formatação — use revisão normal (`/code-review`).

**Como acionar:** "faz uma revisão de segurança desse PR/branch". Ou pelo nome: `/differential-review`.

**Atenção:** Mais pesado que uma revisão comum; use em mudanças sensíveis.

**Escopo:** global (todo projeto) · **Origem:** [trailofbits/skills](https://github.com/trailofbits/skills) @ `82fe822`
