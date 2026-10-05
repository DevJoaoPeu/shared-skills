# webapp-testing

**Para quê:** Testar uma aplicação web local de verdade com **Playwright**: abre o navegador, clica, preenche, tira screenshot, lê logs do console. Inclui script que sobe o servidor de dev, roda o teste e derruba.

**Quando usar:**
- Provar pela tela que uma feature funciona.
- Depurar comportamento de UI ("o botão não faz nada").
- Criar testes E2E pontuais.

**Quando não usar:**
- Teste unitário de componente — use o runner do projeto.

**Como acionar:** "testa o fluxo de login no navegador", "tira um print da tela X". Ou pelo nome: `/webapp-testing`.

**Atenção:** Precisa de Python e `playwright` instalados (`pip install playwright && playwright install chromium`).

**Escopo:** global (todo projeto) · **Origem:** [anthropics/skills](https://github.com/anthropics/skills) @ `683bc88`
