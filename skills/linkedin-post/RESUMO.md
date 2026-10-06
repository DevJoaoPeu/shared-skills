# linkedin-post

**Para quê:** Sair do "não sei o que postar" com um post técnico pronto. Pesquisa assuntos atuais de tecnologia, propõe ideias com ângulo e fonte, escreve o texto no seu tom (lendo seus posts antigos) e gera imagem única ou carrossel PDF 1080×1350 a partir de HTML.

**Quando usar:**
- "Me dá ideias de post", "transforma esse estudo/projeto em post", "faz um carrossel sobre X".

**Quando não usar:**
- Publicar ou interagir na conta do LinkedIn — a skill só gera arquivos.

**Como acionar:** "quero um post para o LinkedIn sobre…" ou `/linkedin-post`.

**Configuração (opcional):** `~/.config/linkedin-post/config.json`

```json
{
  "output_dir": "~/Downloads/linkedin-posts",
  "author_name": "Seu Nome",
  "author_handle": "in/seu-handle",
  "accent": "#F97316",
  "stack": ["NestJS", "PostgreSQL", "Angular", "AWS"]
}
```

Sem `output_dir`, a skill pergunta onde salvar e sugere `~/Downloads/linkedin-posts`. Cada post vira `<output_dir>/<slug>/` com `post.md`, `fontes.md`, `slides.html`, `slide-NN.png` e `carrossel.pdf`.

**Histórico:** `<output_dir>/historico.md` guarda cada post (rascunho → publicado, resumo, tags, resultado), o backlog de ideias não escolhidas e as recusadas. A skill usa isso para não repetir ideia e para sugerir continuações do que foi bem. Na primeira execução, monta o histórico a partir das pastas que já existem. Pode editar à mão.

**Contra "cara de IA":** entrevista obrigatória antes de escrever (vivência real, números, erros), `<output_dir>/voz.md` que aprende com o que você muda entre o rascunho e o que publicou, `scripts/checar-texto.py` que aponta padrões típicos de IA, e visual com material seu (prints, diagramas) antes do template.

**Atenção:** O render usa Chrome/Chromium headless (`CHROME=<binário>` para forçar um) com perfil temporário. As fontes vêm do Google Fonts; offline, caem nas fontes do sistema. Pesquisa de atualidade depende de WebSearch.

**Escopo:** global · **Origem:** própria
