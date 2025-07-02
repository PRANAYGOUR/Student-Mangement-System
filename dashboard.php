<?php
session_start();

if (!isset($_SESSION['student_id'])) {
    header("Location: login.html");
    exit();
}

if (isset($_GET['logout'])) {
    session_unset();
    session_destroy();
    header("Location: login.html");
    exit();
}

$templateFile = 'dashboard.html';          
$html        = file_get_contents($templateFile);

$studentName = htmlspecialchars($_SESSION['student_name']);
$html        = str_replace('{{STUDENT_NAME}}', $studentName, $html);

echo $html;   
?>
