# Onde procurar assunto atual

Objetivo: achar algo que aconteceu **recentemente** e que dá para conectar a um
conceito que o autor domina. Notícia sozinha envelhece; notícia + conceito vira post.

## Consultas (WebSearch, em paralelo)

Substitua `<mês ano>` pelo mês atual e `<tech>` por itens da stack do autor.

- `<tech> release <mês ano>` / `<tech> new version changelog`
- `postmortem outage <mês ano>` / `incident report engineering blog <mês ano>`
- `engineering blog how we scaled <mês ano>`
- `CVE <tech> <mês ano>` (vulnerabilidade em lib popular)
- `Hacker News top <tema>` / `site:news.ycombinator.com <tema>`
- `tendência desenvolvimento software <mês ano>` (recorte brasileiro)
- `AI coding agents <mês ano>` (IA aplicada ao dia a dia do dev rende bem — mas evite
  hype sem substância)

## Fontes de confiança

| Tipo | Onde |
|---|---|
| Agregadores | news.ycombinator.com, lobste.rs, thenewstack.io, infoq.com |
| Newsletters | newsletter.pragmaticengineer.com, blog.bytebytego.com |
| Blogs de engenharia | blog.cloudflare.com, netflixtechblog.com, github.blog, discord.com/blog, stripe.com/blog/engineering, uber.com/blog/engineering |
| Releases | GitHub Releases do projeto, blog oficial (nodejs.org/en/blog, postgresql.org, redis.io/blog, devblogs.microsoft.com/typescript) |
| Segurança | github.com/advisories, nvd.nist.gov |

Prefira a fonte primária (anúncio oficial, postmortem da empresa) ao artigo que a
repercute. Registre URL e data em `fontes.md`.

## Transformando notícia em ângulo

| Notícia | Ângulo de post |
|---|---|
| Incidente/outage | O padrão que teria evitado (circuit breaker, DLQ, idempotência, feature flag) |
| Lançamento de versão | 1–3 mudanças que afetam o código do dia a dia, com antes/depois |
| Artigo "how we scaled" | O trade-off que eles aceitaram e quando você **não** deveria copiar |
| CVE | Como checar se você é afetado + a prática que reduz o risco |
| Debate/opinião viral | Sua posição com um trade-off concreto, sem ataque a pessoas |
