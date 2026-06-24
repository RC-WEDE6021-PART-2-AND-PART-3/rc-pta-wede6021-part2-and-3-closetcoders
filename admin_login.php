<?php
session_start();
include "DBConn.php";

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email    = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM tblUser WHERE email = ? AND role = 'admin'");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $admin  = $result->fetch_assoc();

    if ($admin && password_verify($password, $admin['password'])) {
        $_SESSION['admin_id']   = $admin['user_id'];
        $_SESSION['admin_name'] = $admin['name'];
        $_SESSION['role']       = 'admin';
        header("Location: admin_dashboard.php");
        exit();
    } else {
        $error = "Invalid admin credentials.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Pastimes</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="login-container">
    <h1>Admin Login</h1>
    <?php if ($error) echo "<p class='error'>$error</p>"; ?>
    <form method="POST">
        <label>Admin Email</label><br>
        <input type="email" name="email" required placeholder="Admin email"><br><br>
        <label>Password</label><br>
        <input type="password" name="password" required placeholder="Password"><br><br>
        <button type="submit">Login as Admin</button>
    </form>
    <p><a href="login.php">← Back to User Login</a></p>
</div>
</body>
</html>
