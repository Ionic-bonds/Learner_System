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

CREATE TABLE IF NOT EXISTS course_overview (
  CourseID integer NOT NULL AUTO_INCREMENT,
  CourseName varchar(100),
  CourseDescription varchar(10000),
  Prerequisite boolean,
  constraint CourseOverview_pk primary key(CourseID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table CoursePrerequisite
--

CREATE TABLE IF NOT EXISTS course_prerequisite (
  MainCourseID integer NOT NULL,
  PrerequisiteCourseID integer NOT NULL,
  constraint CourseOverview_pk primary key(MainCourseID, PrerequisiteCourseID),
  constraint CoursePrerequisite_fk foreign key (MainCourseID) references course_overview(CourseID),
  constraint CoursePrerequisite_fk2 foreign key (PrerequisiteCourseID) references course_overview(CourseID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table Person
--

CREATE TABLE IF NOT EXISTS person (
  personID integer AUTO_INCREMENT NOT NULL,
  name varchar(100) DEFAULT NULL,
  NRIC varchar(15) DEFAULT NULL,
  ContactNo int(11) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  constraint person_pk primary key (personID)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- --------------------------------------------------------
--
-- Table structure for table Trainer
--

CREATE TABLE IF NOT EXISTS trainer (
  TrainerID integer AUTO_INCREMENT NOT NULL,
  personid integer NOT NULL,
  
  constraint Trainer_pk primary key (TrainerID),
  constraint Trainer_fk foreign key (personid) references person(personID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- -------
--
-- Table structure for table Learner
--

CREATE TABLE IF NOT EXISTS learner (
  LearnerID integer AUTO_INCREMENT NOT NULL,
  personid integer,
  constraint Learner_pk primary key (LearnerID),
  constraint Learner_fk foreign key (personid) references person(personID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table Trainer Schedule
--

CREATE TABLE IF NOT EXISTS trainer_schedule (
  TrainerScheduleID integer AUTO_INCREMENT NOT NULL,
  TrainerID integer NOT NULL,
  CourseID integer NOT NULL,
  constraint TrainerSchedule_pk primary key (TrainerScheduleID),
  constraint TrainerSchedule_fk1 foreign key (TrainerID) references trainer(TrainerID),
  constraint TrainerSchedule_fk2 foreign key (CourseID) references course_overview(CourseID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table ClassDescription
--


CREATE TABLE IF NOT EXISTS class_description (
  ClassID integer,
  CourseID integer,
  ClassSize integer,
  StartTime varchar(100),
  StartDate varchar(100),
  EndTime varchar(100),
  EndDate varchar(100),
  constraint ClassDescription_pk primary key(ClassID, CourseID),
  constraint ClassDescription_fk foreign key(CourseID) references course_overview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table CourseRecord
--

CREATE TABLE IF NOT EXISTS course_record (
  CourseRecordID integer AUTO_INCREMENT NOT NULL,
  CourseID integer,
  TrainerScheduleID integer NOT NULL,
  LearnerID integer NOT NULL,
  ClassID integer NOT NULL,
  CourseProgress Float,
  FinalQuizResult varchar(100),

  constraint CourseRecord_pk primary key (CourseRecordID, CourseID, TrainerScheduleID, LearnerID, ClassID),
  constraint CourseRecord_fk1 foreign key (CourseID) references course_overview(CourseID),
  constraint CourseRecord_fk2 foreign key (LearnerID) references learner(LearnerID),
  constraint CourseRecord_fk3 foreign key (ClassID) references class_description(ClassID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------

-- --------------------------------------------------------
-- Table structure for table Enrollment
--
CREATE TABLE IF NOT EXISTS enrollment (
  LearnerID integer,
  EnrollmentID integer AUTO_INCREMENT NOT NULL,
  CourseID integer NOT NULL,
  ClassID integer NOT NULL,
  Approved boolean NOT NULL,
  passPrerequisite boolean NOT NULL,
-- Here to change for section progress to decimal
    constraint Enrollment_pk primary key(EnrollmentID),
    constraint Enrollment_fk1 foreign key(LearnerID) references learner(LearnerID),
    constraint Enrollment_fk2 foreign key(CourseID) references course_overview(CourseID),
    constraint Enrollment_fk3 foreign key(ClassID) references class_description(ClassID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

-- --------------------------------------------------------
-- Table structure for table SectionOverview
--

CREATE TABLE IF NOT EXISTS section_overview (
  SectionID integer,
  CourseID integer,
  SectionDescription varchar(10000),
  SectionProgress float(24,2),
  constraint SectionOverview_pk primary key(CourseID, SectionID),
  constraint SectionOverview_fk foreign key(CourseID) references course_overview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- --------------------------------------------------------
-- Table structure for table SectionMaterials
--

CREATE TABLE IF NOT EXISTS section_materials (
  SectionMaterialsID integer,
  CourseID integer,
  SectionID integer,
  SectionMaterials varchar(10000),
  constraint SectionMaterials_pk primary key(SectionMaterialsID, CourseID, SectionID),
  constraint SectionMaterials_fk2 foreign key(CourseID,SectionID) references section_overview(CourseID,SectionID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
-- Table structure for table SectionMaterials
--

-- Table structure for table SectionQuiz
--
CREATE TABLE IF NOT EXISTS section_quiz (
  SectionQuizID integer,
  SectionID integer,
  SectionMaterialsID integer,
  quizResult varchar(1),
  duration integer,
  quizStartTime varchar(100),
  CourseID integer,
  constraint SectionQuiz_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID),
  constraint SectionMaterials_f12 foreign key(SectionMaterialsID, CourseID, SectionID) references section_materials(SectionMaterialsID, CourseID, SectionID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- --------------------------------------------------------
-- Table structure for table QuizQn
--

-- CREATE TABLE IF NOT EXISTS Quiz_Qn(
--     QuizQnID integer,
--     CourseID integer,
--     SectionMaterialsID integer,
--     SectionQuizID integer,
--     SectionID integer,
--     QuizQuestion varchar(10000),
--     QuizOptionNo1 integer,
--     QuizOption1 varchar(10000),
--     QuizOptionNo2 integer,
--     QuizOption2 varchar(10000),    
--     QuizOptionNo3 integer,
--     QuizOption3 varchar(10000),    
--     QuizOptionNo4 integer,
--     QuizOption4 varchar(10000),
--     constraint QuizQn_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID, QuizOptionNo),
--     constraint QuizQn_fk foreign key(SectionID, SectionMaterialsID, SectionQuizID, CourseID) references Section_Quiz(SectionID,SectionMaterialsID, SectionQuizID, CourseID)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS quiz_qn(
    QuizQnID integer,
    CourseID integer,
    SectionMaterialsID integer,
    SectionQuizID integer,
    SectionID integer,
    QuizQuestion varchar(10000),
    QuizOptionNo integer,
    QuizOption varchar(10000),
    constraint QuizQn_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID, QuizOptionNo),
    constraint QuizQn_fk foreign key(SectionID, SectionMaterialsID, SectionQuizID, CourseID) references section_quiz(SectionID,SectionMaterialsID, SectionQuizID, CourseID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table LearnerQuizAnswer
--

CREATE TABLE IF NOT EXISTS learner_quiz_answer (
  QuizQnID integer,
  SectionQuizID integer,
  SectionMaterialsID integer,
  CourseID integer,
  SectionID integer,
  LearnerID integer,
  quizAnswer varchar(10000),
  constraint LearnerQuizAnswer_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID, LearnerID),
  constraint LearnerQuizAnswer_fk foreign key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID) references quiz_qn(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID),
  constraint LearnerQuizAnswer_fk1 foreign key(LearnerID) references learner(LearnerID)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table SolutionTable
--

CREATE TABLE IF NOT EXISTS solution_table (
  QuizQnID integer,
  SectionQuizID integer,
  SectionMaterialsID integer,
  CourseID integer,
  SectionID integer,
  quizSolution varchar(10000),
  constraint SolutionTable_pk primary key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID),
  constraint SolutionTable_fk foreign key(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID) references quiz_qn(SectionID, SectionMaterialsID, SectionQuizID, CourseID, QuizQnID)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

