<?php
session_start();

// Redirect if not logged in
if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

$host = "localhost";
$username = "root";
$password = "";
$database = "login_portal";

// Connect to DB
$conn = new mysqli($host, $username, $password, $database);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get current student ID
$student_id = $_SESSION['student_id'];

// Fetch student data
$sql = "SELECT * FROM students WHERE id = '$student_id'";
$result = $conn->query($sql);
$student = $result->fetch_assoc();

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Student Profile</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: url('bg.jpg');
      background-size: cover;
      margin: 0;
      padding: 0;
    }

    .profile-container {
      max-width: 600px;
      margin: 80px auto;
      background-color: rgba(255,255,255,0.95);
      padding: 30px;
      border: 4px solid black;
      border-radius: 10px;
    }

    h2 {
      text-align: center;
      color: #4a90e2;
    }

    .profile-info {
      margin-top: 20px;
    }

    .profile-info label {
      font-weight: bold;
      color: #333;
      display: inline-block;
      width: 160px;
    }

    .profile-info p {
      display: inline-block;
      margin: 5px 0 15px;
      color: #555;
    }

    .back-btn {
      text-align: center;
      margin-top: 30px;
    }

    .back-btn a {
      background-color: #4a90e2;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
    }

    .back-btn a:hover {
      background-color: #2c6eb6;
    }

    @media(max-width: 600px) {
      .profile-container {
        margin: 30px 10px;
        padding: 20px;
      }
      .profile-info label {
        width: 120px;
      }
    }
  </style>
</head>
<body>

  <div class="profile-container">
    <h2>Student Profile</h2>
    <div class="profile-info">
      <label>ID:</label>
      <p><?= $student['id'] ?></p><br>

      <label>Registration Number:</label>
      <p><?= $student['registration_number'] ?></p><br>

      <label>Name:</label>
      <p><?= $student['name'] ?></p><br>

      <label>Department:</label>
      <p><?= $student['department'] ?></p><br>

      <label>Semester:</label>
      <p><?= $student['semester'] ?></p><br>

      <label>Email:</label>
      <p><?= $student['email'] ?></p><br>

      <label>Phone:</label>
      <p><?= $student['phone'] ?></p>
    </div>

    <div class="back-btn">
      <a href="dashboard.php">← Back to Dashboard</a>
    </div>
  </div>

</body>
</html>
