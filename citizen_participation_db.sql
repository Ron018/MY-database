-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2024 at 09:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `citizen_participation_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `suggestion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_responses`
--

CREATE TABLE `feedback_responses` (
  `response_id` int(11) NOT NULL,
  `suggestion_id` int(11) NOT NULL,
  `official_id` int(11) NOT NULL,
  `response` text NOT NULL,
  `response_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_suggestions`
--

CREATE TABLE `feedback_suggestions` (
  `suggestion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `upvotes` int(11) DEFAULT 0,
  `downvotes` int(11) DEFAULT 0,
  `status` enum('open','under review','implemented','rejected','closed') DEFAULT 'open',
  `priority` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback_suggestions`
--

INSERT INTO `feedback_suggestions` (`suggestion_id`, `user_id`, `title`, `description`, `submission_date`, `upvotes`, `downvotes`, `status`, `priority`) VALUES
(1, 2, 'We need a new market', 'some random description goes right here', '2024-10-21 08:37:08', 0, 0, 'open', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_votes`
--

CREATE TABLE `feedback_votes` (
  `vote_id` int(11) NOT NULL,
  `suggestion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_type` enum('upvote','downvote') NOT NULL,
  `vote_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_message` text NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `link_url` varchar(255) DEFAULT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `notification_message`, `sent_date`, `is_read`, `link_url`, `type`) VALUES
(1, 4, 'A new poll titled \'A New poll\' has been created. Participate now!', '2024-10-21 08:26:52', 0, 'view_poll.php?poll_id=3', 'poll'),
(2, 4, 'A new project titled \'Header\' has been added.', '2024-10-21 08:29:15', 0, 'project_feedback.php?project_id=5', 'project'),
(3, 4, 'The status of the project titled \'new school in lusaka\' has been updated to \'completed\'.', '2024-10-21 08:29:31', 0, 'project_feedback.php?project_id=1', 'project'),
(4, 2, 'A new poll titled \'A New Poll\' has been created. Participate now!', '2024-10-21 08:35:12', 1, 'view_poll.php?poll_id=4', 'poll'),
(5, 4, 'A new poll titled \'A New Poll\' has been created. Participate now!', '2024-10-21 08:35:12', 0, 'view_poll.php?poll_id=4', 'poll'),
(6, 1, 'New feedback submitted: \'We need a new market\'.', '2024-10-21 08:37:08', 0, 'comments.php?suggestion_id=1', 'suggestion'),
(7, 3, 'New feedback submitted: \'We need a new market\'.', '2024-10-21 08:37:08', 1, 'comments.php?suggestion_id=1', 'suggestion'),
(8, 2, 'A new poll titled \'qwertyuio\' has been created. Participate now!', '2024-10-21 08:43:26', 1, 'view_poll.php?poll_id=5', 'poll'),
(9, 4, 'A new poll titled \'qwertyuio\' has been created. Participate now!', '2024-10-21 08:43:26', 0, 'view_poll.php?poll_id=5', 'poll'),
(10, 2, 'The project titled \'Header\' has been deleted by a moderator.', '2024-10-21 11:01:57', 0, NULL, 'project'),
(11, 3, 'The project titled \'Header\' has been deleted by a moderator.', '2024-10-21 11:01:57', 0, NULL, 'project'),
(12, 4, 'The project titled \'Header\' has been deleted by a moderator.', '2024-10-21 11:01:57', 0, NULL, 'project');

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `poll_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `closing_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`poll_id`, `title`, `description`, `creation_date`, `closing_date`, `created_by`) VALUES
(1, 'vote', 'mp', '2024-10-21 06:43:36', '2024-11-07 06:43:00', 3),
(2, 'A New poll', 'some random description goes right here', '2024-10-21 08:24:59', '2024-10-21 08:30:00', 3),
(3, 'A New poll', 'some random description goes right here', '2024-10-21 08:26:52', '2024-10-21 08:30:00', 3),
(4, 'A New Poll', 'fvhjvhwiuehvuiw', '2024-10-21 08:35:12', '2024-10-21 08:40:00', 3),
(5, 'qwertyuio', 'ASDFGHJK', '2024-10-21 08:43:26', '2024-10-24 08:43:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('in progress','completed','delayed') DEFAULT 'in progress',
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `title`, `description`, `start_date`, `end_date`, `status`, `created_by`) VALUES
(1, 'new school in lusaka', 'we have noticed that we dond have enough schools in lusaka', '2024-10-21', '2024-10-20', 'completed', 3),
(2, 'new school in lusaka', 'we have noticed that we dond have enough schools in lusaka', '2024-10-21', '2024-10-20', 'in progress', 3),
(3, 'dy6t', 'wertyui', '2024-11-01', '2024-11-10', 'in progress', 3),
(4, 'Construction of a Shopping mall', 'We are working on the new shopping market yet to be opened', '2025-02-23', '2025-12-25', 'in progress', 3);

