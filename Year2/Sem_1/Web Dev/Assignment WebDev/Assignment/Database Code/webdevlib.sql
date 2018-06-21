-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2015 at 04:06 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdevlib`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `ISBN` varchar(15) NOT NULL,
  `BookTitle` varchar(40) NOT NULL,
  `Author` varchar(30) NOT NULL,
  `Edition` int(2) unsigned NOT NULL,
  `BookYear` int(4) unsigned NOT NULL,
  `Cat_Id` int(3) unsigned NOT NULL,
  `Reserved` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `BookTitle`, `Author`, `Edition`, `BookYear`, `Cat_Id`, `Reserved`) VALUES
('08326723-2272', 'Staying Fit With Martin', 'Martin O''Neil', 1, 2008, 1, 'N'),
('093-403992', 'Computers in Business', 'Alicia ONeill', 3, 1997, 3, 'N'),
('23472-8729', 'Exploring Peru', 'Stephanie Birchi', 4, 2005, 5, 'N'),
('237-34823', 'Business Strategy', 'Joe Peppard', 2, 2002, 2, 'Y'),
('23u8-923849', 'A guide to nutrition', 'John Thorpe', 2, 1997, 1, 'Y'),
('42571tygh-72', 'eeeee', 'eeeee', 1, 2015, 1, 'N'),
('712389-fwjee', 'eeeeee', 'eeeeee', 1, 2015, 1, 'N'),
('82u8-308', 'computers for idiots', 'Susan O''Neill', 5, 1998, 4, 'N'),
('9823-23984', 'My life in picture', 'Kevin Graham', 8, 2004, 1, 'N'),
('9823-2403-0', 'DaVinci Code', 'Dan Brown', 1, 2003, 8, 'N'),
('9823-98345', 'How to cook Italian food', 'Jamie Oliver', 2, 2005, 7, 'Y'),
('9823-98487', 'Optimising your business', 'Cleo Blair', 1, 2001, 2, 'N'),
('98234-029384', 'My ranch in Texas', 'George Bush', 1, 2005, 1, 'Y'),
('988745-234', 'Tara Road', 'Maeve Binchy', 4, 2002, 8, 'N'),
('993-004-00', 'My life in bits', 'John Smith', 1, 2001, 1, 'N'),
('9987-0039882', 'Shooting History', 'Jon Snow', 1, 2003, 1, 'N'),
('dihsd-27712', 'eeeeeee', 'eeeeeee', 1, 2015, 1, 'N'),
('dyuqwhv-289', 'eeee', 'eeee', 1, 2015, 1, 'N'),
('hsgaoaja-7879', 'eee', 'eee', 1, 2015, 1, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `Cat_Id` int(3) unsigned NOT NULL,
  `Description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Cat_Id`, `Description`) VALUES
(1, 'Health'),
(2, 'Business'),
(3, 'Biography'),
(4, 'Technology'),
(5, 'Travel'),
(6, 'Self-Help'),
(7, 'Cookery'),
(8, 'Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `reserved`
--

CREATE TABLE IF NOT EXISTS `reserved` (
  `ISBN` varchar(15) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `ReservedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserved`
--

INSERT INTO `reserved` (`ISBN`, `UserName`, `ReservedDate`) VALUES
('9823-98345', 'joecrotty', '2008-10-11'),
('98234-029384', 'joecrotty', '2008-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UserName` varchar(30) NOT NULL,
  `Pass` varchar(6) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Address1` varchar(30) NOT NULL,
  `Address2` varchar(30) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `Telephone` bigint(10) NOT NULL,
  `Mobile` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserName`, `Pass`, `FirstName`, `Surname`, `Address1`, `Address2`, `City`, `Telephone`, `Mobile`) VALUES
('Admin', 'DT1107', 'Daniel', 'Tilley', 'DIT', 'Kevin Street', 'Dublin', 861234567, 123456789),
('alanjmckenna', 't1234s', 'Alan', 'McKenna', '38 Cranley Road', 'Fairview', 'Dublin', 998377, 856625567),
('joecrotty', 'kj7899', 'Joseph', 'Crotty', 'Apt 5 Clyde Road', 'Donnybrook', 'Dublin', 8887889, 876654456),
('tommy100', '123456', 'Tom', 'Behan', '14 Hyde Road', 'Dalkey', 'Dublin', 9983747, 876738782);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `ID_FK` (`Cat_Id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Cat_Id`);

--
-- Indexes for table `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `UserName_FK` (`UserName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`Cat_Id`) REFERENCES `category` (`Cat_Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `reserved`
--
ALTER TABLE `reserved`
  ADD CONSTRAINT `reserved_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserved_ibfk_2` FOREIGN KEY (`UserName`) REFERENCES `users` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
