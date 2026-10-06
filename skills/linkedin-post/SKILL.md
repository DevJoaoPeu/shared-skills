---
name: linkedin-post
description: Cria posts técnicos para LinkedIn de ponta a ponta — pesquisa assuntos atuais de tecnologia, propõe ideias com ângulo e fontes, escreve o texto no tom do autor e gera o visual (imagem única ou carrossel PDF 1080×1350 a partir de HTML), salvando tudo numa pasta por post. Use quando o usuário pedir "post para o LinkedIn", "ideia de post", "carrossel", "o que postar", "conteúdo técnico para LinkedIn", ou quiser transformar um estudo/projeto/notícia em post.
---

# linkedin-post

Transforma "não sei o que postar" em um post técnico pronto: texto + visual + fontes,
salvos numa pasta por ideia. O autor é desenvolvedor; o público são outros devs e
pessoas de tecnologia.

Siga as etapas em ordem. Cada etapa termina com o usuário escolhendo ou aprovando —
não pule para a próxima sozinho.

## Etapa 0 — Contexto (sem perguntar nada ainda)

1. Leia a configuração em `~/.config/linkedin-post/config.json`, se existir:
   ```json
   {
     "output_dir": "~/Downloads/linkedin/linkedin",
     "author_name": "Nome Sobrenome",
     "author_handle": "in/handle",
     "accent": "#F97316",
     "stack": ["NestJS", "PostgreSQL", "RabbitMQ"]
   }
   ```
   Todos os campos são opcionais. Sem arquivo, siga com os padrões e pergunte o
   necessário só na hora de usar (destino na Etapa 5).
2. Leia `<output_dir>/historico.md` (formato em `references/historico.md`). Ele diz o
   que já foi publicado, o que está em rascunho, o backlog de ideias e o que foi
   recusado.
   - Não existe, mas `output_dir` tem subpastas de posts → crie o histórico a partir
     delas (status `importado`, resumo de 1–2 linhas lido do texto de cada pasta) e
     avise o usuário.
   - Há entradas em `rascunho` → pergunte, numa linha só, quais foram publicadas e, se
     ele souber, como foram (reações, comentários). Atualize o arquivo.
3. Leia 2–3 textos de posts `publicado`/`importado` (`post.md`, `*.txt`) para captar o
   tom (pessoa gramatical, tamanho, uso de emoji, como fecha o post).

## Etapa 1 — Ideias

Se o usuário já trouxe o assunto, vá para a Etapa 2. Senão:

1. Pesquise com WebSearch o que aconteceu nos **últimos 30 dias** (prefira 7). Fontes e
   consultas em `references/fontes.md`. Rode as buscas em paralelo.
2. Cruze com a stack do autor (config `stack` ou o que o histórico mostra) e com
   temas atemporais que viram atuais por causa de uma notícia (ex.: incidente público →
   post sobre retry/idempotência).
3. Use o histórico:
   - **Não sugira** ideia igual ou muito próxima de uma que esteja `publicado`,
     `importado`, `rascunho` ou `recusada`. Retomar um tema só vale com ângulo novo e
     explícito ("parte 2", "agora em produção", "o contra-argumento").
   - Posts com resultado bom indicam o que o público dele quer: proponha continuações
     (aprofundar, série, caso prático do mesmo tema).
   - Inclua no máximo 2 ideias do backlog, marcadas `(backlog)`, quando ainda fizerem
     sentido hoje.
3. Entregue **5 a 8 ideias**, cada uma assim:

   ```
   N. <título curto>
      Gancho: <primeira linha do post>
      Ângulo: <o que o post ensina/argumenta, em uma frase>
      Formato: texto | imagem | carrossel  — <por quê>
      Por que agora: <notícia/lançamento + data>  [link]
   ```

   Misture tipos: notícia comentada, conceito explicado, opinião com trade-off,
   "o que aprendi implementando X", comparação A × B.
4. Pergunte qual ideia seguir (pode ser uma combinação) e o que fazer com as outras:
   por padrão vão para o backlog; as que ele disser que não quer vão para `recusada`.
   Grave no histórico logo depois da resposta.

## Etapa 2 — Ângulo e matéria-prima

Antes de escrever, confirme com o usuário em **uma** mensagem:

- Formato final (texto, imagem única, carrossel).
- **Experiência real**: ele estudou, implementou ou viveu isso? Tem repositório, print,
  número, livro/curso? Peça o material. **Nunca invente experiência, métrica, empresa ou
  resultado** — se não houver vivência, o post é explicativo/opinativo e diz isso.
- Se for série (parte 1, 2…), qual parte é esta.

## Etapa 3 — Texto

Escreva seguindo `references/escrita.md`. Entregue no chat:

1. O post completo, pronto para colar (máx. 3000 caracteres; mire 900–1800).
2. Duas alternativas de gancho.
3. Sugestão do primeiro comentário (links, repo, fonte), se houver.

Toda afirmação factual (versão, data, número, comportamento de ferramenta) precisa ter
fonte verificada nesta sessão; se não conseguir verificar, remova ou marque como opinião.
Itere até o usuário aprovar.

## Etapa 4 — Visual (se não for só texto)

1. Copie `assets/template.html` para a pasta de trabalho como `slides.html` e
   preencha. Regras de design e tipos de slide em `references/visual.md`. Rodapé com
   `author_name`/`author_handle` do config; sem eles, pergunte uma vez e ofereça gravar
   no config.
   - Imagem única: 1 `<section class="slide">`.
   - Carrossel: 6–10 slides — capa com gancho, 1 ideia por slide, fechamento com CTA.
2. Renderize:
   ```bash
   <skill>/scripts/render.sh <pasta>/slides.html <pasta>
   ```
   Gera `slide-01.png`… e `carrossel.pdf` (PDF só quando há mais de 1 slide).
3. **Olhe as imagens** (Read nos PNGs) antes de mostrar: texto cortado, sobreposição,
   contraste ruim, código ilegível? Corrija e renderize de novo.
4. Mostre ao usuário e itere até aprovar.

Trabalhe numa pasta temporária (scratchpad) até a Etapa 5.

## Etapa 5 — Salvar

1. Destino:
   - Config com `output_dir` → use sem perguntar.
   - Sem config → **pergunte** onde salvar, sugerindo `~/Downloads/linkedin-posts`.
     Ofereça criar o `config.json` com a resposta para não perguntar de novo.
2. Pasta do post: `<output_dir>/<slug-da-ideia>/` (slug em minúsculas, com `-`, sem
   acento). Série: `<slug>/parte-N/`. Se a pasta já existir, pergunte antes de
   sobrescrever.
3. Conteúdo:
   ```
   post.md          texto final + ganchos alternativos + primeiro comentário
   fontes.md        links usados, com data de acesso
   slides.html      fonte editável do visual (se houver)
   slide-NN.png     imagens
   carrossel.pdf    se carrossel
   ```
4. Registre o post em `<output_dir>/historico.md` com status `rascunho` (e tire do
   backlog se veio de lá). Quando o usuário confirmar que publicou — agora ou numa
   próxima sessão —, mude para `publicado` com a data.
5. Termine com o caminho da pasta e o checklist de publicação de `references/escrita.md`.

## Não faça

- Não publique nem acesse a conta do LinkedIn — a skill só produz arquivos.
- Não use logo/marca de terceiros como se fosse do autor; logos de tecnologia só como
  ilustração do assunto.
- Não copie texto de outro post/artigo; resuma e cite.
