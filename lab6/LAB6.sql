--LAB 6

--BRYAN LI

--Q1
INSERT INTO categories_mgs(category_id, category_name)
VALUES(5,'BRASS');

COMMIT;

--Q2
UPDATE categories_mgs 
SET category_name = 'Woodwinds'
WHERE category_id = 5;


--Q3
DELETE FROM categories_mgs 
WHERE category_id = 5;

--Q4
INSERT INTO products_mgs(product_id, category_id, product_code, product_name, description, list_price, date_added)
VALUES(11, 4, 'dgx_640','Yamaha DGX 640 88-Key Digital Piano','Long description to come.', 79.999, SYSDATE);

--Q5

UPDATE products_mgs
SET discount_percent = 35
WHERE product_code = 'dgx_640';

--Q6 
-- find the category
SELECT category_id 
FROM categories_mgs
WHERE category_name = 'Keyboards';

DELETE FROM categories_mgs
WHERE category_id = 4;

DELETE FROM products_mgs
WHERE category_id = 4;


--Q7

INSERT INTO customers_mgs(customer_id, email_address, password, first_name, last_name)
VALUES(9, 'rick@raven.com', 'sesame', 'Rick', 'Raven');

--Q8
UPDATE customers_mgs
SET password = 'secret'
WHERE email_address = 'rick@raven.com';

-- Q9
UPDATE customers_mgs
SET password = 'secret';

--Q10
ROLLBACK; 

