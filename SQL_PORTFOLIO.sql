USE ecommerce_analysis;


select * from customers limit 20;
update orders
set quantity = 0
where quantity is null;
select floor(avg(quantity)) from orders;
select * from customers limit 10;
select (sum(quantity) * 80) as sales_of_ProductId_10 from orders where product_id = 10;

select * from products where product_name = 'Freestanding Wine Rack';
select product_name,category , price from products;

SET SQL_SAFE_UPDATES = 0;

SELECT 
    a.product_name, 
    a.category
FROM products a
INNER JOIN products b ON a.product_name = b.product_name 
                      AND a.category = b.category
WHERE a.product_id <> b.product_id;


select p1.product_id FROM products p1
INNER JOIN products p2 
    ON p1.product_name = p2.product_name 
    AND p1.category = p2.category
WHERE p1.product_id > p2.product_id;

update products
set product_id = 25
where product_id = 12;


SELECT SUM(price * quantity) AS total_revenue
FROM orders
JOIN products USING(product_id);

SELECT customer_name, payment_method,
SUM(price * quantity) AS total_spent
FROM orders
JOIN customers USING(customer_id)
JOIN products USING(product_id)
GROUP BY customer_name, payment_method
ORDER BY total_spent DESC
LIMIT 10;

SELECT *
FROM customers
WHERE email not LIKE '%@%.%';

SELECT *
FROM orders
WHERE quantity < 0;

SELECT city,
SUM(price * quantity) AS revenue
FROM orders
JOIN customers USING(customer_id)
JOIN products USING(product_id)
GROUP BY city
ORDER BY revenue DESC
limit 25;