# historico.md — memória dos posts

Fica em `<output_dir>/historico.md`, ao lado das pastas dos posts. É do usuário: ele
pode editar à mão. Leia inteiro na Etapa 0; edite só a entrada que mudou.

## Status

| Status | Significa | Pode sugerir de novo? |
|---|---|---|
| `importado` | Pasta que já existia antes do histórico | Só com ângulo novo |
| `rascunho` | Skill gerou e salvou; ainda não publicado | Não |
| `publicado` | Usuário confirmou que postou | Só com ângulo novo |
| `backlog` | Ideia sugerida e não escolhida | Sim, marcada `(backlog)` |
| `recusada` | Usuário disse que não quer | Não |

## Formato

```markdown
# Histórico de posts

## Posts

### dead-letter-queue
- Status: publicado em 2026-10-07
- Formato: carrossel
- Tags: mensageria, rabbitmq, nestjs, resiliência
- Resumo: O que é DLQ, por que evita perda e loop de mensagem, custos e boas práticas;
  repo com retry + DLQ em NestJS/RabbitMQ.
- Resultado: 80 reações, 12 comentários — perguntaram sobre idempotência.

### big-o-notation
- Status: importado
- Formato: imagem
- Tags: algoritmos, fundamentos
- Resumo: Notação Big O com exemplos de complexidade comuns.

## Backlog de ideias

- 2026-10-06 · Outbox pattern: por que publicar evento dentro da transação falha
  — tags: mensageria, postgresql — fonte: <url>

## Recusadas

- 2026-10-06 · Opinião sobre vibe coding — "não quero entrar em polêmica"
```

## Regras

- O título de cada post (`###`) é o slug da pasta, para ligar entrada e arquivos.
- **Tags** comparam assunto entre posts: 3–5, em minúsculas, do conceito, não da
  notícia (`idempotência`, não `outage-cloudflare-out-2026`).
- **Resumo**: 1–2 linhas sobre o que o post ensina/argumenta — é o que impede ideia
  repetida, então seja específico.
- **Resultado** é opcional e vem do usuário; nunca estime.
- Recusada: guarde o motivo quando ele disser — ajuda a não sugerir algo parecido.
