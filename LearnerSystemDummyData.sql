-- --------------------------------------------------------
-- Dummy Data for table CourseOverview
--
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(1, 'Software Engineering', 'This is a course', TRUE);
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(2, 'Software Practices', 'This is a software practices course', TRUE);

-- --------------------------------------------------------
-- Dummy Data for table Person
--
insert into Person(personID, name, nric, ContactNo, email)
values(1, 'Jacky', 'S9624229H', 82011734, 'jacky@company.com');

insert into Person(personID, name, nric, ContactNo , email)
values(2, 'Leeky', 'S91234567A', 97011734, 'leeky@company.com');

-- --------------------------------------------------------
-- Dummy Data for table Trainer
--
insert into Trainer(TrainerID, personid) values(1,1);

-- --------------------------------------------------------
-- Dummy Data for table Learner
--
insert into Learner(LearnerID, personid) values(1,2);
-- --------------------------------------------------------
-- Dummy Data for table TrainerSchedule
--
insert into TrainerSchedule(TrainerScheduleID, TrainerID, CourseID) values(1,1,1);

-- --------------------------------------------------------
-- Dummy Data for table ClassDescription
--
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, Duration, StartDate, EndDate) values(1,1,50,'12:30pm',90, '21 September 2021', '2:00pm');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, Duration, StartDate, EndDate) values(2,2,40,'13:30pm',120, '23 September 2021', '4:00pm');

-- --------------------------------------------------------
-- Dummy Data for table CourseRecord
--
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,1,1);

-- --------------------------------------------------------
-- Dummy Data for table LearnerRecord
--
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,1,'Software Engineering', 1, 'Pass', TRUE, 20.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,2,'Software Practices', 2, 'Pass', TRUE, 17.5);

-- --------------------------------------------------------
-- Dummy Data for table SectionOverview
--
insert into SectionOverview(SectionID, CourseID, SectionDescription, SectionProgress)
values(1, 1, 'In this section, you will be learning how to keep your documents safe by utilizing the secure print features. You will learn to use various security features and tools.', 100);
insert into SectionOverview(SectionID, CourseID, SectionDescription, SectionProgress)
values(2, 1, 'In this section, you will learn how to maximize your machine uptime by properly clearing paper jams.', 60);
insert into SectionOverview(SectionID, CourseID, SectionDescription, SectionProgress)
values(3, 1, 'In this section, you will learn how to go digital with scan to email and more. You will learn the functionalities of wireless and digital printing.', 0);

-- --------------------------------------------------------
-- Dummy Data for table SectionMaterials
--
insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(1, 1, 1,'BLOB');
insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(2, 1, 2,'BLOB');
insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(3, 1, 3,'BLOB');

-- --------------------------------------------------------
-- Dummy Data for table SectionQuiz
--
INSERT INTO SectionQuiz(SectionQuizID,SectionID,SectionMaterialsID,CourseID,quizType,quizResult,duration,quizStartTime)
values(1,1,1,1,'MCQ','P',90,'12:30:00 pm');

-- --------------------------------------------------------
-- Dummy Data for table QuizQn
--

INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',1,'Icons');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',2,'Options');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',3,'Selection');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',4,'Menu');

INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',1,'Distribution of inventory');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',2,'Purchasing of inventory');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',3,'Planning of inventory');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',4,'All of these');

INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',1,'1.1');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',2,'1.5');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',3,'2.0');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',4,'2.5');

INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'PHP is an open source software',4,1,'True');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'PHP is an open source software',4,2,'False');
-- --------------------------------------------------------
-- Dummy Data for table LearnerQuizAnswer
--

-- --------------------------------------------------------
-- Dummy Data for table SolutionTable
--
INSERT INTO SolutionTable(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (1,1,1,1,1,'Menu');
INSERT INTO SolutionTable(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (2,1,1,1,1,'All of these');
INSERT INTO SolutionTable(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (3,1,1,1,1,'2.0');
INSERT INTO SolutionTable(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (4,1,1,1,1,'True');