-- --------------------------------------------------------

--
-- Table structure for table `project_feedback`
--

CREATE TABLE `project_feedback` (
  `feedback_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `public_issues`
--

CREATE TABLE `public_issues` (
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_title` varchar(255) NOT NULL,
  `issue_description` text NOT NULL,
  `report_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('open','resolved','under investigation') DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `town_hall_meetings`
--

CREATE TABLE `town_hall_meetings` (
  `meeting_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `meeting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL,
  `location_url` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `town_hall_meetings`
--

INSERT INTO `town_hall_meetings` (`meeting_id`, `title`, `meeting_date`, `description`, `location_url`, `created_by`) VALUES
(1, 'official meeting for MPs', '2024-10-28 04:37:00', 'so that we can talk about the issues that our people are facing', 'https://www.meeting.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `town_hall_registrations`
--

CREATE TABLE `town_hall_registrations` (
  `registration_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('citizen','official','moderator') DEFAULT 'citizen',
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password_hash`, `role`, `registration_date`) VALUES
(1, 'Website', 'Moderator', 'moderator@gmail.com', '$2y$10$j4bxEmjGEk2SjcAxZCZehOtFCVJL6vUzOE/HvchSK4tlFVusSAkOW', 'moderator', '2024-10-19 14:11:03'),
(2, 'Gilbert', 'Mutambala', 'gilbertgreen161@gmail.com', '$2y$10$yux45becbYKo4D/ZWfJfo.m/9zrHzZ05.2c9ws8LRO.HvJ0vsC.H6', 'citizen', '2024-10-19 14:12:27'),
(3, 'emmanuel', 'kunda', 'ekunda2003@gmail.com', '$2y$10$iIq2P0JlSxSIAiyTzPwbLuH7GHLs9ejSeDSIE6j71TRWJmQe.hCYC', 'official', '2024-10-20 04:22:44'),
(4, 'mapalo', 'Mutambala', 'laka@gmail.com', '$2y$10$G6kN/xLblLULkMPny/sslenkqbOd2AM23bOXUg7Zyow2zxN4mC/IC', 'citizen', '2024-10-20 04:25:07'),
(0, 'Joy', 'Mvula', 'joymvula2@gmail.com', '$2y$10$shVLum5a8gWzvxh8L/UedOk2EI9dGHw6r0cBG51WMv78L00ptYCZy', 'citizen', '2024-10-24 17:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `vote_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_option` enum('yes','no') NOT NULL,
  `vote_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`vote_id`, `poll_id`, `user_id`, `vote_option`, `vote_date`) VALUES
(1, 1, 4, 'yes', '2024-10-21 06:52:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `suggestion_id` (`suggestion_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback_responses`
--
ALTER TABLE `feedback_responses`
  ADD PRIMARY KEY (`response_id`),
  ADD KEY `suggestion_id` (`suggestion_id`),
  ADD KEY `official_id` (`official_id`);

--
-- Indexes for table `feedback_suggestions`
--
ALTER TABLE `feedback_suggestions`
  ADD PRIMARY KEY (`suggestion_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback_votes`
--
ALTER TABLE `feedback_votes`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `suggestion_id` (`suggestion_id`),
  ADD KEY `user_id` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
