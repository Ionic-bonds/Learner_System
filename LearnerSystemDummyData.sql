-- --------------------------------------------------------
-- Dummy Data for table CourseOverview
--
insert into CourseOverview(CourseName, CourseDescription, CourseStatus)
values(' Xerox WorkCentre 7845', 'This is a course', TRUE);
insert into CourseOverview(CourseName, CourseDescription, CourseStatus)
values('Programming for Xerox WorkCentre with CardAccess and Integration', 'This is a software practices course', TRUE);
insert into CourseOverview(CourseName, CourseDescription, CourseStatus)
values('Software Theory G64', 'The ultimate theory and go to for software everything', TRUE);
insert into CourseOverview(CourseName, CourseDescription, CourseStatus)
values('Theoratical Theory R23', 'The theory of all theories and the answers to everything you been looking for', TRUE);
insert into CourseOverview(CourseName, CourseDescription, CourseStatus)
values('Practical Practices W76', 'Practice makes perfect. Practice practicing.', TRUE);

-- --------------------------------------------------------
-- Dummy Data for table Person
--
insert into Person(name, nric, ContactNo, email)
values('Jacky', 'S9624229H', 82011734, 'jacky@company.com');

insert into Person(name, nric, ContactNo , email)
values('Leaky', 'S91234567A', 97011734, 'leeky@company.com');

insert into Person(name, nric, ContactNo , email)
values('JaiQee', 'S9999999A', 89999999, 'jiaqilovesponiesandstrawberries@company.com');

insert into Person(name, nric, ContactNo , email)
values('kingston', 'S91111111A', 91111111, 'imtheking@company.com');

insert into Person(name, nric, ContactNo , email)
values('Leenord', 'S9222222A', 82222222, 'ibuycoffeeidonlike@company.com');

insert into Person(name, nric, ContactNo , email)
values('King', 'S9222222A', 82222222, 'ibuycoffeeidonlike2@company.com');

insert into Person(name, nric, ContactNo , email)
values('Leo', 'S9222222A', 82222222, 'ibuycoffeeidonlike3@company.com');

insert into Person(name, nric, ContactNo , email)
values('Leonard', 'S9222222A', 82222222, 'ibuycoffeeidonlike4@company.com');

insert into Person(name, nric, ContactNo , email)
values('Timmy', 'S9222222A', 82222222, 'ibuycoffeeidonlike5@company.com');

insert into Person(name, nric, ContactNo , email)
values('Elvis', 'S9222222A', 82222222, 'ibuycoffeeidonlike6@company.com');

insert into Person(name, nric, ContactNo , email)
values('Aloy', 'S9222222A', 82222222, 'ibuycoffeeidonlike7@company.com');

insert into Person(name, nric, ContactNo , email)
values('Aloysious', 'S9222222A', 82222222, 'ibuycoffeeidonlike8@company.com');

insert into Person(name, nric, ContactNo , email)
values('Tan', 'S9222222A', 82222222, 'ibuycoffeeidonlike9@company.com');

-- --------------------------------------------------------
-- Dummy Data for table Trainer
--
insert into Trainer(personid) values(1);
insert into Trainer(personid) values(2);

-- --------------------------------------------------------
-- Dummy Data for table Learner
--
insert into Learner(personid) values(3);
insert into Learner(personid) values(4);
insert into Learner(personid) values(5);
insert into Learner(personid) values(6);
insert into Learner(personid) values(7);
insert into Learner(personid) values(8);
insert into Learner(personid) values(9);
insert into Learner(personid) values(10);
insert into Learner(personid) values(11);
insert into Learner(personid) values(12);
insert into Learner(personid) values(13);

-- --------------------------------------------------------
-- Dummy Data for table TrainerSchedule
--
insert into TrainerSchedule(TrainerID, CourseID) values(1,1);
insert into TrainerSchedule(TrainerID, CourseID) values(1,2);
insert into TrainerSchedule(TrainerID, CourseID) values(2,3);
insert into TrainerSchedule(TrainerID, CourseID) values(2,4);

-- --------------------------------------------------------
-- Dummy Data for table ClassDescription
--
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(1,1,50,'12:30', '2021-09-21', '2:00', '2021-12-21');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(2,1,40,'13:30', '2021-09-23', '4:00', '2021-12-23');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(3,1,40,'12:00', '2021-09-25', '6:00', '2021-12-25');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(4,2,50,'12:30', '2021-10-21', '2:00', '2022-01-21');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(5,2,40,'13:30', '2021-10-23', '4:00', '2022-01-23');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(6,2,40,'12:00', '2021-10-25', '6:00', '2022-01-25');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(7,3,50,'12:30', '2021-10-2', '2:00', '2022-01-2');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(8,3,40,'13:30', '2021-10-3', '4:00', '2022-01-3');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(9,3,40,'12:00', '2021-10-4', '6:00', '2022-01-4');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(10,4,50,'12:30', '2021-09-2', '2:00', '2021-12-2');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(11,4,40,'13:30', '2021-09-3', '4:00', '2021-12-3');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(12,4,40,'12:00', '2021-09-4', '6:00', '2021-12-4');

insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(13,5,50,'12:30', '2021-10-11', '2:00', '2022-01-11');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(14,5,40,'13:30', '2021-10-12', '4:00', '2022-01-12');
insert into ClassDescription(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(15,5,40,'12:00', '2021-10-13', '6:00', '2022-01-13');

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
-- insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,11,1);
-- insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,12,1);
-- insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,13,1);
-- insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,14,1);
-- insert into CourseRecord(CourseID, TrainerScheduleID,LearnerID, ClassID) values(1,1,15,1);

-- --------------------------------------------------------
-- Dummy Data for table LearnerRecord
--
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,1,'Software Engineering X123', 1, 'Pass', TRUE, 20.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,2,'Software Practices Q43', 2, 'Pass', TRUE, 17.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(1,3,'Practical Practices W76', 5, 'Pass', TRUE, 15.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(2,4,'Software Engineering X123', 1, 'Pass', TRUE, 19.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(2,5,'Software Practices Q43', 2, 'Pass', TRUE, 18);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(2,6,'Practical Practices W76', 5, 'Pass', TRUE, 15);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(3,7,'Theoratical Theory R23', 4, 'Pass', TRUE, 14.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(3,8,'Software Theory G64', 3, 'Pass', TRUE, 16.5);
insert into LearnerRecord(LearnerID, LearnerRecordID,EnrolledCourses, EnrolledClass, FinalQuizResult, CourseStatus, SectionProgress) values(3,9,'Software Engineering X123', 1, 'Pass', TRUE, 18);

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
-- insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
-- values(4, 2, 4,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
-- insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
-- values(5, 2, 5,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
-- insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
-- values(6, 2, 6,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
-- insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
-- values(7, 3, 7,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
-- insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
-- values(8, 3, 8,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
-- insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
-- values(9, 3, 9,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');

-- --------------------------------------------------------
-- Dummy Data for table SectionQuiz
--
INSERT INTO SectionQuiz(SectionQuizID,SectionID,SectionMaterialsID,CourseID,quizType,quizResult,duration,quizStartTime)
values(1,1,1,1,'MCQ','P',90,'12:30:00');
INSERT INTO SectionQuiz(SectionQuizID,SectionID,SectionMaterialsID,CourseID,quizType,quizResult,duration,quizStartTime)
values(2,1,1,1,'MCQ','G',90,'12:30:00');

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
values(4,1,1,1,1,'PHP is an open source software',1,'True');
INSERT INTO QuizQn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(4,1,1,1,1,'PHP is an open source software',2,'False');
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