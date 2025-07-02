<?php
session_start();

if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

// DB connection
$host = "localhost";
$username = "root";
$password = "";
$database = "login_portal";

$conn = new mysqli($host, $username, $password, $database);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$student_id = $_SESSION['student_id'];

// Fetch timetable rows
$sql = "SELECT * FROM timetable WHERE student_id = '$student_id' ORDER BY FIELD(day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')";
$result = $conn->query($sql);

$timetableRows = "";
while ($row = $result->fetch_assoc()) {
    $timetableRows .= "<tr>
        <td>{$row['day']}</td>
        <td>{$row['time_slot']}</td>
        <td>{$row['subject']}</td>
        <td>{$row['room_no']}</td>
        <td>{$row['teacher_name']}</td>
    </tr>";
}

$conn->close();

// Load HTML template
$template = file_get_contents("timetable.html");

// Replace placeholder
$template = str_replace("{{TIMETABLE_ROWS}}", $timetableRows, $template);

echo $template;
?>
