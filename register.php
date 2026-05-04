<?php
session_start();
include "DBConn.php";

$error   = "";
$success = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name     = $_POST['name'];
    $email    = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $role     = $_POST['role'];
    $date     = date('Y-m-d H:i:s');

    $stmt = $conn->prepare("INSERT INTO tblUser (name, email, password, role, status, join_date) 
                            VALUES (?, ?, ?, ?, 'pending', ?)");
    $stmt->bind_param("sssss", $name, $email, $password, $role, $date);

    if ($stmt->execute()) {
        $success = "Account created! Wait for admin approval before logging in.";
    } else {
        $error = "That email is already registered.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Pastimes</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="login-container">
    <h1>Create an Account</h1>

    <?php if ($error)   echo "<p class='error'>$error</p>"; ?>
    <?php if ($success) echo "<p class='success-msg'>$success</p>"; ?>

    <?php if (!$success): ?>
    <form method="POST">
        <label>Full Name</label><br>
        <input type="text" name="name" required placeholder="e.g. Jane Smith"><br><br>

        <label>Email Address</label><br>
        <input type="email" name="email" required placeholder="e.g. jane@email.com"><br><br>

        <label>Password</label><br>
        <input type="password" name="password" required placeholder="Choose a password"><br><br>

        <label>I am a:</label><br>
        <select name="role">
            <option value="buyer">Buyer</option>
            <option value="seller">Seller</option>
        </select><br><br>

        <button type="submit">Register</button>
    </form>
    <?php endif; ?>

    <p>Already have an account? <a href="login.php">Login</a></p>
</div>
</body>
</html>
