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

insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(1, 'Software Engineering', 'This is a course', TRUE);
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(2, 'Software Practices', 'This is a software practices course', TRUE);


-- Table structure for table Person
--

CREATE TABLE IF NOT EXISTS Person (
  personID integer AUTO_INCREMENT NOT NULL,
  name varchar(100) DEFAULT NULL,
  NRIC varchar(15) DEFAULT NULL,
  ContactNo int(11) DEFAULT NULL,
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
insert into Person(personID, name, nric, ContactNo)
values(1, 'Jacky', 'S9624229H', 82011734);

insert into Person(personID, name, nric, ContactNo)
values(2, 'Leeky', 'S91234567A', 97011734);

insert into Trainer(TrainerID, personid) values(1,1);

insert into Learner(LearnerID, personid) values(1,2);

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
insert into TrainerSchedule(TrainerScheduleID, TrainerID, CourseID) values(1,1,1);

CREATE TABLE IF NOT EXISTS ClassDescription (
  ClassID integer,
  CourseID integer,
  ClassSize integer,
  StartTime timestamp,
  Duration integer,
  StartDate timestamp,
  EndDate timestamp,
  constraint ClassDescription_pk primary key(ClassID, CourseID),
  constraint ClassDescription_fk foreign key(CourseID) references CourseOverview(CourseID)
  

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, Duration, StartDate, EndDate) values(1,1,50,'12:30pm',90, '21 September 2021', '2:00pm');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, Duration, StartDate, EndDate) values(2,2,40,'13:30pm',120, '23 September 2021', '4:00pm');

-- Table structure for table CourseRecord
--

CREATE TABLE IF NOT EXISTS CourseRecord (
  CourseID integer AUTO_INCREMENT NOT NULL,
  TrainerScheduleID integer NOT NULL,
  LearnerID integer NOT NULL,
  ClassID integer NOT NULL,
  constraint CourseRecord_pk primary key (CourseID, TrainerScheduleID, LearnerID, ClassID),
  constraint CourseRecord_fk1 foreign key (CourseID) references CourseOverview(CourseID),
  constraint CourseRecord_fk2 foreign key (LearnerID) references Learner(LearnerID),
  constraint CourseRecord_fk3 foreign key (ClassID) references ClassDescription(ClassID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,1,1);

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

insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,1,'Software Engineering', 1, 'Pass', TRUE, 20.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,2,'Software Practices', 2, 'Pass', TRUE, 17.5);

-- --------------------------------------------------------

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


insert into SectionOverview(SectionID, CourseID, SectionDescription, SectionProgress)
values(1, 1, 'This is a good section', 20);

-- --------------------------------------------------------
-- Table structure for table SectionMaterials
--

CREATE TABLE IF NOT EXISTS SectionMaterials (
  SectionMaterialsID integer AUTO_INCREMENT NOT NULL,
  CourseID integer,
  SectionMaterials varchar(100),
  constraint SectionMaterials_pk primary key(SectionMaterialsID, CourseID),
  constraint SectionMaterials_fk1 foreign key(CourseID) references CourseOverview(CourseID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into SectionMaterials(SectionMaterialsID, CourseID, SectionMaterials)
values(1, 1, 'This is a good section');
-- --------------------------------------------------------
-- Table structure for table SectionMaterials
--
