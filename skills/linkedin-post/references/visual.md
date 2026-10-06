# Visual: imagem e carrossel

O visual é HTML/CSS (`assets/template.html`) convertido em PNG/PDF pelo
`scripts/render.sh` com Chrome headless. Tamanho fixo **1080×1350** (retrato 4:5, o que
mais ocupa o feed no celular).

## Material real primeiro

Visual polido e genérico é o que mais parece IA. Na ordem:

1. **Material do autor**: print do código no editor dele, terminal, log, painel
   (RabbitMQ Management, Grafana, EXPLAIN do banco), diagrama que ele desenhou
   (Excalidraw, quadro, papel). Peça na entrevista (Etapa 2).
2. **Template em volta do material**: use o print como imagem dentro do slide
   (`<img src="print.png" style="width:100%;border-radius:16px">`), com título e uma
   frase de contexto. Copie o arquivo para a pasta de trabalho antes de renderizar.
3. **Só template**: texto, código redigitado ou diagrama SVG — quando não há material.

Sem enfeite: nada de ícone genérico, emoji em slide, ilustração de "pessoa com laptop"
ou foto de banco de imagens. Espaço vazio é melhor que decoração.

Antes de usar um print, confira se não aparece segredo, token, dado de cliente, e-mail
ou URL interna; se aparecer, peça outro ou cubra com um retângulo no slide.

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
