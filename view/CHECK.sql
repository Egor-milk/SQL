CREATE OR REPLACE VIEW heavy_orders AS
SELECT * FROM orders
WHERE freight > 100;

SELECT *
FROM heavy_orders
ORDER BY freight;

INSERT INTO heavy_orders
VALUES
(
	11900, 'FOLIG', 1, '2000-01-01', '2000-01-05', 
	'2000-01-04', 1, 80, 'Folies gourmandes', 
	'184, chaussee de Tournai',
	'Lille', NULL, 59000, 'FRANCE'
);

SELECT * -- данные появились в таблице orders, хотя вставляли мы их в view--
FROM orders
WHERE order_id = 11900


CREATE OR REPLACE VIEW heavy_orders AS
SELECT * FROM orders
WHERE freight > 100
WITH LOCAL CHECK OPTION; --заставит сервер проверить условия вставки--


INSERT INTO heavy_orders -- теперь не получается вставить--
VALUES
(
	11901, 'FOLIG', 1, '2000-01-01', '2000-01-05', 
	'2000-01-04', 1, 80, 'Folies gourmandes', 
	'184, chaussee de Tournai',
	'Lille', NULL, 59000, 'FRANCE'
);

CREATE OR REPLACE VIEW heavy_orders AS
SELECT * FROM orders
WHERE freight > 100
WITH CASCADED CHECK OPTION; --заставит сервер проверить условия вставки--

/* CASCADED
Если установлена эта опция, то при попытке 
вставки записи через вьюху проверяются условия 
этой и всех нижележащих (тех, на основе 
которых создана эта вышележащая вьюха). 
Если же делать вставку через нижележащую 
вьюху, то можно вставить запись с атрибутами, 
нарушающими правило вышестоящей. 
Т.е. проверяются условия только сверху-вниз, но не снизу-вверх.

