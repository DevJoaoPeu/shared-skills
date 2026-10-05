# property-based-testing

**Para quê:** Escrever e revisar testes **por propriedade** (fast-check, Hypothesis, proptest…): em vez de exemplos escolhidos à mão, gera centenas de entradas e verifica uma regra que sempre deve valer.

**Quando usar:**
- Código com regra clara: serializar/desserializar, parser, validador, cálculo de dinheiro, ordenação, invariantes (ex.: "nunca vaza dado de outro tenant").
- Um teste por propriedade achou um contraexemplo e você quer saber se é bug ou propriedade errada.

**Quando não usar:**
- Teste E2E de UI, benchmark, fuzzing de binário.

**Como acionar:** "escreve testes por propriedade para essa função". Ou pelo nome: `/property-based-testing`.

**Escopo:** global (todo projeto) · **Origem:** [trailofbits/skills](https://github.com/trailofbits/skills) @ `82fe822`
