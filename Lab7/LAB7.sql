--LAB 7

--BRYAN LI

--Q1
CREATE INDEX idx_order_date ON Orders_mgs(order_date);

--Q2

-- Drop sequences
DROP SEQUENCE user_id_seq;
DROP SEQUENCE download_id_seq;
DROP SEQUENCE product_id_seq;

-- Drop tables
DROP TABLE users_ex;
DROP TABLE downloads_ex;
DROP TABLE products_ex;

-- Create sequences
CREATE SEQUENCE user_id_seq START WITH 1;
CREATE SEQUENCE download_id_seq START WITH 1;
CREATE SEQUENCE product_id_seq START WITH 1;

-- Create tables
CREATE TABLE users_ex (
    user_id INT PRIMARY KEY,
    email_address VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE products_ex (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(225) UNIQUE NOT NULL
);

CREATE TABLE downloads_ex (
    download_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    download_date DATE NOT NULL,
    filename VARCHAR(255) NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users_ex(user_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products_ex(product_id)
);


--Q3

INSERT INTO users_ex
VALUES (user_id_seq.NEXTVAL,'johnsmith@gmail.com', 'John','Smith');

INSERT INTO users_ex
VALUES (user_id_seq.NEXTVAL,'janedoe@yahoo.com', 'Jane','Doe');

INSERT INTO products_ex VALUES (product_id_seq.NEXTVAL, 'Local Music Vol 1');
INSERT INTO products_ex VALUES (product_id_seq.NEXTVAL, 'Local Music Vol 2');

INSERT INTO downloads_ex 
VALUES (download_id_seq.NEXTVAL, 1, 2, SYSDATE, 'pedals_are_falling.mp3');

INSERT INTO downloads_ex 
VALUES (download_id_seq.NEXTVAL, 2, 1, SYSDATE, 'turn_signal.mp3');

INSERT INTO downloads_ex 
VALUES (download_id_seq.NEXTVAL, 2, 2, SYSDATE, 'one_horse_town.mp3');

--Q4
ALTER TABLE products_ex
ADD product_price NUMBER(5,2) DEFAULT 9.99;

ALTER TABLE products_ex 
ADD time_stamp TIMESTAMP DEFAULT SYSDATE;

--Q5
ALTER TABLE users_ex
MODIFY first_name VARCHAR(20);

ALTER TABLE users_ex
MODIFY first_name NULL;

UPDATE users_ex
SET first_name = NULL
WHERE user_id = 1;


UPDATE users_ex
SET first_name = ' fake_firstname_1234567890'
WHERE user_id = 2;





