# Boas práticas de desenvolvimento

Padrões genéricos, independentes de linguagem e de projeto. Convenção já estabelecida
no repositório vence esta lista — consistência local importa mais que preferência.

## Antes de escrever

- Leia o código ao redor e siga o estilo, nomes, estrutura de pastas e bibliotecas que
  já estão em uso. Procure se já existe uma função/componente que resolve o problema
  antes de criar outro.
- Entenda a causa antes de corrigir. Bug sem causa identificada não está corrigido.
- Para mudanças maiores que alguns arquivos, apresente um plano curto antes.

## Design de código

- **Simples primeiro (KISS/YAGNI)**: resolva o problema de hoje. Nada de abstração,
  configuração ou "extensibilidade" para casos que não existem.
- **Abstraia na terceira repetição**, não na primeira. Duplicação pequena é mais
  barata que a abstração errada.
- Funções pequenas com uma responsabilidade; prefira retorno antecipado a `if`s aninhados.
- Nomes que dizem o que a coisa é/faz. Evite abreviações e nomes genéricos
  (`data`, `info`, `handle`, `utils`, `manager`).
- Prefira dados imutáveis e funções puras; isole efeitos colaterais (I/O, rede, banco)
  nas bordas.
- Tipagem estrita. Tipos descrevem o domínio; evite `any`/`object`/`dict` soltos.
- Sem números e strings mágicas: constantes nomeadas.

## Erros e validação

- Valide entrada não confiável na borda (API, formulário, arquivo, variável de ambiente)
  e confie nos tipos dali para dentro.
- Falhe cedo e alto. Nunca engula exceção (`catch {}` vazio, `except: pass`).
- Mensagens de erro úteis: o que falhou, com qual entrada (sem dado sensível), e o que fazer.
- Trate o caminho de erro e os estados vazios/limite, não só o caminho feliz.

## Segurança

- Queries parametrizadas sempre; nunca concatene entrada em SQL, shell ou HTML.
- Autorização é verificada no servidor, em todo acesso — nunca confie no cliente.
- Nada de dado pessoal, token ou segredo em log, mensagem de erro ou URL.
- Segredos só via variável de ambiente/secret manager; nunca no código.
- Menor privilégio para tokens, usuários de banco e permissões.

## Performance

- Não otimize sem medir — mas evite os erros óbvios: consulta dentro de loop (N+1),
  I/O síncrono em caminho quente, listas sem paginação, carregar tudo em memória.

## Testes

- Comportamento novo ou alterado vem com teste. Correção de bug começa com um teste
  que reproduz o bug e falha.
- Teste comportamento observável, não detalhe de implementação.
- Testes determinísticos e independentes: sem depender de ordem, relógio, rede ou
  dado compartilhado.
- Mock só nas fronteiras (rede, serviços externos, tempo) — não mocke o que está testando.

## Comentários e documentação

- Comentário explica **por quê** (decisão, restrição, armadilha), não **o quê**.
- Não deixe código comentado, `console.log`/`print` de debug ou TODO sem contexto.
- Mudou comportamento público, configuração ou forma de rodar o projeto? Atualize o README/docs.

## Git

- Commits pequenos e atômicos, cada um compilando e passando nos testes.
- Mensagens no padrão Conventional Commits (`feat:`, `fix:`, `refactor:`, `test:`,
  `docs:`, `chore:`), explicando o porquê quando não for óbvio.
- Uma branch por mudança; não misture refactor com feature no mesmo commit.

## Antes de dizer que terminou

1. Rode type-check, lint e os testes afetados (use os scripts do projeto).
2. Revise o próprio diff: sobrou debug, arquivo não relacionado, segredo, TODO?
3. Se tem interface, execute o fluxo de verdade — teste unitário não prova a tela.
4. Relate o que mudou, o que rodou, o resultado e o que ficou pendente.

## Comunicação

- Responda em português. Código, identificadores e mensagens de commit seguem o
  idioma já usado no repositório (na falta de padrão, inglês).
- Seja direto: resultado primeiro, detalhes depois. Referencie código como `arquivo:linha`.
