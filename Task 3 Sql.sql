create database ecommerce;
USE ecommerce;
SELECT * FROM customers LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM customers;
SELECT *
FROM customers
WHERE customer_state = 'SP';
SELECT *
FROM products
ORDER BY product_weight_g DESC;
SELECT customer_state, COUNT(*) AS Total_Customers
FROM customers
GROUP BY customer_state
ORDER BY Total_Customers DESC;
SELECT AVG(payment_value) AS Average_Payment
FROM payments;
SELECT SUM(payment_value) AS Total_Revenue
FROM payments;
SELECT
o.order_id,
c.customer_city,
o.order_status
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
LIMIT 10;
SELECT
c.customer_id,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LIMIT 10;
SELECT
c.customer_id,
o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
LIMIT 10;
SELECT *
FROM payments
WHERE payment_value >
(
SELECT AVG(payment_value)
FROM payments
);
CREATE VIEW customer_orders AS
SELECT
c.customer_id,
c.customer_city,
o.order_status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;
SELECT * FROM customer_orders
LIMIT 10;
CREATE INDEX idx_customer_state
ON customers(customer_state);
DESCRIBE customers;
CREATE INDEX idx_customer_state
ON customers(customer_state(10));