-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2021 at 07:22 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helperdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `body` text NOT NULL,
  `author` text NOT NULL,
  `a_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `description`, `body`, `author`, `a_datetime`) VALUES
(1, 'Quiet Time workshop', 'session on how to do quiet time', 'body', 'Calvin', '2021-06-04 04:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `passcode` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`passcode`, `type`) VALUES
('911admin', 'admin'),
('108prayer', 'prayer');

-- --------------------------------------------------------

--
-- Table structure for table `prayerlogs`
--

CREATE TABLE `prayerlogs` (
  `id` int(11) NOT NULL,
  `prayercellid` int(11) DEFAULT NULL,
  `body` text,
  `e_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prayerlogs`
--

INSERT INTO `prayerlogs` (`id`, `prayercellid`, `body`, `e_datetime`) VALUES
(1, 1, 'being good', '2021-06-04 03:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `prayers`
--

CREATE TABLE `prayers` (
  `id` int(11) NOT NULL,
  `cell_name` text NOT NULL,
  `cell_leader` text NOT NULL,
  `cell_members` text NOT NULL,
  `area` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prayers`
--

INSERT INTO `prayers` (`id`, `cell_name`, `cell_leader`, `cell_members`, `area`) VALUES
(1, 'SRM Prayer cell', 'Kezia', 'Teja, Joshua, William, ..', 'Tambaram');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prayerlogs`
--
ALTER TABLE `prayerlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prayercellid` (`prayercellid`);

--
-- Indexes for table `prayers`
--
ALTER TABLE `prayers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prayerlogs`
--
ALTER TABLE `prayerlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prayers`
--
ALTER TABLE `prayers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prayerlogs`
--
ALTER TABLE `prayerlogs`
  ADD CONSTRAINT `prayerlogs_ibfk_1` FOREIGN KEY (`prayercellid`) REFERENCES `prayers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
