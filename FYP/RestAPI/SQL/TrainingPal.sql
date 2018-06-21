-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2018 at 01:48 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TrainingPal`
--

-- --------------------------------------------------------

--
-- Table structure for table `Coach_Athlete`
--

CREATE TABLE `Coach_Athlete` (
  `Athlete_Id` varchar(20) NOT NULL,
  `Coach_Id` varchar(20) NOT NULL,
  `Can_Access_Training_Log` int(1) NOT NULL,
  `Can_Access_Targets` int(1) NOT NULL,
  `Is_Active` int(1) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `Invite_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Coach_Athlete`
--

INSERT INTO `Coach_Athlete` (`Athlete_Id`, `Coach_Id`, `Can_Access_Training_Log`, `Can_Access_Targets`, `Is_Active`, `Start_Date`, `Invite_Id`) VALUES
('DanielTilley', 'test_coach', 1, 1, 0, '2018-04-12', 9);

-- --------------------------------------------------------

--
-- Table structure for table `Events`
--

CREATE TABLE `Events` (
  `Id` int(10) NOT NULL,
  `Type` int(1) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Host_Username` varchar(20) NOT NULL,
  `Created_Date` date NOT NULL,
  `Event_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Events`
--

INSERT INTO `Events` (`Id`, `Type`, `Name`, `Host_Username`, `Created_Date`, `Event_Date`) VALUES
(8, 1, 'Catch Up ', 'test_coach', '2018-04-12', '2018-04-13');

-- --------------------------------------------------------

--
-- Table structure for table `Event_Attendees`
--

