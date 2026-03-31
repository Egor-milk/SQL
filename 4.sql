/*Вывести: ProductName, Category, Price,
разницу между ценой товара и средней ценой в категории*/
WITH avg_price_by_category AS (
           SELECT categories.category_id,
           categories.category_name,
           AVG(products.unit_price) AS summar
           FROM products
           JOIN categories USING (category_id)
           GROUP BY categories.category_id
)
SELECT products.product_name,
       avg_price_by_category.category_name,
       products.unit_price,
       products.unit_price - avg_price_by_category.summar as dif
FROM products
JOIN avg_price_by_category USING (category_id)