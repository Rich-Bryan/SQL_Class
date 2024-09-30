--Lab 2

--Bryan Li

--Q1

SELECT product_code, product_name,
    list_price, discount_percent
FROM products_MGS
ORDER BY list_price DESC;

--Q2 
SELECT last_name ||', '|| first_name
    AS full_name
FROM customers_mgs
WHERE CAST(last_name AS char(1)) BETWEEN 'M' AND 'Z'
ORDER BY last_name ASC;

--Q3
SELECT product_name, list_price, date_added
FROM products_MGS
WHERE list_price > 500 and list_price < 2000 
ORDER BY date_added DESC;

--Q4
SELECT product_name, list_price, 
    discount_percent, 
    (list_price * discount_percent/100) AS discount_amount,
    (list_price - (list_price * discount_percent/100)) AS discount_price
FROM products_MGS
ORDER BY discount_price DESC
FETCH FIRST 5 ROWS ONLY;

--Q5 
SELECT item_id, item_price, discount_amount, quantity,
    (item_price * quantity) AS price_total,
    (discount_amount * quantity) AS discount_total,
    ((item_price - discount_amount) * quantity) AS item_total
FROM order_items_mgs
WHERE ((item_price - discount_amount) * quantity) > 500
ORDER BY item_total DESC;

--Q6
SELECT order_id, order_date, ship_date
FROM orders_mgs
WHERE ship_date IS NULL;



--Q7
SELECT SYSDATE AS today_unformatted,
    TO_CHAR(SYSDATE, 'MM/DD/YYYY')
FROM dual;

--Q8

SELECT 100 AS price,
	0.07 AS tax_rate,
	(100*0.07) AS tax_amount,
     100 + (100 * 0.07) AS total
    
FROM Dual


