SELECT * FROM orders;



CREATE VIEW heavy_orders AS
SELECT *
FROM orders
WHERE freight > 50;


SELECT *
FROM heavy_orders
ORDER BY freight;


CREATE OR REPLACE VIEW heavy_orders AS
SELECT * FROM orders
WHERE freight > 100

CREATE VIEW product_supplier_categories AS
SELECT product_name, quantity_per_unit, unit_price, units_in_stock,
company_name, contact_name, phone, category_name, description 
FROM products
JOIN suppliers USING(supplier_id)
JOIN categories USING(category_id) 

SELECT *
FROM product_supplier_categories
WHERE discontinued = 1 --не получится так как нет такого столбца в view--

ALTER view product_supplier_categories RENAME TO psc_old;

CREATE VIEW product_supplier_categories AS
SELECT product_name, quantity_per_unit, unit_price, units_in_stock,
discontinued,
company_name, contact_name, phone, category_name, description 
FROM products
JOIN suppliers USING(supplier_id)
JOIN categories USING(category_id) 

SELECT MAX(order_id)
FROM orders

INSERT INTO heavy_orders --insert в view --
VALUES 
(
	11078, 'VINET', 5, '2019-12-10', '2019-12-15', 
	'2019-12-14', 1, 120, 'Hanari Carnes', 'Rua do Paco', 
	'Bern', NULL, 3012, 'Switzerland'
);

SELECT * 
FROM heavy_orders
order by order_id DESC

SELECT MIN(freight)
FROM orders;

DELETE FROM heavy_orders
WHERE freight < 0.05;

SELECT MIN(freight)
FROM heavy_orders

DELETE FROM heavy_orders
WHERE freight < 100.25

DELETE FROM order_details
WHERE order_id = 10854