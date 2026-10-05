# systematic-debugging

**Para quê:** Achar a **causa raiz** de um bug antes de propor correção. Impõe 4 fases: investigar → comparar com o que funciona → hipótese testada → corrigir com teste.

**Quando usar:**
- Bug, teste falhando, erro em produção, comportamento estranho.
- Você (ou a IA) já tentou 2 correções e nada resolveu.
- Teste intermitente/flaky — tem técnica de espera por condição e script para achar o teste que "polui" os outros.

**Quando não usar:**
- Erro óbvio de digitação ou de compilação com mensagem clara.

**Como acionar:** "investiga esse bug", "o teste X está falhando", "por que isso acontece?". Ou pelo nome: `/systematic-debugging`.

**Atenção:** Mais lento que "tentar e ver" — de propósito.

**Escopo:** global (todo projeto) · **Origem:** [obra/superpowers](https://github.com/obra/superpowers) @ `8ca22db`
