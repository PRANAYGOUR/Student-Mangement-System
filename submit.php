<?php
session_start();

// Database settings
$host = "localhost";
$username = "root";
$password = "";
$database = "login_portal";

// Connect
$conn = new mysqli($host, $username, $password, $database);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get and sanitize input
$id = mysqli_real_escape_string($conn, $_POST['id']);
$reg = mysqli_real_escape_string($conn, $_POST['reg']);

// Check in students table
$sql = "SELECT * FROM students WHERE id = '$id' AND registration_number = '$reg'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // ✅ Valid credentials
    $row = $result->fetch_assoc();
    $_SESSION['student_id'] = $row['id'];
    $_SESSION['student_name'] = $row['name'];

    header("Location: dashboard.php");
    exit();
} else {
    // ❌ Invalid login
    echo "<h2 style='color:red; text-align:center;'>Invalid ID or Registration Number</h2>";
}

$conn->close();
?>
