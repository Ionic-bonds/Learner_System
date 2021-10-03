SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `LearnerSystem`
--
DROP DATABASE IF EXISTS `LearnerSystem` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `LearnerSystem`;
USE `LearnerSystem`;


-- Table structure for table `Person`
--

CREATE TABLE IF NOT EXISTS `Person` (
  `personID` integer AUTO_INCREMENT NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `NRIC` varchar(15) DEFAULT NULL,
  `ContactNo` int(11) DEFAULT NULL,
  constraint Person_pk primary key (personID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
--
-- Table structure for table `Trainer`
--

CREATE TABLE IF NOT EXISTS `Trainer` (
  `TrainerID` integer AUTO_INCREMENT NOT NULL,
  `personid` integer NOT NULL,
  constraint Trainer_pk primary key (TrainerID),
  constraint Trainer_fk foreign key (personid) references Person(personID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table `Trainer Schedule`
--

CREATE TABLE IF NOT EXISTS `TrainerSchedule` (
  `TrainerScheduleID` integer AUTO_INCREMENT NOT NULL,
  `TrainerID` integer NOT NULL,
  `CourseID` integer NOT NULL,
  constraint TrainerSchedule_pk primary key (TrainerScheduleID),
  constraint TrainerSchedule_fk foreign key (TrainerID) references Trainer(TrainerID),
  constraint TrainerSchedule_fk foreign key (CourseID) references CourseOverview(CourseID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `CourseRecord`
--

CREATE TABLE IF NOT EXISTS `CourseRecord` (
  `CourseID` integer AUTO_INCREMENT NOT NULL,
  `TrainerScheduleID` integer NOT NULL,
  `LearnerID` integer NOT NULL,
  `ClassID` integer NOT NULL,
  constraint CourseRecord_pk primary key (CourseID, TrainerScheduleID, LearnerID, ClassID),
  constraint CourseRecord_fk foreign key (CourseID) references CourseOverview(CourseID),
  constraint CourseRecord_fk foreign key (LearnerID) references Learner(LearnerID),
  constraint CourseRecord_fk foreign key (ClassID) references ClassDescription(ClassID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------
--
-- -------
--
-- Table structure for table `Learner`
--

CREATE TABLE IF NOT EXISTS `Learner` (
  `LearnerID` integer AUTO_INCREMENT NOT NULL,
  `personid` integer,
  constraint Learner_pk primary key (LearnerID),
  constraint Learner_fk foreign key (personid) references Person(personID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table `LearnerRecord`
--

CREATE TABLE IF NOT EXISTS `LearnerRecord` (
  `LearnerID` integer,
  `LearnerRecordID` integer,
  `EnrolledCourses` varchar(100) NOT NULL,
  `EnrolledClass` varchar(100),
  `FinalQuizResult` varchar(10),
  `CourseStatus` boolean NOT NULL,
  `SectionProgress` Float(24,2),
-- Here to change for section progress to decimal
    constraint LearnerRecord_pk primary key(LearnerID,LearnerRecordID),
    constraint LearnerRecord_fk foreign key(LearnerID) references Learner(LearnerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


--
-- Table structure for table `CourseOverview`
--

CREATE TABLE IF NOT EXISTS `CourseOverview` (
  `CourseID` integer NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(100),
  `CourseDescription` varchar(100),
  `CourseStatus` boolean,
  constraint CourseOverview_pk primary key(CourseID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
--
-- Table structure for table `ClassDescription`
--

CREATE TABLE IF NOT EXISTS `ClassDescription` (
  `ClassID` integer,
  `CourseID` integer,
  `ClassSize` integer,
  `StartTime` timestamp,
  `Duration` integer,
  `StartDate` timestamp,
  `EndDate` timestamp,
  constraint ClassDescription_pk primary key(ClassID, CourseID),
  constraint ClassDescription_fk foreign key(CourseID) references CourseOverview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
-- Table structure for table `SectionOverview`
--

CREATE TABLE IF NOT EXISTS `SectionOverview` (
  `SectionID` integer,
  `CourseID` integer,
  `SectionDescription` varchar(100),
  `SectionProgress` float(24,2),
  constraint SectionOverview_pk primary key(CourseID, SectionID),
  constraint SectionOverview_fk foreign key(CourseID) references CourseOverview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table `SectionMaterials`
--

CREATE TABLE IF NOT EXISTS`SectionMaterials` (
  `SectionMaterialsID` integer AUTO_INCREMENT NOT NULL,
  `SectionID` integer,
  `SectionMaterials` varchar(100),
  `CourseID` integer,
  constraint SectionMaterials_pk primary key(SectionMaterialsID, SectionID),
  constraint SectionMaterials_fk foreign key(SectionID) references SessionOverview(SessionID),
  constraint SectionMaterials_fk foreign key(CourseID) references CourseOverview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
-- Table structure for table `SectionMaterials`
--

CREATE TABLE `SectionQuiz` (
  `SectionQuizID` integer NOT NULL AUTO_INCREMENT NOT NULL,
  `SectionID` integer NULL,
  `QuizType` varchar(100) NULL,
  `QuizResult` varchar(1) NULL,
  `Duration` integer NULL,
  `QuizStartTime` timestamp NULL,
  constraint SectionQuiz_pk primary key(SectionID, SectionQuizID),
  constraint SectionQuiz_fk foreign key(SectionID) references SectionMaterials(SectionID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table `LearnerQuizAnswer`
--

DROP TABLE IF EXISTS CREATE TABLE `LearnerQuizAnswer` (
  `SectionQuizID` integer NULL,
  `QuizQnID` integer NULL,
  `LearnerID` integer,
  `QuizAnswer` varchar(50),
  `SectionID` integer,
  `QuizType` varchar(100),
  `QuizResult` varchar(1),
  `Duration` integer,
  `QuizStartTime` timestamp,
  constraint LearnerQuizAnswer_pk primary key(QuizQnID, SectionQuizID, LearnerID),
  constraint LearnerQuizAnswer_fk foreign key(SectionID) references SectionQuiz(SectionID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
-- Table structure for table `QuizQn`
--

CREATE TABLE IF NOT EXISTS `QuizQn` (
  `QuizQnID` integer NOT NULL AUTO_INCREMENT,
  `SectionQuizID` integer,
  `QuizQuestion` varchar(1000),
  `QuizSolution` varchar(1000),
  `QuizID` integer,
  constraint QuizQn_pk primary key(QuizQnID, SectionQuizID),
  constraint QuizQn_fk foreign key(SectionQuizID) references SectionQuiz(SectionQuizID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
-- Table structure for table `Choice`
--

CREATE TABLE IF NOT EXISTS `Choice` (
  `ChoiceID` integer NOT NULL AUTO_INCREMENT,
  `QuizQnID` integer,
  `SectionQuizID` integer,
  `ChoiceDescription` varchar(1000),
  `QuizSolution` varchar(1000),
  constraint Choice_pk primary key(QuizQnID, SectionQuizID, ChoiceID),
  constraint Choice_fk foreign key(QuizQnID) references QuizQn(QuizQnID),
  constraint Choice_fk foreign key(SectionQuizID) references SectionQuiz(SectionQuizID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
