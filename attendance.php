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

// Search date logic
$search_date = isset($_GET['date']) ? $_GET['date'] : '';
$params = [$student_id];
$query = "SELECT * FROM attendance WHERE student_id = ?";

if (!empty($search_date)) {
    $query .= " AND date = ?";
    $params[] = $search_date;
}

// Prepare statement
$stmt = $conn->prepare($query);
if (count($params) === 2) {
    $stmt->bind_param("ss", $params[0], $params[1]);
} else {
    $stmt->bind_param("s", $params[0]);
}

$stmt->execute();
$result = $stmt->get_result();

$rows_html = '';
$total = 0;
$present = 0;

while ($row = $result->fetch_assoc()) {
    $rows_html .= "<tr><td>{$row['date']}</td><td>{$row['status']}</td></tr>";
    $total++;
    if ($row['status'] === 'Present') {
        $present++;
    }
}

$percentage = $total > 0 ? round(($present / $total) * 100, 2) : 0;

// Load and update HTML
$template = file_get_contents("attendance.html");
$template = str_replace("{{PERCENTAGE}}", $percentage, $template);
$template = str_replace("{{ATTENDANCE_ROWS}}", $rows_html ?: "<tr><td colspan='2'>No attendance records found.</td></tr>", $template);

echo $template;
$conn->close();
?>
