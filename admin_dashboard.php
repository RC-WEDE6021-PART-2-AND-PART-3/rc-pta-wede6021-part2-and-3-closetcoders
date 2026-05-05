<?php
session_start();
include "DBConn.php";

if (!isset($_SESSION['admin_id'])) {
    header("Location: admin_login.php");
    exit();
}

if (isset($_GET['approve'])) {
    $id = (int)$_GET['approve'];
    $conn->query("UPDATE tblUser SET status='approved' WHERE user_id=$id");
    header("Location: admin_dashboard.php");
    exit();
}

if (isset($_GET['delete'])) {
    $id = (int)$_GET['delete'];
    $conn->query("DELETE FROM tblUser WHERE user_id=$id");
    header("Location: admin_dashboard.php");
    exit();
}

$users = $conn->query("SELECT * FROM tblUser WHERE role != 'admin'");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Pastimes</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Admin Dashboard</h1>
<p>Welcome, <?= htmlspecialchars($_SESSION['admin_name']) ?> | <a href="logout.php">Logout</a></p>

<h2>Manage Users</h2>
<table>
    <tr>
        <th>ID</th><th>Name</th><th>Email</th>
        <th>Role</th><th>Status</th><th>Joined</th><th>Actions</th>
    </tr>
    <?php while ($row = $users->fetch_assoc()): ?>
    <tr>
        <td><?= $row['user_id'] ?></td>
        <td><?= htmlspecialchars($row['name']) ?></td>
        <td><?= htmlspecialchars($row['email']) ?></td>
        <td><?= $row['role'] ?></td>
        <td><?= $row['status'] ?></td>
        <td><?= $row['join_date'] ?></td>
        <td>
            <?php if ($row['status'] == 'pending'): ?>
                <a href="?approve=<?= $row['user_id'] ?>">Approve</a> |
            <?php endif; ?>
            <a href="?delete=<?= $row['user_id'] ?>" 
               onclick="return confirm('Delete this user?')">Delete</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>
</body>
</html>
