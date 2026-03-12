/* 11. Подключиться к БД northwind и добавить 
ограничение на поле unit_price таблицы 
products (цена должна быть больше 0) */ 

ALTER TABLE products
ADD CONSTRAINT CHK_product_price CHECK(unit_price > 0)

/* 12. "Навесить" автоинкрементируемый счётчик на поле product_id 
таблицы products (БД northwind). Счётчик должен начинаться 
с числа следующего за максимальным значением по этому столбцу.*/

SELECT MAX(product_id) FROM products;

CREATE SEQUENCE IF NOT EXISTS products_product_id_seq
START WITH 78 OWNED BY products.product_id;


ALTER TABLE products
ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq')

/*  13. Произвести вставку в products (не вставляя идентификатор явно) 
и убедиться, что автоинкремент работает. Вставку сделать так, 
чтобы в результате команды вернулось значение, 
сгенерированное в качестве идентификатора.*/

INSERT INTO products(product_name, supplier_id, category_id, quantity_per_unit, 
					 unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES
('prod', 1, 1, 10, 20, 20, 10, 1, 0)
RETURNING product_id;