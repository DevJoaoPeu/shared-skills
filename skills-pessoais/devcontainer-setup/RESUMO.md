# devcontainer-setup

**Para quê:** Gerar `.devcontainer/` com Claude Code, ferramentas da linguagem (Python/Node/Rust/Go) e volumes persistentes — ambiente reproduzível e isolado (sandbox) para a IA trabalhar.

**Quando usar:**
- Projeto novo que você quer abrir igual em qualquer máquina.
- Quer rodar a IA com mais autonomia sem risco para a sua máquina.

**Quando não usar:**
- Dúvidas gerais de Docker; projetos que já têm devcontainer.

**Como acionar:** "configura um devcontainer para esse projeto". Ou pelo nome: `/devcontainer-setup`.

**Atenção:** Precisa de Docker e do `@devcontainers/cli`.

**Escopo:** pessoal (só com `install.sh --projeto`) · **Origem:** [trailofbits/skills](https://github.com/trailofbits/skills) @ `82fe822`
