-- --------------------------------------------------------
-- Dummy Data for table CourseOverview
--
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(1, 'Software Engineering X123', 'This is a course', TRUE);
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(2, 'Software Practices Q43', 'This is a software practices course', TRUE);
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(3, 'Software Theory G64', 'The ultimate theory and go to for software everything', TRUE);
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(4, 'Theoratical Theory R23', 'The theory of all theories and the answers to everything you been looking for', TRUE);
insert into CourseOverview(CourseID, CourseName, CourseDescription, CourseStatus)
values(5, 'Practical Practices W76', 'Practice makes perfect. Practice practicing.', TRUE);

-- --------------------------------------------------------
-- Dummy Data for table Person
--
insert into Person(personID, name, nric, ContactNo, email)
values(1, 'Jacky', 'S9624229H', 82011734, 'jacky@company.com');

insert into Person(personID, name, nric, ContactNo , email)
values(2, 'Leeky', 'S91234567A', 97011734, 'leeky@company.com');

insert into Person(personID, name, nric, ContactNo , email)
values(2, 'JiaQi', 'S9999999A', 89999999, 'jiaqilovesponiesandstrawberries@company.com');

insert into Person(personID, name, nric, ContactNo , email)
values(2, 'kingson', 'S91111111A', 91111111, 'imtheking@company.com');

insert into Person(personID, name, nric, ContactNo , email)
values(2, 'leonard', 'S9222222A', 82222222, 'ibuycoffeeidonlike@company.com');

-- --------------------------------------------------------
-- Dummy Data for table Trainer
--
insert into Trainer(TrainerID, personid) values(1,1);
insert into Trainer(TrainerID, personid) values(2,2);

-- --------------------------------------------------------
-- Dummy Data for table Learner
--
insert into Learner(LearnerID, personid) values(1,3);
insert into Learner(LearnerID, personid) values(2,4);
insert into Learner(LearnerID, personid) values(3,5);

-- --------------------------------------------------------
-- Dummy Data for table TrainerSchedule
--
insert into TrainerSchedule(TrainerScheduleID, TrainerID, CourseID) values(1,1,1);
insert into TrainerSchedule(TrainerScheduleID, TrainerID, CourseID) values(2,1,2);
insert into TrainerSchedule(TrainerScheduleID, TrainerID, CourseID) values(3,2,3);
insert into TrainerSchedule(TrainerScheduleID, TrainerID, CourseID) values(4,2,4);

-- --------------------------------------------------------
-- Dummy Data for table ClassDescription
--
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(1,1,50,'12:30pm', '21 September 2021', '2:00pm', '21 December 2021');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(2,1,40,'13:30pm', '23 September 2021', '4:00pm', '23 December 2021');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(3,1,40,'12:00pm', '25 September 2021', '6:00pm', '25 December 2021');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(4,2,50,'12:30pm', '21 October 2021', '2:00pm', '21 January 2022');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(5,2,40,'13:30pm', '23 October 2021', '4:00pm', '23 January 2022');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(6,2,40,'12:00pm', '25 October 2021', '6:00pm', '25 January 2022');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(7,3,50,'12:30pm', '2 October 2021', '2:00pm', '2 January 2022');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(8,3,40,'13:30pm', '3 October 2021', '4:00pm', '3 January 2022');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(9,3,40,'12:00pm', '4 October 2021', '6:00pm', '4 January 2022');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(10,4,50,'12:30pm', '2 September 2021', '2:00pm', '2 December 2021');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(11,4,40,'13:30pm', '3 September 2021', '4:00pm', '3 December 2021');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(12,4,40,'12:00pm', '4 September 2021', '6:00pm', '4 December 2021');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(13,5,50,'12:30pm', '11 October 2021', '2:00pm', '11 January 2022');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(14,5,40,'13:30pm', '12 October 2021', '4:00pm', '12 January 2022');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(15,5,40,'12:00pm', '13 October 2021', '6:00pm', '13 January 2022');

-- --------------------------------------------------------
-- Dummy Data for table CourseRecord
--
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,1,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,2,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,3,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,4,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,5,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,6,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,7,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,8,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,9,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,10,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,11,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,12,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,13,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,14,1);
insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,15,1);

-- --------------------------------------------------------
-- Dummy Data for table LearnerRecord
--
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,1,'Software Engineering X123', 1, 'Pass', TRUE, 20.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,2,'Software Practices Q43', 2, 'Pass', TRUE, 17.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,3,'Practical Practices W76', 5, 'Pass', TRUE, 15.5);

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
values(1, 1, 1,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(2, 1, 2,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(3, 1, 3,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');

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