CREATE DATABASE IF NOT EXISTS appDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT SELECT,UPDATE,INSERT,DELETE ON appDB.* TO 'user'@'%';
FLUSH PRIVILEGES;

USE appDB;
CREATE TABLE IF NOT EXISTS users (
    ID INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(32) NOT NULL,
    password VARCHAR(256) NOT NULL,
    email VARCHAR(64) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS `painting`
(
    ID          INT(11)      NOT NULL AUTO_INCREMENT,
    name        VARCHAR(255)  NOT NULL,
    description VARCHAR(256) NOT NULL,
    price       INT(7)       NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO users (username, password, email) VALUES ("kirill", "{SHA}QL0AFWMIX8NRZTKeof9cXsvbvu8=", "kosgor2001@yandex.ru");

INSERT INTO `painting` (name,description,price) VALUES ('Wetsuit Aqualung Diveflex','One-piece suit made from soft and stretchy 5.5mm UltraStretch neoprene with back zip. Fits great, easy to put on and take off. The wrists and ankles are equipped with 2.5 mm smooth skin seals without zippers to prevent water from entering the suit.
',23400);
INSERT INTO `painting` (name,description,price) VALUES ('Compensator vest Prodive PRO 1000 den','Reliable compensator BCD Prodive PRO 1000 den from the manufacturer Prodive is suitable for beginner divers, as it is located in the budget price category. The compensator is made of durable wear-resistant material Cordura 1000 den. And the soft back gives comfort and relieves the load from the lower back when worn with a fixed balloon.
',36000);
INSERT INTO `painting` (name,description,price) VALUES ('Neoprene gloves 2,5 mm, kevlar','Problue neoprene gloves are made from 2.5mm thick neoprene and have a Kevlar coating on the palms and fingers. Kevral gives excellent wear resistance to the product. Problue neoprene gloves, in addition to excellent performance, also have a democratic cost.
',2450);


