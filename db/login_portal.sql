-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 10:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('Pending','Submitted') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `student_id`, `title`, `description`, `subject`, `due_date`, `status`) VALUES
(1, 'STD001', 'Algebra Worksheet', 'Complete all questions from chapter 3.', 'Mathematics', '2025-07-10', 'Pending'),
(2, 'STD001', 'Lab Report 1', 'Submit the experiment report.', 'Physics', '2025-07-15', 'Submitted'),
(3, 'STD001', 'Periodic Table Chart', 'Create a visual chart.', 'Chemistry', '2025-07-12', 'Pending'),
(4, 'STD002', 'Electrical Circuits Assignment', 'Solve given circuit problems.', 'Electronics', '2025-07-09', 'Submitted'),
(5, 'STD002', 'Project Proposal', 'Submit abstract for project.', 'Electrical Machines', '2025-07-14', 'Pending'),
(6, 'STD003', 'Thermodynamics Notes', 'Summarize chapters 1-4.', 'Thermodynamics', '2025-07-08', 'Submitted'),
(7, 'STD003', 'Mechanics Worksheet', 'Solve all numerical problems.', 'Mechanics', '2025-07-13', 'Pending'),
(8, 'STD004', 'Bridge Design Assignment', 'Design and draw a model.', 'Structural Analysis', '2025-07-11', 'Pending'),
(9, 'STD004', 'Survey Field Work', 'Upload survey maps.', 'Surveying', '2025-07-16', 'Submitted'),
(10, 'STD005', 'Database Design', 'Design schema for college database.', 'Databases', '2025-07-10', 'Submitted'),
(11, 'STD005', 'HTML Portfolio', 'Build a personal portfolio.', 'Web Development', '2025-07-12', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `status` enum('Present','Absent','Leave') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `date`, `status`) VALUES
(1, 'STD001', '2025-06-20', 'Present'),
(2, 'STD001', '2025-06-21', 'Present'),
(3, 'STD001', '2025-06-22', 'Absent'),
(4, 'STD001', '2025-06-23', 'Present'),
(5, 'STD001', '2025-06-24', 'Present'),
(6, 'STD001', '2025-06-25', 'Leave'),
(7, 'STD001', '2025-06-26', 'Present'),
(8, 'STD001', '2025-06-27', 'Present'),
(9, 'STD001', '2025-06-28', 'Present'),
(10, 'STD001', '2025-06-29', 'Absent'),
(11, 'STD002', '2025-06-20', 'Present'),
(12, 'STD002', '2025-06-21', 'Present'),
(13, 'STD002', '2025-06-22', 'Present'),
(14, 'STD002', '2025-06-23', 'Absent'),
(15, 'STD002', '2025-06-24', 'Leave'),
(16, 'STD002', '2025-06-25', 'Present'),
(17, 'STD002', '2025-06-26', 'Present'),
(18, 'STD002', '2025-06-27', 'Absent'),
(19, 'STD002', '2025-06-28', 'Present'),
(20, 'STD002', '2025-06-29', 'Present'),
(21, 'STD003', '2025-06-20', 'Absent'),
(22, 'STD003', '2025-06-21', 'Present'),
(23, 'STD003', '2025-06-22', 'Leave'),
(24, 'STD003', '2025-06-23', 'Present'),
(25, 'STD003', '2025-06-24', 'Present'),
(26, 'STD003', '2025-06-25', 'Present'),
(27, 'STD003', '2025-06-26', 'Present'),
(28, 'STD003', '2025-06-27', 'Absent'),
(29, 'STD003', '2025-06-28', 'Present'),
(30, 'STD003', '2025-06-29', 'Present'),
(31, 'STD004', '2025-06-20', 'Present'),
(32, 'STD004', '2025-06-21', 'Leave'),
(33, 'STD004', '2025-06-22', 'Absent'),
(34, 'STD004', '2025-06-23', 'Present'),
(35, 'STD004', '2025-06-24', 'Present'),
(36, 'STD004', '2025-06-25', 'Present'),
(37, 'STD004', '2025-06-26', 'Absent'),
(38, 'STD004', '2025-06-27', 'Present'),
(39, 'STD004', '2025-06-28', 'Present'),
(40, 'STD004', '2025-06-29', 'Present'),
(41, 'STD005', '2025-06-20', 'Present'),
(42, 'STD005', '2025-06-21', 'Present'),
(43, 'STD005', '2025-06-22', 'Present'),
(44, 'STD005', '2025-06-23', 'Present'),
(45, 'STD005', '2025-06-24', 'Leave'),
(46, 'STD005', '2025-06-25', 'Absent'),
(47, 'STD005', '2025-06-26', 'Present'),
(48, 'STD005', '2025-06-27', 'Present'),
(49, 'STD005', '2025-06-28', 'Present'),
(50, 'STD005', '2025-06-29', 'Absent');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `exam_type` enum('Internal','Midterm','Final') NOT NULL,
  `marks_obtained` float DEFAULT NULL,
  `total_marks` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `student_id`, `subject`, `semester`, `exam_type`, `marks_obtained`, `total_marks`) VALUES