CREATE TABLE `Event_Attendees` (
  `Id` int(10) NOT NULL,
  `User_ID` varchar(20) NOT NULL,
  `Accepted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Event_Attendees`
--

INSERT INTO `Event_Attendees` (`Id`, `User_ID`, `Accepted`) VALUES
(8, 'DanielTilley', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Event_Type`
--

CREATE TABLE `Event_Type` (
  `Id` int(1) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Event_Type`
--

INSERT INTO `Event_Type` (`Id`, `Name`) VALUES
(1, 'One-To-One'),
(2, 'Video Conference');

-- --------------------------------------------------------

--
-- Table structure for table `Invites`
--

CREATE TABLE `Invites` (
  `Id` int(10) NOT NULL,
  `Sent_By` varchar(20) NOT NULL,
  `Sent_To` varchar(20) NOT NULL,
  `Status` int(1) NOT NULL,
  `Invite_Type` int(1) NOT NULL,
  `Send_Date` date NOT NULL,
  `Event_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Invites`
--

INSERT INTO `Invites` (`Id`, `Sent_By`, `Sent_To`, `Status`, `Invite_Type`, `Send_Date`, `Event_Id`) VALUES
(1, 'test_coach', 'DanielTilley', 4, 3, '2018-04-12', NULL),
(7, 'test_coach', 'DanielTilley', 4, 1, '2018-04-12', 8),
(9, 'test_coach', 'DanielTilley', 2, 3, '2018-04-12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Invite_Status`
--

CREATE TABLE `Invite_Status` (
  `Id` int(1) NOT NULL,
  `Value` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Invite_Status`
--

INSERT INTO `Invite_Status` (`Id`, `Value`) VALUES
(1, 'Sent'),
(2, 'Opened'),
(3, 'Declined'),
(4, 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `Invite_Type`
--

CREATE TABLE `Invite_Type` (
  `Id` int(1) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Invite_Type`
--

INSERT INTO `Invite_Type` (`Id`, `Name`) VALUES
(1, 'One-To-One'),
(2, 'Video Conference'),
(3, 'Coach Data Access'),
(4, 'Athlete Data Access');

-- --------------------------------------------------------

--
-- Table structure for table `Targets`
--

CREATE TABLE `Targets` (
  `Id` int(10) NOT NULL,
  `Athlete_Id` varchar(20) NOT NULL,
  `Content` varchar(250) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Week` varchar(2) NOT NULL,
  `Year` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Targets`
--

INSERT INTO `Targets` (`Id`, `Athlete_Id`, `Content`, `Status`, `Week`, `Year`) VALUES
(1, 'DanielTilley', 'Get 8 hours of sleep every night this week', 0, '15', '2018');

--
-- Triggers `Targets`
--
DELIMITER $$
CREATE TRIGGER `Auto_Increment_Id_Targets` BEFORE INSERT ON `Targets` FOR EACH ROW BEGIN
    SET NEW.Id = (
       SELECT IFNULL(MAX(Id), 0) + 1
       FROM Targets
       WHERE Athlete_Id  = Athlete_Id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `TrainingLog`
--

CREATE TABLE `TrainingLog` (
  `Id` int(10) NOT NULL,
  `Athlete_Id` varchar(20) NOT NULL,
  `Type_ID` int(2) NOT NULL,
  `Log_Date` date NOT NULL,
  `Log_Time` time DEFAULT NULL,
  `Log_Name` varchar(30) DEFAULT NULL,
  `Log_Description` varchar(500) DEFAULT NULL,
  `Athletes_Comments` varchar(250) DEFAULT NULL,
  `Coaches_Comments` varchar(250) DEFAULT NULL,
  `Workout_Comments` varchar(500) DEFAULT NULL,
  `Duration_Planned` time DEFAULT NULL,
  `Duration_Actual` time DEFAULT NULL,
  `Distance_Planned` float(4,2) DEFAULT NULL,
  `Distance_Actual` float(4,2) DEFAULT NULL,
  `Distance_Unit` varchar(2) DEFAULT NULL,
  `HR_Resting_Planned` int(3) DEFAULT NULL,
  `HR_Avg_Planned` int(3) DEFAULT NULL,
  `HR_Max_Planned` int(3) DEFAULT NULL,
  `HR_Resting_Actual` int(3) DEFAULT NULL,
  `HR_Avg_Actual` int(3) DEFAULT NULL,
  `HR_Max_Actual` int(3) DEFAULT NULL,
  `Watts_Avg_Planned` int(4) DEFAULT NULL,
  `Watts_Max_Planned` int(4) DEFAULT NULL,
  `Watts_Avg_Actual` int(4) DEFAULT NULL,
  `Watts_Max_Actual` int(4) DEFAULT NULL,
  `RPE_Planned` int(2) DEFAULT NULL,
  `RPE_Actual` int(2) DEFAULT NULL,
  `HR_Zone1_Time` time DEFAULT NULL,
  `HR_Zone2_Time` time DEFAULT NULL,
  `HR_Zone3_Time` time DEFAULT NULL,
  `HR_Zone4_Time` time DEFAULT NULL,
  `HR_Zone5_Time` time DEFAULT NULL,
  `HR_Zone6_Time` time DEFAULT NULL,
  `Calories_Burned` int(4) DEFAULT NULL,
  `Sleep_Quality` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainingLog`
--

INSERT INTO `TrainingLog` (`Id`, `Athlete_Id`, `Type_ID`, `Log_Date`, `Log_Time`, `Log_Name`, `Log_Description`, `Athletes_Comments`, `Coaches_Comments`, `Workout_Comments`, `Duration_Planned`, `Duration_Actual`, `Distance_Planned`, `Distance_Actual`, `Distance_Unit`, `HR_Resting_Planned`, `HR_Avg_Planned`, `HR_Max_Planned`, `HR_Resting_Actual`, `HR_Avg_Actual`, `HR_Max_Actual`, `Watts_Avg_Planned`, `Watts_Max_Planned`, `Watts_Avg_Actual`, `Watts_Max_Actual`, `RPE_Planned`, `RPE_Actual`, `HR_Zone1_Time`, `HR_Zone2_Time`, `HR_Zone3_Time`, `HR_Zone4_Time`, `HR_Zone5_Time`, `HR_Zone6_Time`, `Calories_Burned`, `Sleep_Quality`) VALUES
(1, 'DanielTilley', 1, '2018-03-17', '12:30:00', NULL, NULL, 'This is a test comment', NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'DanielTilley', 2, '2018-03-15', '14:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, 150, 500, 150, 500, NULL, NULL, '00:15:00', '00:10:00', '00:07:30', '00:05:00', '00:02:30', '00:00:45', NULL, NULL),
(3, 'DanielTilley', 4, '2018-03-13', '13:15:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'DanielTilley', 3, '2018-03-10', '10:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '00:45:00', NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'DanielTilley', 2, '2018-03-08', '17:45:00', NULL, NULL, NULL, NULL, NULL, '01:15:00', '01:15:00', NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'DanielTilley', 4, '2018-03-06', '15:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'DanielTilley', 2, '2018-02-15', '14:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'DanielTilley', 4, '2018-02-13', '13:15:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'DanielTilley', 3, '2018-02-10', '10:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'DanielTilley', 2, '2018-02-08', '17:45:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'DanielTilley', 4, '2018-02-06', '15:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'DanielTilley', 3, '2018-02-04', '11:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'DanielTilley', 3, '2018-03-17', '19:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'DanielTilley', 4, '2018-03-31', '12:30:00', 'Easy Run', 'This is a description for my easy run!', 'Feeling a bit sluggish, might not be able to push myself.', 'See how you feel and take it as needed.', '- Pickups every 10 seconds. 30 sec intervals\n- 10 min warmup\n- 5 min recovery', '00:30:00', '00:30:00', 5.00, 4.50, 'KM', 90, 120, 150, 87, 123, 151, NULL, NULL, NULL, NULL, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(16, 'DanielTilley', 4, '2018-03-20', NULL, 'Test', NULL, NULL, NULL, NULL, NULL, NULL, 5.00, 5.00, 'MI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'DanielTilley', 1, '2018-03-21', NULL, 'Rest Day', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'DanielTilley', 1, '2018-03-25', '11:11:00', 'Test Create', NULL, NULL, NULL, NULL, NULL, NULL, 5.00, 5.00, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(19, 'DanielTilley', 4, '2018-03-27', '12:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'DanielTilley', 1, '2018-03-29', '11:11:00', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'DanielTilley', 2, '2018-03-30', '11:21:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'DanielTilley', 2, '2018-04-04', '00:11:00', 'test', 'test', 'test', 'test', NULL, '00:30:00', '00:30:00', 12.00, 12.00, 'KM', 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 5, 5, '00:10:00', '00:15:00', '00:07:30', '00:05:00', '00:02:00', '00:00:00', NULL, NULL),
(23, 'DanielTilley', 2, '2018-04-07', '11:11:00', NULL, 'test create from test_coach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);

--
-- Triggers `TrainingLog`
--
DELIMITER $$
CREATE TRIGGER `Auto_Increment_Id_Training_Log` BEFORE INSERT ON `TrainingLog` FOR EACH ROW BEGIN
    SET NEW.Id = (
       SELECT IFNULL(MAX(Id), 0) + 1
       FROM TrainingLog
       WHERE Athlete_Id  = Athlete_Id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `TrainingLogTemplates`
--

CREATE TABLE `TrainingLogTemplates` (
  `Id` int(10) NOT NULL,
  `Coach_Id` varchar(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Duration_Planned` time DEFAULT NULL,
  `Duration_Actual` time DEFAULT NULL,
  `Distance_Planned` float(4,2) DEFAULT NULL,
  `Distance_Actual` float(4,2) DEFAULT NULL,
  `Distance_Unit` varchar(2) DEFAULT NULL,
  `HR_Resting_Planned` int(3) DEFAULT NULL,
  `HR_Avg_Planned` int(3) DEFAULT NULL,
  `HR_Max_Planned` int(3) DEFAULT NULL,
  `HR_Resting_Actual` int(3) DEFAULT NULL,
  `HR_Avg_Actual` int(3) DEFAULT NULL,
  `HR_Max_Actual` int(3) DEFAULT NULL,
  `Watts_Avg_Planned` int(4) DEFAULT NULL,
  `Watts_Max_Planned` int(4) DEFAULT NULL,
  `Watts_Avg_Actual` int(4) DEFAULT NULL,
  `Watts_Max_Actual` int(4) DEFAULT NULL,
  `RPE_Planned` int(2) DEFAULT NULL,
  `RPE_Actual` int(2) DEFAULT NULL,
  `HR_Zone1_Time` time DEFAULT NULL,
  `HR_Zone2_Time` time DEFAULT NULL,
  `HR_Zone3_Time` time DEFAULT NULL,
  `HR_Zone4_Time` time DEFAULT NULL,
  `HR_Zone5_Time` time DEFAULT NULL,
  `HR_Zone6_Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainingLogTemplates`
--

INSERT INTO `TrainingLogTemplates` (`Id`, `Coach_Id`, `Name`, `Duration_Planned`, `Duration_Actual`, `Distance_Planned`, `Distance_Actual`, `Distance_Unit`, `HR_Resting_Planned`, `HR_Avg_Planned`, `HR_Max_Planned`, `HR_Resting_Actual`, `HR_Avg_Actual`, `HR_Max_Actual`, `Watts_Avg_Planned`, `Watts_Max_Planned`, `Watts_Avg_Actual`, `Watts_Max_Actual`, `RPE_Planned`, `RPE_Actual`, `HR_Zone1_Time`, `HR_Zone2_Time`, `HR_Zone3_Time`, `HR_Zone4_Time`, `HR_Zone5_Time`, `HR_Zone6_Time`) VALUES
(2, 'test_coach', 'Test Template 1', NULL, NULL, NULL, NULL, 'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'test_coach', 'My Template', '00:30:00', '00:30:00', 12.00, 12.00, 'KM', 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 5, 5, '00:10:00', '00:15:00', '00:07:30', '00:05:00', '00:02:00', '00:00:00');

--
-- Triggers `TrainingLogTemplates`
--
DELIMITER $$
CREATE TRIGGER `Auto_Increment_Id_Training_Log_Templates` BEFORE INSERT ON `TrainingLogTemplates` FOR EACH ROW BEGIN
    SET NEW.Id = (
       SELECT IFNULL(MAX(Id), 0) + 1
       FROM TrainingLogTemplates
       WHERE Coach_Id  = Coach_Id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `TrainingType`
--

CREATE TABLE `TrainingType` (
  `Id` int(2) NOT NULL,
  `Name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainingType`
--

INSERT INTO `TrainingType` (`Id`, `Name`) VALUES
(1, 'Rest Day'),
(2, 'Swimming'),
(3, 'Cycling'),
(4, 'Running');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `Id` varchar(20) NOT NULL,
  `Password` varchar(87) NOT NULL,
  `F_Name` varchar(30) NOT NULL,
  `L_Name` varchar(30) NOT NULL,
  `E_Mail` varchar(40) NOT NULL,
  `DOB` date NOT NULL,
  `Type` varchar(3) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Bio` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`Id`, `Password`, `F_Name`, `L_Name`, `E_Mail`, `DOB`, `Type`, `Location`, `Bio`) VALUES
('DanielTilley', 'wvOatS3Eo84F+mieSZdq14eCQdm3+vYRmVd/F4h96gQ$RE93C5Yk0cLjpLXZcpjWwQhz3wpug0aPnxI1QueaSpE', 'Daniel', 'Tilley', 'test@Gmail.com', '1996-07-11', 'ATH', 'Ireland', 'Hi, My name is Daniel and I am the creator of Training Pal! I hope you enjoy using the app :)\r\n\r\nThanks!'),
('EamonnTilley', 'ICxoSE94wAIIFg1LIjyUtemPNiVQU1WnLGS+vTvjIQ0$4GXOeQUCKrX3rqcdz6DwvjfnvyNu+cTgF8GmzVOEpWY', 'Eamonn', 'Tilley', 'test1@Gmail.com', '1967-06-12', 'COA', 'Ireland', NULL),
('test_athlete', '5o8zxctmL6/2fq+xJ4cIJvvF5256eqJ/f9f3E2sAaRk$zjx69204jmFv3OsCBwGddN4eLkTcJZ6oF7hnlkh7goQ', 'Firstname', 'Lastname', 'athlete_test@test.com', '1998-01-07', 'ATH', 'Ireland', 'I am a test athlete account!'),
('test_coach', 'wI09CXr6K/TpF+E9hyAbI2/cVfGxfhx0zypghpZdwHQ$Nq/OF0yQKvUI8ln1xPpHt3p7qUHHe5F7HlcX2y8J5c8', 'Firstname', 'Lastname', 'coach_test@test.com', '1998-01-01', 'COA', 'Ireland', 'Im a test coach account! \"\"'),
('username', 'pLu1AwBGn10/BhrNDkGuoY5U0yqh3qJFuh2DNUrU2yM$TcJC9/FohRK1+kF0LNYMrHkSnLXR/OWhLmmLQfJrWAs', 'daniel', 'test', 'test@test.com', '2017-11-11', 'ATH', 'Ireland', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Coach_Athlete`
--
ALTER TABLE `Coach_Athlete`
  ADD PRIMARY KEY (`Athlete_Id`,`Coach_Id`),
  ADD KEY `Coach_Id` (`Coach_Id`),
  ADD KEY `Invite_Id` (`Invite_Id`);

--
-- Indexes for table `Events`
--
ALTER TABLE `Events`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Host_Username` (`Host_Username`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `Event_Attendees`
--
ALTER TABLE `Event_Attendees`
  ADD PRIMARY KEY (`Id`,`User_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Event_Type`
--
ALTER TABLE `Event_Type`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Invites`
--
ALTER TABLE `Invites`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Sent_By` (`Sent_By`),
  ADD KEY `Sent_To` (`Sent_To`),
  ADD KEY `Status` (`Status`),
  ADD KEY `Invite_Type` (`Invite_Type`),
  ADD KEY `Event_Id` (`Event_Id`);

--
-- Indexes for table `Invite_Status`
--
ALTER TABLE `Invite_Status`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Invite_Type`
--
ALTER TABLE `Invite_Type`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Targets`
--
ALTER TABLE `Targets`
  ADD PRIMARY KEY (`Id`,`Athlete_Id`),
  ADD KEY `Athlete_Id` (`Athlete_Id`);

--
-- Indexes for table `TrainingLog`
--
ALTER TABLE `TrainingLog`
  ADD PRIMARY KEY (`Id`,`Athlete_Id`),
  ADD KEY `AthleteId` (`Athlete_Id`),
  ADD KEY `Type_ID` (`Type_ID`);

--
-- Indexes for table `TrainingLogTemplates`
--
ALTER TABLE `TrainingLogTemplates`
  ADD PRIMARY KEY (`Id`,`Coach_Id`),
  ADD KEY `Coach_Id` (`Coach_Id`);

--
-- Indexes for table `TrainingType`
--
ALTER TABLE `TrainingType`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Events`
--
ALTER TABLE `Events`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Invites`
--
ALTER TABLE `Invites`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `TrainingType`
--
ALTER TABLE `TrainingType`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Coach_Athlete`
--
ALTER TABLE `Coach_Athlete`
  ADD CONSTRAINT `coach_athlete_ibfk_1` FOREIGN KEY (`Coach_Id`) REFERENCES `Users` (`Id`),
  ADD CONSTRAINT `coach_athlete_ibfk_2` FOREIGN KEY (`Athlete_Id`) REFERENCES `Users` (`Id`),
  ADD CONSTRAINT `coach_athlete_ibfk_3` FOREIGN KEY (`Invite_Id`) REFERENCES `Invites` (`Id`);

--
-- Constraints for table `Events`
--
ALTER TABLE `Events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`Host_Username`) REFERENCES `Users` (`Id`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`Type`) REFERENCES `Event_Type` (`Id`);

--
-- Constraints for table `Event_Attendees`
--
ALTER TABLE `Event_Attendees`
  ADD CONSTRAINT `event_attendees_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `Events` (`Id`),
  ADD CONSTRAINT `event_attendees_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`Id`);

--
-- Constraints for table `Invites`
--
ALTER TABLE `Invites`
  ADD CONSTRAINT `invites_ibfk_1` FOREIGN KEY (`Sent_By`) REFERENCES `Users` (`Id`),
  ADD CONSTRAINT `invites_ibfk_2` FOREIGN KEY (`Sent_To`) REFERENCES `Users` (`Id`),
  ADD CONSTRAINT `invites_ibfk_3` FOREIGN KEY (`Status`) REFERENCES `Invite_Status` (`Id`),
  ADD CONSTRAINT `invites_ibfk_4` FOREIGN KEY (`Invite_Type`) REFERENCES `Invite_Type` (`Id`),
  ADD CONSTRAINT `invites_ibfk_5` FOREIGN KEY (`Event_Id`) REFERENCES `Events` (`Id`);

--
-- Constraints for table `Targets`
--
ALTER TABLE `Targets`
  ADD CONSTRAINT `targets_ibfk_1` FOREIGN KEY (`Athlete_Id`) REFERENCES `Users` (`Id`);

--
-- Constraints for table `TrainingLog`
--
ALTER TABLE `TrainingLog`
  ADD CONSTRAINT `traininglog_ibfk_1` FOREIGN KEY (`Athlete_Id`) REFERENCES `Users` (`Id`),
  ADD CONSTRAINT `traininglog_ibfk_2` FOREIGN KEY (`Type_ID`) REFERENCES `TrainingType` (`Id`);

--
-- Constraints for table `TrainingLogTemplates`
--
ALTER TABLE `TrainingLogTemplates`
  ADD CONSTRAINT `traininglogtemplates_ibfk_1` FOREIGN KEY (`Coach_Id`) REFERENCES `Users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
