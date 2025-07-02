<?php
session_start();

if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

$student_id = $_SESSION['student_id'];

// Connect to database
$conn = new mysqli("localhost", "root", "", "login_portal");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch assignments for this student
$sql = "SELECT title, description, subject, due_date, status 
        FROM assignments 
        WHERE student_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $student_id);
$stmt->execute();
$result = $stmt->get_result();

$assignmentRows = '';
while ($row = $result->fetch_assoc()) {
    $assignmentRows .= "<tr>
        <td>" . htmlspecialchars($row['title']) . "</td>
        <td>" . htmlspecialchars($row['description']) . "</td>
        <td>" . htmlspecialchars($row['subject']) . "</td>
        <td>" . htmlspecialchars($row['due_date']) . "</td>
        <td>" . htmlspecialchars($row['status']) . "</td>
    </tr>";
}

$conn->close();

// Load HTML template
$template = file_get_contents('assignments.html');
$template = str_replace('{{ASSIGNMENT_ROWS}}', $assignmentRows, $template);

echo $template;
?>
