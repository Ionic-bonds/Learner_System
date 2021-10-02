SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `LearnerSystem`
--
CREATE DATABASE IF NOT EXISTS `LearnerSystem` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `LearnerSystem`;



-- --------------------------------------------------------

--
-- Table structure for table `CourseRecord`
--

CREATE TABLE `CourseRecord` (
  `CourseRecordID` int(11) NOT NULL AUTO_INCREMENT,
  `LearnerID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `TrainerID` int(11) NOT NULL,
  `trainerName` varchar(30) DEFAULT NULL,
  `courseName` varchar(100) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `quizGrade` varchar(100) DEFAULT NULL,
  `courseProgression` FLOAT(24, 2) DEFAULT NULL,

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Trainer`
--

CREATE TABLE `Trainer` (
  `TrainerID` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `Learner`
--

CREATE TABLE `Learner` (
  `LearnerID` int(11) NOT NULL,
  `EnrolledCourses` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE `Person` (
  `personID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `NRIC` varchar(15) DEFAULT NULL,
  `ContactNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `CourseContent`
--

CREATE TABLE `CourseContent` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(30) DEFAULT NULL,
  `LearnerID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `TrainerID` int(11) NOT NULL,
  `trainerName` varchar(30) DEFAULT NULL,
  `courseName` varchar(100) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `quizGrade` varchar(100) DEFAULT NULL,
  `courseProgression` FLOAT(24, 2) DEFAULT NULL,

) ENGINE=InnoDB DEFAULT CHARSET=utf8;