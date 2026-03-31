/*Вывести: Category, ProductName, Price, Rank,
где Rank = ROW_NUMBER() по цене внутри категории
Отфильтровать только TOP 3 в каждой категории*/
WITH t AS (SELECT categories.category_name,
                  products.product_name,
                  products.unit_price,
                  ROW_NUMBER() OVER (PARTITION BY category_id
                      ORDER BY products.unit_price DESC) AS Rank
                  FROM products
                  JOIN categories USING (category_id)
)
SELECT *
FROM t
WHERE Rank <= 3