# Como escrever o post

## Tom

- Use o tom dos posts antigos do autor quando existirem (Etapa 0). Sem eles: primeira
  pessoa, direto, de dev para dev, aprendendo em público — "venho estudando", "percebi
  que", "no meu dia a dia".
- Explique como explicaria para um colega no café: frase curta, termo técnico correto,
  sem jargão de marketing.
- Mostre o custo, não só o benefício. Seção de **desvantagens / trade-offs** é marca
  registrada de post técnico bom.

## Estrutura

1. **Gancho (1–2 linhas)** — é o que aparece antes do "…ver mais". Pergunta concreta,
   afirmação contraintuitiva, citação curta, ou situação real. Nada de introdução.
2. **Contexto** — por que isso importa agora (a notícia, o problema).
3. **Corpo** — o conceito/argumento em blocos curtos: listas, passos numerados, antes
   × depois. Parágrafos de no máximo 3 linhas, linha em branco entre eles.
4. **Trade-offs / quando não usar.**
5. **Fechamento** — uma frase que resume o aprendizado + convite (pergunta específica
   ao leitor, ou "link do repo nos comentários").
6. **3–5 hashtags** no fim, específicas (#nestjs, #postgresql) mais que genéricas.

## Evite

- Aberturas genéricas: "No mundo atual…", "Vamos mergulhar…", "Você sabia que…?",
  "Em um cenário cada vez mais…".
- Emoji em toda linha; use no máximo como marcador de lista (🔹) ou um no fechamento.
- Negrito/itálico com caracteres Unicode especiais — leitores de tela não leem.
- Números, benchmarks ou citações sem fonte.
- Link no corpo do post: a convenção é colocar no primeiro comentário.
- Prometer o que o post não entrega ("o guia definitivo").

## Formatos que funcionam para conteúdo técnico

- **Conceito em 5 minutos**: o que é → como funciona → quando usar → custo.
- **Antes × depois**: código ou arquitetura, com o porquê da mudança.
- **Lição de implementação**: o que construí, o que deu errado, o que mudaria.
- **Notícia comentada**: o que aconteceu → o que isso ensina → o que fazer.
- **Comparação A × B**: tabela no carrossel, critério de escolha no texto.

## Checklist de publicação (entregar no fim)

- [ ] Gancho cabe nas 2 primeiras linhas.
- [ ] Toda afirmação factual tem fonte em `fontes.md`.
- [ ] Nada inventado sobre a experiência do autor.
- [ ] Carrossel: subir `carrossel.pdf` como **documento** e dar um título a ele.
- [ ] Imagem: subir o PNG e preencher o texto alternativo.
- [ ] Links e repo no primeiro comentário.
- [ ] Horário: manhã cedo (7h–9h), meio da manhã (10h–11h) ou almoço (12h–13h) costumam
      ser boas janelas — confira nas métricas do próprio perfil.
- [ ] Responder os comentários na primeira hora.
