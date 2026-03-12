/* 1. Создать представление, которое выводит следующие колонки:

order_date, required_date, shipped_date, ship_postal_code, 
company_name, contact_name, phone, last_name, first_name, 
title из таблиц orders, customers и employees.

Сделать select к созданному представлению, выведя все записи,
где order_date больше 1го января 1997 года. */

CREATE VIEW TEST AS
SELECT order_date, required_date, shipped_date, 
ship_postal_code, company_name, contact_name, 
phone, last_name, first_name, title
FROM orders 
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)

SELECT * FROM TEST
WHERE order_date > '1997-01-01'

DROP VIEW TEST
/* 2. Создать представление, которое выводит следующие колонки:

order_date, required_date, shipped_date, ship_postal_code, 
ship_country, company_name, contact_name, phone, last_name, 
first_name, title из таблиц orders, customers, employees.

Попробовать добавить к представлению (после его создания) 
колонки ship_country, postal_code и reports_to. 
Убедиться, что проихсодит ошибка. Переименовать 
представление и создать новое уже с дополнительными колонками.

Сделать к нему запрос, выбрав все записи, отсортировав их по ship_county.

Удалить переименованное представление.
*/

CREATE VIEW test AS
SELECT order_date, required_date, shipped_date, ship_postal_code, 
ship_country, company_name, contact_name, phone, last_name, 
first_name, title 
FROM orders 
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)

CREATE OR REPLACE VIEW test AS
SELECT order_date, required_date, shipped_date, ship_postal_code, 
ship_country, company_name, contact_name, phone, last_name, 
first_name, title, customers.postal_code, reports_to
FROM orders 
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)

SELECT * FROM test
ORDER BY ship_country

/* 3.  Создать представление "активных" (discontinued = 0) продуктов, 
содержащее все колонки. Представление должно быть защищено от вставки 
записей, в которых discontinued = 1.

Попробовать сделать вставку записи с полем discontinued = 1 - 
убедиться, что не проходит.*/


CREATE VIEW active_product AS
SELECT *
FROM products
WHERE discontinued = 0
WITH LOCAL CHECK OPTION;


SELECT * FROM active_product

INSERT INTO active_product -- не получится вставить--
VALUES(
1000, 'Original Frankfurter grüne Soße', 12, 2, '12 boxes', 13, 32, 0, 15, 1
)


