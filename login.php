<?php
session_start();
include "DBConn.php";

$email_input = "";
$error = "";
$user = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email_input    = $_POST['email'];
    $password_input = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM tblUser WHERE email = ?");
    $stmt->bind_param("s", $email_input);
    $stmt->execute();
    $result = $stmt->get_result();
    $user   = $result->fetch_assoc();

    if (!$user) {
        $error = "not_found";
    } elseif ($user['status'] == 'pending') {
        $error = "pending";
    } elseif ($user['password'] !== $password_input) {
        $error = "wrong_password";
    } else {
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['name']    = $user['name'];
        $_SESSION['role']    = $user['role'];
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Pastimes</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="login-container">
    <h1>Pastimes</h1>
    <h2>Login</h2>

    <?php if (isset($_SESSION['user_id'])): ?>
        <p class="success-msg">User <?= htmlspecialchars($_SESSION['name']) ?> is logged in.</p>
        <table>
            <tr><th>Field</th><th>Value</th></tr>
            <?php foreach ($user as $col => $val): ?>
                <?php if ($col !== 'password'): ?>
                <tr>
                    <td><?= htmlspecialchars($col) ?></td>
                    <td><?= htmlspecialchars($val) ?></td>
                </tr>
                <?php endif; ?>
            <?php endforeach; ?>
        </table>
        <br>
        <a href="logout.php"><button>Logout</button></a>

    <?php else: ?>

        <?php if ($error == "wrong_password"): ?>
            <p class="error">Incorrect password. Please try again.</p>
        <?php elseif ($error == "not_found"): ?>
            <p class="error">No account found. <a href="register.php">Register here</a></p>
        <?php elseif ($error == "pending"): ?>
            <p class="error">Your account is awaiting admin approval.</p>
        <?php endif; ?>

        <form method="POST">
            <label>Email Address</label><br>
            <input 
                type="email" 
                name="email" 
                value="<?= htmlspecialchars($email_input) ?>" 
                required 
                placeholder="Enter your email"
            ><br><br>

            <label>Password</label><br>
            <input 
                type="password" 
                name="password" 
                required 
                placeholder="Enter your password"
            ><br><br>

            <button type="submit">Login</button>
            <a href="admin_login.php"><button type="button">Admin</button></a>
        </form>

        <p>No account? <a href="register.php">Register</a></p>

    <?php endif; ?>
</div>
</body>
</html>
