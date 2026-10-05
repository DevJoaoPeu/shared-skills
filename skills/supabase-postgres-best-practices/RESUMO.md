# supabase-postgres-best-practices

**Para quê:** Boas práticas de PostgreSQL (vale para qualquer Postgres, não só Supabase): tipos de coluna, schema, migrations, índices, RLS, pgvector, filas/cron, diagnóstico de query lenta e locks.

**Quando usar:**
- Criar ou alterar tabela, coluna, índice, migration, função ou trigger.
- Query lenta, timeout, conexões esgotadas, `EXPLAIN` estranho.
- Dado aparecendo para o usuário/tenant errado.

**Quando não usar:**
- Bancos que não são Postgres.

**Como acionar:** automático ao mexer em SQL/schema; ou "por que essa query está lenta?". Ou pelo nome: `/supabase-postgres-best-practices`.

**Escopo:** global (todo projeto) · **Origem:** [supabase/agent-skills](https://github.com/supabase/agent-skills) @ `c9be0e9`
