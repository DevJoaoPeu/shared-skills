# Visual: imagem e carrossel

O visual é HTML/CSS (`assets/template.html`) convertido em PNG/PDF pelo
`scripts/render.sh` com Chrome headless. Tamanho fixo **1080×1350** (retrato 4:5, o que
mais ocupa o feed no celular).

## Princípios

- **Uma ideia por slide.** Se precisa de dois parágrafos, são dois slides.
- **Legível no celular**: título ≥ 64px, corpo ≥ 34px, código ≥ 26px. No máximo ~40
  palavras por slide de texto, ~14 linhas de código.
- **Hierarquia clara**: título curto, um destaque na cor de acento, o resto neutro.
- **Consistência**: mesma margem, fonte e posição de rodapé em todos os slides.
- **Contraste**: texto claro em fundo escuro (ou o contrário), nunca cinza sobre cinza.
- Use `accent` do config quando existir (variável CSS `--accent`).

## Tipos de slide (classes no template)

| Classe | Uso |
|---|---|
| `slide cover` | Capa: gancho grande + subtítulo. Primeiro slide do carrossel. |
| `slide` (padrão) | Título + texto ou lista curta. |
| `slide code` | Título + bloco `<pre><code>`. Destaque linhas com `<mark>`. |
| `slide compare` | Duas colunas `.col` (A × B, antes × depois). |
| `slide diagram` | Título + `<svg>` inline com caixas e setas. |
| `slide cta` | Fechamento: resumo em uma frase + convite (salvar, comentar, seguir). |

## Carrossel

- 6–10 slides: capa → contexto → 3–6 de conteúdo → trade-offs → CTA.
- O contador `n/total` e o rodapé com nome/handle aparecem em todos os slides
  (preenchidos pelo script do template).
- A capa precisa funcionar sozinha: é a miniatura no feed.

## Diagramas

- SVG inline, `viewBox="0 0 960 900"`, caixas com `rx="16"`, setas com `marker-end`.
- Máximo ~7 caixas; rótulos com 1–3 palavras.
- Cores: caixas em `var(--surface)`, borda/seta de destaque em `var(--accent)`.

## Código

- Escape `<`, `>` e `&` dentro de `<pre><code>`.
- Só o trecho que importa; corte imports e boilerplate com `// ...`.
- O destaque de sintaxe é manual: envolva palavras-chave em `<span class="k">`,
  strings em `<span class="s">`, comentários em `<span class="c">`.

## Verificação

Depois de renderizar, abra cada PNG (Read) e confira: nada cortado na borda, nada
sobreposto, código sem quebra estranha, contador correto. Corrija e renderize de novo.
