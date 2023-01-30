CREATE DATABASE IF NOT EXISTS appDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT SELECT,UPDATE,INSERT ON appDB.* TO 'user'@'%';
FLUSH PRIVILEGES;

USE appDB;
CREATE TABLE IF NOT EXISTS users (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  login VARCHAR(20) NOT NULL,
  password VARCHAR(40) NOT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS products (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL,
  price INTEGER,
  PRIMARY KEY (ID)
);

INSERT INTO users (login, password)
SELECT * FROM (SELECT 'kirill', '{SHA}QL0AFWMIX8NRZTKeof9cXsvbvu8=') AS tmp
WHERE NOT EXISTS (
    SELECT login FROM users WHERE login='kirill' AND password='123'
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Wetsuit Aqualung Diveflex', 23400) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Wetsuit Aqualung Diveflex' AND price = 23400
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Compensator vest Prodive PRO 1000 den', 36000) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Compensator vest Prodive PRO 1000 den' AND price = 36000
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Neoprene gloves 2,5 mm, kevlar', 2450) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Neoprene gloves 2,5 mm, kevlar' AND price = 2450
) LIMIT 1;