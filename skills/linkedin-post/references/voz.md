# voz.md — como o autor escreve

Fica em `<output_dir>/voz.md`. É o que impede o texto de soar genérico: descreve o
jeito **dele**, não boas práticas em geral. Ele pode editar à mão.

## Como nasce

Na primeira execução, leia 3–5 posts antigos e anote só o que aparece em mais de um:
como abre, tamanho, pessoa gramatical, marcadores de lista, emoji, como fecha, palavras
que ele usa. Marque tudo como `observado` — ainda não é regra.

## Como cresce

Depois de cada post publicado, compare `post.md` (rascunho da skill) com
`post-publicado.md` (o que foi ao ar). Cada diferença é um sinal:

- Ele cortou → candidato a **evitar**.
- Ele trocou uma palavra/expressão → anote `X → Y`.
- Ele acrescentou (detalhe, piada, opinião) → o que faltava no rascunho.

Visto uma vez: `observado`. Visto duas ou mais: `regra`. Nunca transforme em regra algo
que ele não fez.

## Formato

```markdown
# Voz

## Regras
- Abre com situação ou pergunta concreta, nunca com contexto genérico. (3 posts)
- Corta a frase final de "moral da história" quando ela repete o post. (2 posts)
- "utilizar" → "usar". (2 posts)

## É dele (o checador pode apontar, mas fica)
- "No fim, …" para fechar.
- 🔹 como marcador de lista numerada.

## Observado
- Fala do tempo de mercado ("há mais de 2 anos…") quando o post é sobre prática. (1 post)

## Evitar
- Travessão no meio da frase; ele troca por vírgula ou ponto. (2 posts)
```

A seção **É dele** é o que libera trechos que o `checar-texto.py` aponta: o script
procura padrões típicos de IA, mas alguns são hábitos reais do autor.
