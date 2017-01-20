-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2017 at 11:44 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `midexam`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `content` varchar(250) NOT NULL,
  `true_or_false` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `quiz_id`, `content`, `true_or_false`) VALUES
(1, 1, 'I don''t know.....', 0),
(2, 1, 'Barack Obama', 0),
(3, 1, 'Someone in the world.....', 0),
(4, 1, 'George Washington.....', 1),
(5, 7, '3', 1),
(7, 9, '2', 1),
(8, 7, '1', 0),
(9, 10, 'I don''t know', 0),
(10, 10, '40', 1),
(11, 9, '3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'History'),
(2, 'Math'),
(3, 'Physical'),
(4, 'Biology');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(250) NOT NULL,
  `num_of_test` int(11) NOT NULL,
  `num_of_question` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `exam_name`, `num_of_test`, `num_of_question`, `course_id`) VALUES
(1, 'Test Math Basic', 6, 10, 2),
(2, 'Exam History', 4, 10, 1),
(3, 'Exam Physical Basic', 3, 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exam_item`
--

CREATE TABLE `exam_item` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_item`
--

INSERT INTO `exam_item` (`id`, `exam_id`, `quiz_id`) VALUES
(1, 1, 7),
(5, 1, 7),
(7, 1, 7),
(19, 1, 7),
(21, 1, 7),
(2, 1, 10),
(6, 1, 10),
(8, 1, 10),
(20, 1, 10),
(22, 1, 10),
(3, 2, 1),
(9, 2, 1),
(11, 2, 1),
(13, 2, 1),
(15, 2, 1),
(17, 2, 1),
(4, 2, 9),
(10, 2, 11),
(12, 2, 11),
(14, 2, 11),
(16, 2, 11),
(18, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `difficult` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `category_id`, `content`, `difficult`) VALUES
(1, 1, 'Who is the first president of the US?', 'Normal'),
(7, 2, '1+2+0=?', 'Easy'),
(9, 4, 'How many eyes in the face on normal human?', 'Easy'),
(10, 2, '5*8/9+9=?', 'Easy'),
(11, 1, 'Who is Tran Quoc Toan?', 'Easy');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `pass_or_fail` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `user_id`, `exam_id`, `point`, `pass_or_fail`) VALUES
(60, 1, 1, 0, 'Fail'),
(61, 1, 1, 3, 'Fail'),
(62, 1, 1, 3, 'Fail');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `choice_answer` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `result_id`, `quiz_id`, `choice_answer`) VALUES
(128, 60, 7, ''),
(129, 60, 7, ''),
(130, 60, 7, ''),
(131, 60, 10, ''),
(132, 60, 10, ''),
(133, 60, 10, ''),
(134, 61, 7, '1'),
(135, 61, 7, '3'),
(136, 61, 7, '3'),
(137, 61, 10, 'I don''t know'),
(138, 61, 10, '40'),
(139, 61, 10, 'I don''t know'),
(140, 62, 7, '1'),
(141, 62, 7, '3'),
(142, 62, 7, '3'),
(143, 62, 10, 'I don''t know'),
(144, 62, 10, '40'),
(145, 62, 10, 'I don''t know');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `pass_word` varchar(250) NOT NULL,
  `full_name_user` varchar(250) NOT NULL,
  `role_id` int(11) NOT NULL,
  `enabled` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `pass_word`, `full_name_user`, `role_id`, `enabled`) VALUES
(1, 'admin', '123', 'Nguyen Van Admin', 1, 1),
(3, 'hmtam', '123', 'Ho Minh Tam', 2, 1),
(4, 'user1', '123', 'Tran Van User1', 3, 1),
(5, 'user2', '123', 'Tran Van User2', 3, 1),
(8, 'dasdasd', '123', 'gfsgdf', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role_name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_DB'),
(3, 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `exam_item`
--
ALTER TABLE `exam_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`,`quiz_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`exam_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `result_id` (`result_id`,`quiz_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exam_item`
--
ALTER TABLE `exam_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `exam_item`
--
ALTER TABLE `exam_item`
  ADD CONSTRAINT `exam_item_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  ADD CONSTRAINT `exam_item_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  ADD CONSTRAINT `result_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `result` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
