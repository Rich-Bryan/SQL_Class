--Lab 5

--Bryan Li

--Q1

SELECT category_name
FROM categories_mgs
WHERE category_id IN
    (SELECT category_id 
    FROM products_mgs
    )
ORDER BY category_name;

--Q2

SELECT product_name, list_price
FROM products_mgs
WHERE list_price > 
    (SELECT AVG(list_price) 
    FROM products_mgs)
ORDER BY list_price DESC
;

--Q3
SELECT category_name
FROM categories_mgs c_mgs
WHERE NOT EXISTS
    (SELECT *
    FROM products_mgs p_mgs
    WHERE p_mgs.category_id = c_mgs.category_id)
;

--Q4

SELECT email_address, MAX(order_total) AS max_order_total
FROM(
    SELECT c_mgs.email_address, o_mgs.order_id, SUM((o_i_mgs.item_price - o_i_mgs.discount_amount)*o_i_mgs.quantity) AS order_total
    FROM customers_mgs c_mgs 
        JOIN orders_mgs o_mgs 
            ON c_mgs.customer_id = o_mgs.customer_id
        JOIN order_items_mgs o_i_mgs
            ON o_mgs.order_id = o_i_mgs.order_id
    GROUP BY c_mgs.email_address, o_mgs.order_id
    ) s
    
GROUP BY email_address;

--Q5
SELECT product_name, discount_percent 
FROM products_mgs p_mgs1
WHERE discount_percent NOT IN
    (SELECT discount_percent
    FROM products_mgs p_mgs2 
    WHERE p_mgs1.product_id != p_mgs2.product_id
    )
ORDER BY product_name
;

--Q6
SELECT c_mgs.email_address, o_mgs.order_id, o_mgs.order_date
FROM customers_mgs c_mgs
JOIN orders_mgs o_mgs ON c_mgs.customer_id = o_mgs.customer_id
WHERE o_mgs.order_date = (
    SELECT MIN(o_mgs2.order_date)
    FROM orders_mgs o_mgs2
    WHERE o_mgs2.customer_id = c_mgs.customer_id
);










