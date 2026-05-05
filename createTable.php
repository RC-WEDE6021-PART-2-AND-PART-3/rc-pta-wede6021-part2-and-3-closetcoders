<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "DBConn.php";

// Drop tblUser if it exists
$conn->query("DROP TABLE IF EXISTS tblUser");

// Recreate it
$conn->query("
CREATE TABLE tblUser (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('buyer','seller','admin') DEFAULT 'buyer',
    status ENUM('pending','approved') DEFAULT 'pending',
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    wallet_balance DECIMAL(10,2) DEFAULT 0
)");

echo "tblUser created.<br>";

// Load data from userData.txt
$file = fopen("userData.txt", "r");

if ($file) {
    while (($line = fgets($file)) !== false) {
        $line = trim($line);
        if (empty($line)) continue;

        $parts = explode("\t", $line);
        if (count($parts) < 4) continue;

        $name     = $conn->real_escape_string($parts[1]);
        $email    = $conn->real_escape_string($parts[2]);
        $password = $conn->real_escape_string($parts[3]);

        $conn->query("INSERT INTO tblUser (name, email, password) 
                      VALUES ('$name', '$email', '$password')");
    }
    fclose($file);
    echo "Data loaded from userData.txt successfully!";
} else {
    echo "Could not open userData.txt";
}
?>
