# verification-before-completion

**Para quê:** Proibir a IA de dizer "pronto", "corrigido" ou "passando" sem ter rodado o comando que prova isso e lido a saída.

**Quando usar:**
- Sempre, antes de concluir uma tarefa, commitar ou abrir PR — dispara sozinha.
- Quando a IA costuma declarar sucesso cedo demais.

**Quando não usar:**
- Nunca é desligada; é o reforço da seção "Honestidade no relato" das rédeas.

**Como acionar:** automático; ou "verifica antes de dizer que terminou". Ou pelo nome: `/verification-before-completion`.

**Escopo:** global (todo projeto) · **Origem:** [obra/superpowers](https://github.com/obra/superpowers) @ `8ca22db`