(1, 'STD001', 'Mathematics', 3, 'Internal', 18, 20),
(2, 'STD001', 'Mathematics', 3, 'Final', 88, 100),
(3, 'STD001', 'Physics', 3, 'Final', 72, 100),
(4, 'STD001', 'Chemistry', 3, 'Midterm', 35, 50),
(5, 'STD001', 'Computer Science', 3, 'Final', 90, 100),
(6, 'STD002', 'Mathematics', 5, 'Internal', 17, 20),
(7, 'STD002', 'Mathematics', 5, 'Final', 82, 100),
(8, 'STD002', 'Physics', 5, 'Final', 75, 100),
(9, 'STD002', 'Electronics', 5, 'Midterm', 32, 50),
(10, 'STD002', 'Electrical Machines', 5, 'Final', 85, 100),
(11, 'STD003', 'Mathematics', 4, 'Internal', 16, 20),
(12, 'STD003', 'Mathematics', 4, 'Final', 80, 100),
(13, 'STD003', 'Thermodynamics', 4, 'Final', 78, 100),
(14, 'STD003', 'Mechanics', 4, 'Midterm', 34, 50),
(15, 'STD003', 'Material Science', 4, 'Final', 88, 100),
(16, 'STD004', 'Mathematics', 2, 'Internal', 19, 20),
(17, 'STD004', 'Mathematics', 2, 'Final', 91, 100),
(18, 'STD004', 'Structural Analysis', 2, 'Final', 76, 100),
(19, 'STD004', 'Surveying', 2, 'Midterm', 33, 50),
(20, 'STD004', 'Construction Materials', 2, 'Final', 82, 100),
(21, 'STD005', 'Mathematics', 6, 'Internal', 18, 20),
(22, 'STD005', 'Mathematics', 6, 'Final', 87, 100),
(23, 'STD005', 'Operating Systems', 6, 'Final', 84, 100),
(24, 'STD005', 'Databases', 6, 'Midterm', 36, 50),
(25, 'STD005', 'Web Development', 6, 'Final', 91, 100);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `description`, `date`) VALUES
(1, 'Mid-Sem Exam Schedule', 'Mid-semester exams will begin from 15th July. Check the timetable.', '2025-07-01'),
(2, 'Workshop on AI', 'AI Workshop by Prof. Nair on 10th July in Auditorium.', '2025-06-28'),
(3, 'Assignment Deadline Extended', 'The submission deadline for all assignments is extended to 12th July.', '2025-07-03'),
(4, 'Campus Recruitment Drive', 'Wipro will conduct campus interviews on 20th July.', '2025-07-02'),
(5, 'Library Closed', 'The library will remain closed on 5th July due to maintenance.', '2025-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` varchar(20) NOT NULL,
  `registration_number` varchar(30) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `registration_number`, `name`, `department`, `semester`, `email`, `phone`, `profile_image`) VALUES
('STD001', 'REG2023001', 'Aarav Mehta', 'Computer Science', 3, 'aarav@gmail.com', '9876543210', 'default.png'),
('STD002', 'REG2023002', 'Meera Sharma', 'Electrical Engineering', 5, 'meera@yahoo.com', '8765432109', 'default.png'),
('STD003', 'REG2023003', 'Rohan Patel', 'Mechanical Engineering', 4, 'rohan.patel@college.edu', '9123456780', 'default.png'),
('STD004', 'REG2023004', 'Ananya Singh', 'Civil Engineering', 2, 'ananya@gmail.com', '9988776655', 'default.png'),
('STD005', 'REG2023005', 'Karthik Iyer', 'Information Technology', 6, 'karthik@outlook.com', '9001122334', 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `day` varchar(15) DEFAULT NULL,
  `time_slot` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `teacher_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `student_id`, `day`, `time_slot`, `subject`, `room_no`, `teacher_name`) VALUES
(1, 'STD001', 'Monday', '09:00 - 10:00', 'Mathematics', 'Room 101', 'Dr. Rao'),
(2, 'STD001', 'Monday', '10:00 - 11:00', 'Physics', 'Room 102', 'Ms. Gupta'),
(3, 'STD001', 'Tuesday', '09:00 - 10:00', 'Computer Science', 'Lab 1', 'Mr. Shah'),
(4, 'STD001', 'Wednesday', '11:00 - 12:00', 'Chemistry', 'Room 103', 'Dr. Verma'),
(5, 'STD001', 'Friday', '01:00 - 02:00', 'Mathematics', 'Room 101', 'Dr. Rao'),
(6, 'STD002', 'Monday', '10:00 - 11:00', 'Mathematics', 'Room 201', 'Dr. Kapoor'),
(7, 'STD002', 'Tuesday', '11:00 - 12:00', 'Physics', 'Room 202', 'Mr. Mehta'),
(8, 'STD002', 'Wednesday', '12:00 - 01:00', 'Chemistry', 'Room 203', 'Ms. Rani'),
(9, 'STD002', 'Thursday', '01:00 - 02:00', 'Electrical Circuits', 'Lab 2', 'Dr. Bose'),
(10, 'STD003', 'Monday', '09:00 - 10:00', 'Thermodynamics', 'Room 301', 'Mr. Kulkarni'),
(11, 'STD003', 'Tuesday', '10:00 - 11:00', 'Mathematics', 'Room 302', 'Dr. Sinha'),
(12, 'STD003', 'Wednesday', '11:00 - 12:00', 'Material Science', 'Room 303', 'Dr. Ghosh'),
(13, 'STD004', 'Monday', '11:00 - 12:00', 'Surveying', 'Room 401', 'Mr. Thomas'),
(14, 'STD004', 'Tuesday', '12:00 - 01:00', 'Mathematics', 'Room 402', 'Dr. Yadav'),
(15, 'STD004', 'Wednesday', '09:00 - 10:00', 'Hydraulics', 'Room 403', 'Ms. Ahuja'),
(16, 'STD005', 'Monday', '10:00 - 11:00', 'Data Structures', 'Lab 3', 'Mr. Banerjee'),
(17, 'STD005', 'Tuesday', '11:00 - 12:00', 'Database Systems', 'Lab 4', 'Dr. Kumar'),
(18, 'STD005', 'Wednesday', '01:00 - 02:00', 'Web Technologies', 'Room 501', 'Ms. Roy');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `registration_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `registration_number`) VALUES
('12', '30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
