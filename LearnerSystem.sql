SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: LearnerSystem
--
DROP DATABASE IF EXISTS LearnerSystem;
CREATE DATABASE LearnerSystem;
USE LearnerSystem;



--
-- Table structure for table CourseOverview
--

CREATE TABLE IF NOT EXISTS CourseOverview (
  CourseID integer NOT NULL AUTO_INCREMENT,
  CourseName varchar(100),
  CourseDescription varchar(100),
  CourseStatus boolean,
  constraint CourseOverview_pk primary key(CourseID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table Person
--

CREATE TABLE IF NOT EXISTS Person (
  personID integer AUTO_INCREMENT NOT NULL,
  name varchar(100) DEFAULT NULL,
  NRIC varchar(15) DEFAULT NULL,
  ContactNo int(11) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  constraint Person_pk primary key (personID)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- --------------------------------------------------------
--
-- Table structure for table Trainer
--

CREATE TABLE IF NOT EXISTS Trainer (
  TrainerID integer AUTO_INCREMENT NOT NULL,
  personid integer NOT NULL,
  constraint Trainer_pk primary key (TrainerID),
  constraint Trainer_fk foreign key (personid) references Person(personID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- -------
--
-- Table structure for table Learner
--

CREATE TABLE IF NOT EXISTS Learner (
  LearnerID integer AUTO_INCREMENT NOT NULL,
  personid integer,
  constraint Learner_pk primary key (LearnerID),
  constraint Learner_fk foreign key (personid) references Person(personID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table Trainer Schedule
--

CREATE TABLE IF NOT EXISTS TrainerSchedule (
  TrainerScheduleID integer AUTO_INCREMENT NOT NULL,
  TrainerID integer NOT NULL,
  CourseID integer NOT NULL,
  constraint TrainerSchedule_pk primary key (TrainerScheduleID),
  constraint TrainerSchedule_fk1 foreign key (TrainerID) references Trainer(TrainerID),
  constraint TrainerSchedule_fk2 foreign key (CourseID) references CourseOverview(CourseID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table ClassDescription
--


CREATE TABLE IF NOT EXISTS ClassDescription (
  ClassID integer,
  CourseID integer,
  ClassSize integer,
  StartTime timestamp,
  StartDate timestamp,
  EndTime timestamp,
  EndDate timestamp,
  constraint ClassDescription_pk primary key(ClassID, CourseID),
  constraint ClassDescription_fk foreign key(CourseID) references CourseOverview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table CourseRecord
--

CREATE TABLE IF NOT EXISTS CourseRecord (
  CourseRecordID integer AUTO_INCREMENT NOT NULL
  CourseID integer,
  TrainerScheduleID integer NOT NULL,
  LearnerID integer NOT NULL,
  ClassID integer NOT NULL,
  constraint CourseRecord_pk primary key (CourseRecordID, CourseID, TrainerScheduleID, LearnerID, ClassID),
  constraint CourseRecord_fk1 foreign key (CourseID) references CourseOverview(CourseID),
  constraint CourseRecord_fk2 foreign key (LearnerID) references Learner(LearnerID),
  constraint CourseRecord_fk3 foreign key (ClassID) references ClassDescription(ClassID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------

-- --------------------------------------------------------
-- Table structure for table LearnerRecord
--
CREATE TABLE IF NOT EXISTS LearnerRecord (
  LearnerID integer,
  LearnerRecordID integer,
  EnrolledCourses varchar(100) NOT NULL,
  EnrolledClass varchar(100),
  FinalQuizResult varchar(10),
  CourseStatus boolean NOT NULL,
  SectionProgress Float(24,2),
-- Here to change for section progress to decimal
    constraint LearnerRecord_pk primary key(LearnerID,LearnerRecordID),
    constraint LearnerRecord_fk foreign key(LearnerID) references Learner(LearnerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

-- --------------------------------------------------------
-- Table structure for table SectionOverview
--

CREATE TABLE IF NOT EXISTS SectionOverview (
  SectionID integer,
  CourseID integer,
  SectionDescription varchar(100),
  SectionProgress float(24,2),
  constraint SectionOverview_pk primary key(CourseID, SectionID),
  constraint SectionOverview_fk foreign key(CourseID) references CourseOverview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- --------------------------------------------------------
-- Table structure for table SectionMaterials
--

CREATE TABLE IF NOT EXISTS SectionMaterials (
  SectionMaterialsID integer,
  CourseID integer,
  SectionID integer,
  SectionMaterials varchar(1000),
  constraint SectionMaterials_pk primary key(SectionMaterialsID, CourseID, SectionID),
  constraint SectionMaterials_fk2 foreign key(CourseID,SectionID) references sectionoverview(CourseID,SectionID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
-- Table structure for table SectionMaterials
--

-- Table structure for table SectionQuiz
--
CREATE TABLE IF NOT EXISTS SectionQuiz (
  SectionQuizID integer,
  SectionID integer,
  SectionMaterialsID integer,
  quizType varchar(10),
  quizResult varchar(1),
  duration integer,
  quizStartTime timestamp,
  CourseID integer,
  constraint SectionQuiz_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID),
  constraint SectionMaterials_f12 foreign key(SectionMaterialsID, CourseID, SectionID) references SectionMaterials(SectionMaterialsID, CourseID, SectionID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- --------------------------------------------------------
-- Table structure for table QuizQn
--

CREATE TABLE IF NOT EXISTS QuizQn(
    QuizQnID integer,
    CourseID integer,
    SectionMaterialsID integer,
    SectionQuizID integer,
    SectionID integer,
    QuizQuestion varchar(1000),
    QuizOptionNo integer,
    QuizOption varchar(100),
    constraint QuizQn_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID, QuizOptionNo),
    constraint QuizQn_fk foreign key(SectionID, SectionMaterialsID, SectionQuizID, CourseID) references SectionQuiz(SectionID,SectionMaterialsID, SectionQuizID, CourseID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table LearnerQuizAnswer
--

CREATE TABLE IF NOT EXISTS LearnerQuizAnswer (
  QuizQnID integer,
  SectionQuizID integer,
  SectionMaterialsID integer,
  CourseID integer,
  SectionID integer,
  LearnerID integer,
  quizAnswer varchar(100),
  constraint LearnerQuizAnswer_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID, LearnerID),
  constraint LearnerQuizAnswer_fk foreign key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID) references QuizQn(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID),
  constraint LearnerQuizAnswer_fk1 foreign key(LearnerID) references Learner(LearnerID)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table SolutionTable
--

CREATE TABLE IF NOT EXISTS SolutionTable (
  QuizQnID integer,
  SectionQuizID integer,
  SectionMaterialsID integer,
  CourseID integer,
  SectionID integer,
  quizSolution varchar(100),
  constraint SolutionTable_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID),
  constraint SolutionTable_fk foreign key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID) references QuizQn(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
