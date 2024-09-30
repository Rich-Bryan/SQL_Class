--Lab 3

--Bryan Li

--Q1
SELECT category_name, product_name, list_price
FROM categories_mgs c_mgs JOIN products_mgs p_mgs 
    ON c_mgs.category_id = p_mgs.category_id
ORDER BY category_name, product_name;

--Q2
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers_mgs c INNER JOIN addresses_mgs a 
    ON c.customer_id = a.customer_id
WHERE email_address = 'allan.sherwood@yahoo.com';

--Q3
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers_mgs c INNER JOIN addresses_mgs a 
    ON c.customer_id = a.customer_id
WHERE c.shipping_address_id = a.address_id;

--Q4
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers_mgs c_mgs 
    INNER JOIN orders_mgs o_mgs
        ON c_mgs.customer_id = o_mgs.customer_id
    INNER JOIN order_items_mgs o_i_mgs
        ON o_mgs.order_id = o_i_mgs.order_id
    INNER JOIN products_mgs p_mgs
        ON o_i_mgs.product_id = p_mgs.product_id
ORDER BY last_name, order_date, product_name;
    
    
--Q5
SELECT pro1.product_name, pro1.list_price
FROM products_mgs pro1 
    INNER JOIN products_mgs pro2
        ON pro1.product_id <> pro2.product_id
        AND pro1.list_price = pro2.list_price;
    
--Q6

SELECT category_name,product_id
FROM categories_mgs c_mgs 
    FULL OUTER JOIN products_mgs p_mgs 
        ON c_mgs.category_id = p_mgs.category_id
WHERE product_id IS NULL;

--Q7 
SELECT
    'SHIPPED' AS ship_status,
    order_id,
    order_date
FROM Orders_mgs
WHERE ship_date IS NOT NULL

UNION 

SELECT
    'NOT SHIPPED' AS ship_status,
    order_id,
    order_date
FROM Orders_mgs
WHERE ship_date IS NULL

ORDER BY order_date ASC;
;
    