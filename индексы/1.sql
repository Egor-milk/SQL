CREATE TABLE perf_test(
	id int, 
	reason text COLLATE "C", --не использовать соллейшн--
	annotation text COLLATE "C"
);

INSERT INTO perf_test(id, reason, annotation)
SELECT s.id, md5(random()::text), null --md5 шифровальная функцичя
FROM generate_series(1, 10000000) AS s(id)
ORDER BY random();

UPDATE perf_test
SET annotation = UPPER(md5(random()::text));

EXPLAIN
SELECT * FROM perf_test
WHERE id = 3700000

--попытка сделать поиск по id-- 

CREATE INDEX idx_perf_test_id ON perf_test(id);

EXPLAIN ANALYZE
SELECT *
FROM perf_test
WHERE reason LIKE 'bc%' AND annotation LIKE 'AB%'

--ANALYZE PERF_TEST;

CREATE INDEX idx_perf_text_reason_annotation 
ON perf_test(reason, annotation);

EXPLAIN
SELECT *
FROM perf_test
WHERE reason LIKE 'bc%';


EXPLAIN --parallel seq scan--
SELECT *
FROM perf_test
WHERE annotation LIKE 'AB%'

CREATE INDEX idx_perf_test_annotation ON perf_test(annotation)

EXPLAIN --now   ->  Bitmap Index Scan--
SELECT *
FROM perf_test
WHERE annotation LIKE 'AB%'

EXPLAIN -- опять parallel seq scan--
SELECT * -- так как поиск по индексам с выражениями так не работает--
FROM perf_test --нужно строить отдельных индекс для опр функций--
WHERE LOWER(annotation) LIKE ('ab%')

CREATE INDEX idx_perf_test_annotation_lower ON perf_test(LOWER(annotation));

EXPLAIN -- now   ->  Bitmap Index Scan--
SELECT *  
FROM perf_test 
WHERE LOWER(annotation) LIKE ('ab%')