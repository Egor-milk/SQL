SELECT *
FROM orders
LIMIT 10;

SELECT order_id, order_date, COALESCE(ship_region, 'unknown')
FROM orders
LIMIT 10;


SELECT *
FROM employees;

SELECT last_name, first_name, COALESCE(region, 'N/A') AS region
FROM employees;


SELECT *
FROM customers;

SELECT contact_name, COALESCE(NULLIF(city, ''), 'Uknown') AS city
FROM customers;


CREATE TABLE budgets
(
	dept serial,
	current_year decimal,
	previous_year decimal
);

INSERT INTO budgets(current_year, previous_year) VALUES(100000, 150000);
INSERT INTO budgets(current_year, previous_year) VALUES(NULL, 300000);
INSERT INTO budgets(current_year, previous_year) VALUES(0, 100000);
INSERT INTO budgets(current_year, previous_year) VALUES(NULL, 150000);
INSERT INTO budgets(current_year, previous_year) VALUES(300000, 250000);
INSERT INTO budgets(current_year, previous_year) VALUES(170000, 170000);
INSERT INTO budgets(current_year, previous_year) VALUES(150000, NULL);

SELECT dept,
	COALESCE(TO_CHAR(NULLIF(current_year, previous_year),
		'FM999999999'), 'Same as last year') AS budget
FROM budgets
WHERE current_year IS NOT NULL;