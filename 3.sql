/*Для каждого заказа вывести: CustomerID, OrderID, OrderDate,
и общее количество заказов этого клиента*/


SELECT orders.customer_id,
       orders.order_id,
       orders.order_date,
       count(*) OVER (PARTITION BY orders.customer_id) as sum_orders
FROM orders
