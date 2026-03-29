/*Для каждого товара вывести: ProductName, Category, Price,
и среднюю цену товаров в этой категории*/

SELECT products.product_name,
       categories.category_name,
       products.unit_price,
       AVG(products.unit_price) OVER (PARTITION BY categories.category_name) AS avg_category_price
FROM products
JOIN categories USING(category_id)
