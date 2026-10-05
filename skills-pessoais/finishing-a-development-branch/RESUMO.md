# finishing-a-development-branch

**Para quê:** Fechar uma branch de forma segura: roda os testes, descobre a branch base e te **apresenta as opções** (merge local, abrir PR, manter ou descartar), executa a escolhida e limpa o worktree.

**Quando usar:**
- Implementação pronta e testes passando.

**Quando não usar:**
- Com testes falhando — ela para e manda corrigir primeiro.

**Como acionar:** "terminei, vamos fechar essa branch". Ou pelo nome: `/finishing-a-development-branch`.

**Atenção:** Executa `git push`, merge e `git branch -D` conforme a opção — sempre pergunta antes, e as rédeas exigem confirmação.

**Escopo:** pessoal (só com `install.sh --projeto`) · **Origem:** [obra/superpowers](https://github.com/obra/superpowers) @ `8ca22db`
