/* 1. Найти заказчиков (customers) и обслуживающих 
их заказы сотрудников (employees) таких, 
где и заказчики и сотрудники из города London, 
а доставка идёт компанией Speedy Express. 
Вывести компанию заказчика (company_name) 
и ФИО сотрудника (конкатенация first_name 
и last_name через пробел между ними). */
SELECT customers.company_name, first_name || ' ' || last_name as full_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id
JOIN shippers ON orders.ship_via = shippers.shipper_id
WHERE customers.city = 'London' 
  AND employees.city = 'London'
  AND shippers.company_name = 'Speedy Express'

/* 2. Найти активные (см. поле discontinued) продукты 
(products) из категории (category_name) Beverages и Seafood,
которых в продаже менее 20 единиц. Вывести наименование продуктов,
кол-во единиц в продаже, имя контакта поставщика 
и его телефонный номер 
(product_name, units_in_stock, contact_name, phone). */

SELECT p.product_name, p.units_in_stock, s.contact_name, s.phone
FROM products AS p
JOIN categories AS c USING(category_id)
JOIN suppliers AS s USING(supplier_id)
WHERE discontinued = 0
  AND c.category_name IN ('Beverages', 'Seafood')
  AND p.units_in_stock < 20

/* 3. Найти заказчиков (customers), 
не сделавших ни одного заказа. 
Вывести имя заказчика (contact_name) 
и идентификатор заказа (order_id). 
Отсортировать по contact_name. */


SELECT c.contact_name, o.order_id
FROM customers as c
LEFT JOIN orders AS o USING(customer_id)
WHERE o.order_id IS NULL 
ORDER BY contact_name

/* 4. Переписать предыдущий запрос, 
использовав симметричный вид джойна 
(подсказа: речь о LEFT и RIGHT)*/

SELECT c.contact_name, o.order_id
FROM orders as o
RIGHT JOIN customers AS c USING(customer_id)
WHERE o.order_id IS NULL 
ORDER BY contact_name