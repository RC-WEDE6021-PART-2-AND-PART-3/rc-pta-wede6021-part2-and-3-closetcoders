


<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
include "DBConn.php";
// Disable foreign key checks
$conn->query("SET FOREIGN_KEY_CHECKS = 0");

$conn->query("DROP TABLE IF EXISTS Reviews");
$conn->query("DROP TABLE IF EXISTS Orders");
$conn->query("DROP TABLE IF EXISTS Products");
$conn->query("DROP TABLE IF EXISTS Users");

//Enable foreign key checks
$conn->query("SET FOREIGN_KEY_CHECKS = 1");

$conn->query("
CREATE TABLE IF NOT EXISTS Users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(70) UNIQUE,
passowrd VARCHAR(225),
role ENUM('buyer','seller','admin') DEFAULT 'buyer',
status ENUM('pending','approved') DEFAULT 'pending',
join_date DATETIME,
wallet_balance DEMICAL(10,2) DEFAULT 0
)");

$conn->query("
CREATE TABLE IF NOT EXISTS Products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
seller_id INT,
title VARCHAR(100),
description TEXT,
price DECIMAL(10,2),
product_condition ENUM('like new','good','fair'),
category VARCHAR(50),
size VARCHAR(20),
image_urls TEXT,
status ENUM('active','sold','reserved'),
date_listed DATETIME,
FOREIGN KEY (seller_id) REFERENCES Users(user_id)
)");

$conn->query("
CREATE TABLE IF NOT EXISTS Orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
buyer_id INT,
seller_id INT,
product_id INT,
amount DECIMAL(10,2),
status ENUM('pending','paid','shipped','completed','refunded'),
delivery_method VARCHAR(50),
tracking_number VARCHAR(100),
date_ordered DATETIME,
FOREIGN KEY (buyer_id) REFERENCES Users(user_id),
FOREIGN KEY (seller_id) REFERENCES Users(user_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
)");

$conn->query("
CREATE TABLE IF NOT EXISTS Reviews (
reviews_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
reviewer_id INT,
rating INT,
comment TEXT,
date_reviewed DATETIME,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (reviewer_id) REFERENCES Users(user_id),
)");

echo "Database tables created successfully!";
?>
