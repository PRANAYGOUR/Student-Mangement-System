<?php
session_start();

if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

$conn = new mysqli("localhost", "root", "", "login_portal");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT title, description, date FROM notices ORDER BY date DESC";
$result = $conn->query($sql);

$noticesHTML = '';
while ($row = $result->fetch_assoc()) {
    $noticesHTML .= "
    <div class='notice'>
      <h3>" . htmlspecialchars($row['title']) . "</h3>
      <p>" . htmlspecialchars($row['description']) . "</p>
      <small>📅 " . htmlspecialchars($row['date']) . "</small>
    </div>";
}

$conn->close();

$template = file_get_contents('notices.html');
$template = str_replace('{{NOTICES_LIST}}', $noticesHTML, $template);

echo $template;
?>
