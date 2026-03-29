/*Для каждого заказа вывести: EmployeeID, OrderID, Freight,
и ранг сотрудника по сумме фрахта (ORDER BY Freight DESC)*/
WITH ranked AS (
    SELECT orders.employee_id,
           SUM(orders.freight) as total_freight
    FROM orders
    GROUP BY orders.employee_id
)
SELECT orders.employee_id,
       orders.order_id,
       orders.freight,
       DENSE_RANK() OVER (ORDER BY ranked.total_freight DESC)
FROM orders
JOIN ranked USING (employee_id)