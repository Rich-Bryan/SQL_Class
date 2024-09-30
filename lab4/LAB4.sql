--Lab 4

--Bryan Li

--Q1
SELECT COUNT(order_id) as "ORDER_COUNT",
    SUM(tax_amount) as tax_total
FROM orders_mgs;

--Q2
SELECT c_mgs.category_name, COUNT(p_mgs.product_id) AS product_count, MAX(p_mgs.list_price) AS most_expensive_product
    FROM categories_mgs c_mgs JOIN products_mgs p_mgs 
        ON c_mgs.category_id = p_mgs.category_id
GROUP BY c_mgs.category_name
ORDER BY product_count DESC;

--Q3
SELECT c_mgs.email_address ,SUM(o_i_mgs.item_price*o_i_mgs.quantity) AS item_price_total, 
                    SUM(o_i_mgs.discount_amount*o_i_mgs.quantity) AS discount_amount_total
FROM customers_mgs c_mgs 
        JOIN orders_mgs o_mgs
            ON c_mgs.customer_id = o_mgs.customer_id
        JOIN order_items_mgs o_i_mgs
            ON o_mgs.order_id = o_i_mgs.order_id
    
GROUP BY c_mgs.email_address
ORDER BY SUM(o_i_mgs.item_price*o_i_mgs.quantity) DESC
;

--Q4
SELECT c_mgs.email_address ,COUNT(o_mgs.order_id) AS order_count, SUM((item_price - discount_amount)*quantity) AS order_total
FROM customers_mgs c_mgs 
        JOIN orders_mgs o_mgs
            ON c_mgs.customer_id = o_mgs.customer_id
        JOIN order_items_mgs o_i_mgs
            ON o_mgs.order_id = o_i_mgs.order_id
GROUP BY c_mgs.email_address
HAVING COUNT(o_mgs.order_id) > 1
ORDER BY order_total  DESC;

--Q5

SELECT c_mgs.email_address ,COUNT(o_mgs.order_id) AS order_count, SUM((item_price - discount_amount)*quantity) AS order_total
FROM customers_mgs c_mgs 
        JOIN orders_mgs o_mgs
            ON c_mgs.customer_id = o_mgs.customer_id
        JOIN order_items_mgs o_i_mgs
            ON o_mgs.order_id = o_i_mgs.order_id
WHERE item_price >  400
GROUP BY c_mgs.email_address
HAVING COUNT(o_mgs.order_id) > 1
ORDER BY order_total  DESC;

--Q6
SELECT product_name, SUM((o_i_mgs.item_price - o_i_mgs.discount_amount)*o_i_mgs.quantity) as product_total
FROM products_mgs p_mgs
    JOIN order_items_mgs o_i_mgs
        ON p_mgs.product_id = o_i_mgs.product_id
GROUP BY ROLLUP(p_mgs.product_name)
;


--Q7 
SELECT c_mgs.email_address ,COUNT(DISTINCT o_i_mgs.product_id) AS NUMBER_OF_PRODUCTS
FROM customers_mgs c_mgs 
        JOIN orders_mgs o_mgs
            ON c_mgs.customer_id = o_mgs.customer_id
        JOIN order_items_mgs o_i_mgs
            ON o_mgs.order_id = o_i_mgs.order_id
GROUP BY c_mgs.email_address
HAVING COUNT(DISTINCT o_i_mgs.product_id) > 1
ORDER BY c_mgs.email_address ASC;

--Q8 
SELECT 
    CASE 
        WHEN GROUPING(cat_mgs.category_name) = 1 
            THEN '========' 
        ELSE cat_mgs.category_name 
    END AS category_name,
    
    CASE WHEN GROUPING(p_mgs.product_name) = 1
    THEN '========' 
        ELSE cat_mgs.category_name 
    END AS product_name,  
    SUM(o_i_mgs.quantity) as qty_purchased
FROM categories_mgs cat_mgs
        JOIN products_mgs p_mgs
            ON cat_mgs.category_id = p_mgs.category_id
        JOIN order_items_mgs o_i_mgs
            ON p_mgs.product_id = o_i_mgs.product_id
GROUP BY ROLLUP(cat_mgs.category_name, p_mgs.product_name);


--Q9
SELECT order_id, ((item_price - discount_amount)*quantity) AS item_amount,
                SUM(((item_price - discount_amount)*quantity)) OVER(PARTITION BY order_id) AS order_amount
FROM order_items_mgs
ORDER BY order_id;

