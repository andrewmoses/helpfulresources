-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2021 at 08:02 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpfulresources`
--

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `PK` int(11) NOT NULL,
  `Subjects` text NOT NULL,
  `Resource_2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`PK`, `Subjects`, `Resource_2`) VALUES
(1, 'Computer Science', 'https://www.openaccessgovernment.org/wp-content/uploads/2020/08/dreamstime_l_124110584.jpg'),
(2, 'Physics', 'https://images.theconversation.com/files/191827/original/file-20171025-25516-g7rtyl.jpg?ixlib=rb-1.1.0&rect=0%2C70%2C7875%2C5667&q=45&auto=format&w=926&fit=clip'),
(3, 'Math', 'https://miro.medium.com/max/875/1*L76A5gL6176UbMgn7q4Ybg.jpeg'),
(4, 'Chemistry ', 'https://res.cloudinary.com/grand-canyon-university/image/fetch/w_750,h_564,c_fill,g_faces,q_auto,f_auto/https://www.gcu.edu/sites/default/files/media/images/Blog/engineering-and-technology/chemistry-materials.jpg'),
(5, 'Geography', 'https://mk0kaleelao979sb1ktf.kinstacdn.com/wp-content/uploads/2019/08/Geography-Terms-In-Arabic-Language.jpg'),
(6, 'History', 'https://i0.wp.com/wsap.academy/wp-content/uploads/2015/03/1123676.jpg?zoom=1.25&resize=700%2C466'),
(7, 'test subject andy', 'https://img.jagranjosh.com/images/2021/April/1942021/Vera-gedroits-biography.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `prayers`
--

CREATE TABLE `prayers` (
  `point` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prayers`
--

INSERT INTO `prayers` (`point`, `tag`) VALUES
('prayer point', '#tag');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`PK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
