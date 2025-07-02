<?php
session_start();

// ✅ 1. Ensure user is logged in
if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

$student_id = $_SESSION['student_id'];

// ✅ 2. Connect to DB
$host = "localhost";
$username = "root";
$password = "";
$database = "login_portal";
$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// ✅ 3. Process uploaded file
if (isset($_FILES['profile_image'])) {
    $image = $_FILES['profile_image'];

    // 🔍 Validate image type
    $allowedTypes = ['image/jpeg', 'image/png', 'image/jpg'];
    if (!in_array($image['type'], $allowedTypes)) {
        echo "<script>alert('Only JPG, JPEG, PNG files allowed.'); window.location.href='profile.php';</script>";
        exit();
    }

    // 🔍 Validate file size (limit: 2MB)
    if ($image['size'] > 2 * 1024 * 1024) {
        echo "<script>alert('File too large. Max size is 2MB.'); window.location.href='profile.php';</script>";
        exit();
    }

    // 🔃 Generate unique file name: studentID_timestamp.ext
    $ext = pathinfo($image['name'], PATHINFO_EXTENSION);
    $newFileName = $student_id . "_" . time() . "." . $ext;
    $targetDir = "uploads/";
    $targetPath = $targetDir . $newFileName;

    // 🔁 Delete old image (if not default)
    $result = $conn->query("SELECT profile_image FROM students WHERE id = '$student_id'");
    if ($result->num_rows > 0) {
        $oldImage = $result->fetch_assoc()['profile_image'];
        if ($oldImage !== 'default.jpg' && file_exists($targetDir . $oldImage)) {
            unlink($targetDir . $oldImage); // delete file
        }
    }

    // 📥 Move new file
    if (move_uploaded_file($image['tmp_name'], $targetPath)) {
        // ✅ Update DB with new image path
        $conn->query("UPDATE students SET profile_image = '$newFileName' WHERE id = '$student_id'");
        echo "<script>alert('Profile image updated successfully.'); window.location.href='profile.php';</script>";
    } else {
        echo "<script>alert('Error uploading image.'); window.location.href='profile.php';</script>";
    }
} else {
    echo "<script>alert('No file selected.'); window.location.href='profile.php';</script>";
}

$conn->close();
?>
