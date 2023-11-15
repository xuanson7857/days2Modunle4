CREATE DATABASE IF NOT EXISTS Session2_BT_Them;
USE Session2_BT_Them;

CREATE TABLE Category (
    id INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Status TINYINT DEFAULT 1
);

CREATE TABLE Product (
    id INT PRIMARY KEY,
    product_Name VARCHAR(200) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Customer (
    id INT PRIMARY KEY,
    cus_Name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    brithday DATE,
    gender TINYINT DEFAULT 1
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    cus_id INT NOT NULL,
    created DATE DEFAULT (CURRENT_DATE),
    status TINYINT DEFAULT 1,
    FOREIGN KEY (cus_id) REFERENCES Customer(id)
);


CREATE TABLE Order_detail (
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    cus_id INT NOT NULL,
    FOREIGN KEY (cus_id) REFERENCES Customer(id),
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    quantity INT NOT NULL CHECK (quantity > 0),
    price FLOAT CHECK (price > 0),
     sale_price FLOAT ,
    CONSTRAINT chk_sale_price CHECK (sale_price < price)
);
ALTER TABLE Orders
ADD COLUMN note VARCHAR(255) ;
ALTER TABLE Orders
Change note note VARCHAR(255) DEFAULT "not note";


