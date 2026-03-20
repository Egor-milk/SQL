--GIN--

EXPLAIN
SELECT *
FROM perf_test
WHERE reason LIKE '%bc%';
--seq scan так как изменили условие LIKE--

CREATE EXTENSION pg_trgm

CREATE INDEX trgm_idx_perf_test_reason ON perf_test
USING gin (reason gin_trgm_ops)

EXPLAIN ANALYZE
SELECT *
FROM perf_test
WHERE reason LIKE '%bc%'; -- опять seq scan 


EXPLAIN ANALYZE --но ессли сильно уменьшить выборку то
SELECT * --задействован будет bitmap index scan--
FROM perf_test
WHERE reason LIKE '%dfe%';