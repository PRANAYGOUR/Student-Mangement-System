<?php
session_start();

if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

$student_id = $_SESSION['student_id'];
$conn = new mysqli("localhost", "root", "", "login_portal");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT subject, semester, exam_type, marks_obtained, total_marks FROM marks WHERE student_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $student_id);
$stmt->execute();
$result = $stmt->get_result();

$rows_html = '';
while ($row = $result->fetch_assoc()) {
    $rows_html .= "<tr>
        <td>{$row['subject']}</td>
        <td>{$row['semester']}</td>
        <td>{$row['exam_type']}</td>
        <td>{$row['marks_obtained']}</td>
        <td>{$row['total_marks']}</td>
    </tr>";
}

if ($rows_html === '') {
    $rows_html = "<tr><td colspan='5'>No marks available.</td></tr>";
}

$template = file_get_contents("marks.html");
$template = str_replace("{{MARKS_ROWS}}", $rows_html, $template);

echo $template;
$conn->close();
?>
