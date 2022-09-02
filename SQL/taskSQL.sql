-- Membuat table 

CREATE TABLE product(
    id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE transaction_product(
    transaction_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE user(
    id INT NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE transaction(
    id INT NOT NULL,
    user_id INT NOT NULL,
    total_price INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

-- Constraint Primary Key

ALTER TABLE product
ADD CONSTRAINT PK_product
PRIMARY KEY (id);

ALTER TABLE transaction_product
ADD CONSTRAINT PK_transaction_product
PRIMARY KEY (transaction_id);

ALTER TABLE user
ADD CONSTRAINT PK_user
PRIMARY KEY (id);

ALTER TABLE transaction
ADD CONSTRAINT PK_transaction
PRIMARY KEY (id);


-- Constraint Foreign Key

ALTER TABLE transaction_product
ADD CONSTRAINT FK_product
FOREIGN KEY (product_id)
REFERENCES product(id);

ALTER TABLE transaction_product
ADD CONSTRAINT FK_transaction
FOREIGN KEY (transaction_id)
REFERENCES transaction(id);

ALTER TABLE transaction
ADD CONSTRAINT FK_user
FOREIGN KEY (user_id)
REFERENCES user(id);

-- Modify ID Auto Increment

ALTER TABLE product
MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE transaction_product
MODIFY COLUMN transaction_id INT AUTO_INCREMENT;

ALTER TABLE user
MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE transaction
MODIFY COLUMN id INT AUTO_INCREMENT;



-- Tabel Relasi

ALTER TABLE transaction_product ADD FOREIGN KEY (product_id) REFERENCES product(id);

ALTER TABLE transaction_product ADD FOREIGN KEY (transaction_id) REFERENCES transaction(id);

ALTER TABLE transaction ADD FOREIGN KEY (user_id) REFERENCES user(id);


-- Insert data ke user

INSERT INTO user (username, password, created_at, updated_at)
VALUES ("andi", "andi123", '2022-08-27 01:00:00', '2022-08-28 01:00:00');

INSERT INTO user (username, password, created_at, updated_at)
VALUES ("budi", "budi_ganteng999", '2022-08-27 01:00:00', '2022-08-28 01:00:00');

-- Insert data ke product

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES ("baju", 67000, '2022-08-17 01:00:00', '2022-08-17 01:00:00');

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES ("celana", 86000, '2022-08-18 07:00:00', '2022-08-18 07:00:00') ;

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES ("buku", 24000, '2022-08-19 07:00:00', '2022-08-19 07:00:00');

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES ("sepatu", 128000, '2022-08-20 07:00:00', '2022-08-20 07:00:00'); 

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES("sepeda", 1500000, '2022-08-21 07:00:00', '2022-08-21 07:00:00');

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES ("bola", 17000, '2022-08-22 07:00:00', '2022-08-22 07:00:00');

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES ("komputer", 8956000, '2022-08-23 07:00:00', '2022-08-23 07:00:00');

INSERT INTO product (product_name, price, created_at, updated_at)
VALUES ("gelas", 96400, '2022-08-24 07:00:00', '2022-08-24 07:00:00');


-- Tambah transaction_product

-- Baju

INSERT INTO transaction_product (product_id, quantity)
VALUES (1, 2);

-- Celana

INSERT INTO transaction_product (product_id, quantity)
VALUES (2, 3);

INSERT INTO transaction_product (product_id, quantity)
VALUES (2, 4);

-- Buku

INSERT INTO transaction_product (product_id, quantity)
VALUES (3, 4);

-- Sepatu

INSERT INTO transaction_product (product_id, quantity)
VALUES (4, 1);

INSERT INTO transaction_product (product_id, quantity)
VALUES (4, 2);

-- Sepeda

INSERT INTO transaction_product (product_id, quantity)
VALUES (5, 0);

-- Bola

INSERT INTO transaction_product (product_id, quantity)
VALUES (6, 0);

-- Komputer

INSERT INTO transaction_product (product_id, quantity)
VALUES (7, 1);

-- Gelas

INSERT INTO transaction_product (product_id, quantity)
VALUES (8, 2);



-- Memasukan total Price

INSERT INTO transaction(total_price)
SELECT product.price*transaction_product.quantity FROM product INNER JOIN transaction_product ON product.id = transaction_product.product_id;


-- Update Transaction

UPDATE transaction SET user_id = 1, created_at = '2022-08-15 07:00:00', updated_at = '2022-08-15 07:00:00' WHERE total_price=134000;

UPDATE transaction SET user_id = 1, created_at = '2022-08-15 07:00:00', updated_at = '2022-08-15 07:00:00' WHERE total_price=258000;

UPDATE transaction SET user_id = 2, created_at = '2022-08-16 07:00:00', updated_at = '2022-08-16 07:00:00' WHERE total_price=128000;

UPDATE transaction SET user_id = 2, created_at = '2022-08-16 07:00:00', updated_at = '2022-08-16 07:00:00' WHERE total_price=8956000;

UPDATE transaction SET user_id = 2, created_at = '2022-08-19 07:00:00', updated_at = '2022-08-19 07:00:00' WHERE total_price=344000;

UPDATE transaction SET user_id = 2, created_at = '2022-08-19 07:00:00', updated_at = '2022-08-19 07:00:00' WHERE total_price=96000;

UPDATE transaction SET user_id = 1, created_at = '2022-08-24 07:00:00', updated_at = '2022-08-24 07:00:00' WHERE total_price=192800;

UPDATE transaction SET user_id = 1, created_at = '2022-08-24 07:00:00', updated_at = '2022-08-24 07:00:00' WHERE total_price=256000;


-- Rubah gelas dari 2 ke 1

UPDATE transaction_product
SET quantity = REPLACE (quantity,2, 1)
WHERE product_id = 18;


-- Menghapus harga terendah

SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `product` 
WHERE price = (
    SELECT MIN(price)
    FROM `product`
);


-- Paginasi

SELECT * FROM `product` WHERE price > 50000 LIMIT 2, 3;


-- Menghitung total transaksi

SELECT user.username, SUM(transaction.total_price) 
as total_shopping FROM user LEFT JOIN transaction
ON user.id = transaction.user_id 
GROUP BY user.username;

-- Total pembelian barang diurutkan dari yang terbanyak dibeli

SELECT product_name, sum(quantity) AS total FROM transaction_product 
JOIN product ON transaction_product.product_id = product.id
 GROUP BY product_name ORDER BY total desc;
