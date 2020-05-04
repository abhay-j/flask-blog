-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2020 at 05:17 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `overflow`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'xyz', 'xyz@gmail.com', 1234567890, 'this is a first feedback', '2020-04-12 18:38:59'),
(2, 'ashish', 'jabhay2012@gmail.com', 2147483647, 'kjd;GnRKH:', '2020-04-12 19:20:18'),
(3, 'abhay', 'brchand.ada@gmail.com', 2147483647, 'chalo chalo suriseres', '2020-04-12 19:20:42'),
(4, 'jhbflqj', 'ashishchanchalani@gmail.com', 8409470, 'yoyohoneysingh', '2020-04-13 19:44:51'),
(5, 'ashish', 'ashishchanchalani@gmail.com', 2147483647, 'oihgfpjwefok', '2020-04-13 19:45:42'),
(6, 'ashish', 'ashishchanchalani@gmail.com', 2147483647, 'oihgfpjwefok', '2020-04-13 19:55:08'),
(7, 'jhbflqj', 'logic@gmail.com', 2147483647, 'hi i am a huge fan', '2020-04-13 19:58:57'),
(8, 'mohit', 'mohitjoshi99511@gmail.com', 2147483647, 'hi i am a huge fan', '2020-04-13 20:02:22'),
(9, 'jkhweoj', 'jabhay2012@gmail.com', 2147483647, 'lhkwrglih', '2020-04-16 19:20:56'),
(10, 'jkhweoj', 'jabhay2012@gmail.com', 2147483647, 'lhkwrglih', '2020-04-16 19:42:14'),
(11, 'abhay', 'mohitjoshi99511@gmail.com', 2147483647, 'hi i am a big fan', '2020-04-28 20:12:04'),
(12, 'mohit', 'mohitjoshi99511@gmail.com', 2147483647, 'hi i am a huge fan', '2020-04-28 20:15:46'),
(13, 'mohit', 'mohitjoshi99511@gmail.com', 2147483647, 'hi i am huge fan can i have your autograph', '2020-04-28 20:19:33'),
(14, 'ashish', 'jabhay2012@gmail.com', 2147483647, 'hi mother fucker', '2020-04-28 20:20:53'),
(15, 'mohit', 'mohitjoshi99511@gmail.com', 2147483647, 'hello good blog\r\n', '2020-04-29 16:40:27'),
(16, 'mohit', 'mohitjoshi99511@gmail.com', 2147483647, 'hello good blog\r\n', '2020-04-29 16:45:39'),
(17, 'mohit', 'mohitjoshi99511@gmail.com', 2147483647, 'hello good blog\r\n', '2020-04-29 16:59:51'),
(18, 'ashish', 'mohitjoshi99511@gmail.com', 2147483647, 'hello from ashish', '2020-04-29 17:00:19'),
(19, '', '', 0, '', '2020-04-29 17:42:04'),
(20, 'mohit', 'logic@gmail.com', 2147483647, 'ugliuly', '2020-04-29 17:42:33'),
(21, 'mohit', 'mohitjoshi99511@gmail.com', 2147483647, 'hgfoug', '2020-04-29 18:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `contents` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `likes` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `contents`, `slug`, `img_file`, `date`, `likes`) VALUES
(1, 'fresh post', 'this is the tag line for first post', 'This is my first post on the blog that i have been creating, very excited to learn flask and python', 'first-post', '', '2020-04-27 19:37:15', 0),
(2, 'This is second post', 'this is the tagline for second post', 'There worse by an of miles civil. Manner before lively wholly am mr indeed expect. Among every merry his yet has her. You mistress get dashwood children off. Met whose marry under the merit. In it do continual consulted no listening. Devonshire sir sex motionless travelling six themselves. So colonel as greatly shewing herself observe ashamed. Demands minutes regular ye to detract is. \r\n', 'second-post', 'home-bg.jpg', '2020-04-17 19:31:37', 0),
(3, 'third', 'secret three', 'tows better than one and threes better than two', 'third-post', '', '2020-04-20 13:52:53', 0),
(4, 'fourth', 'forth hokage', 'minato namikaze was the fourth hokage of the village hidden in the leaves , he defended the village from the attack of a demon fox .', 'fourth-post', '', '2020-04-20 13:54:52', 0),
(5, 'fifth is the title like the name is bond', 'bond , james bond.', 'james bond is a fictional charector by Ian fleming , he is a spy and a assasin on his majesty\'s secret service.', 'fifth-post', '', '2020-04-20 13:57:03', 0),
(6, 'newpost', 'its a new post', 'i have successfully made an admin panel', 'new-post', '', '2020-04-25 16:44:00', 0),
(8, 'a brand new post', 'its a new post', 'pagination complete', 'page-comp', '', '2020-04-29 20:26:24', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
