<?php
session_start();

// Redirect if not logged in
if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

$student_id = $_SESSION['student_id'];

// DB config
$conn = new mysqli("localhost", "root", "", "login_portal");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get student data
$sql = "SELECT * FROM students WHERE id = '$student_id'";
$result = $conn->query($sql);
$student = $result->fetch_assoc();
$conn->close();

if (!$student) {
    echo "Student not found.";
    exit();
}

// Load the HTML template
$template = file_get_contents("profile.html");

// Build full path to image
$imagePath = "uploads/" . $student['profile_image'];
$template = str_replace("{{PROFILE_IMAGE}}", htmlspecialchars($imagePath), $template);

// Replace other placeholders
foreach ($student as $key => $value) {
    $template = str_replace("{{" . strtoupper($key) . "}}", htmlspecialchars($value), $template);
}

// Output final HTML
echo $template;
?>
