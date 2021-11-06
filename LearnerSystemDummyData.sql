-- --------------------------------------------------------
-- Dummy Data for table Course_Overview
--
insert into Course_Overview(CourseName, CourseDescription, Prerequisite)
values('Fundamentals of Xerox WorkCentre 7845', 'Xerox now offers on-demand training for added convenience and flexibility at no additional cost to you. No matter where you are, 24/7 access to training will be available through Xerox. Learn how to properly use your office technology to get day-to-day work done more efficiently. Here are some examples of how training can help you:Keep documents safe by utilizing the secure print feature, Maximize machine uptime by properly clearing paper jams, Go digital with scan to email and more.', FALSE);
insert into Course_Overview(CourseName, CourseDescription, Prerequisite)
values('Programming for Xerox WorkCentre with CardAccess and Integration', 'This is a software practices course', TRUE);
insert into Course_Overview(CourseName, CourseDescription, Prerequisite)
values('Software Theory G64', 'The ultimate theory and go to for software everything', FALSE);
insert into Course_Overview(CourseName, CourseDescription, Prerequisite)
values('Theoratical Theory R23', 'The theory of all theories and the answers to everything you been looking for', FALSE);
insert into Course_Overview(CourseName, CourseDescription, Prerequisite)
values('Practical Practices W76', 'Practice makes perfect. Practice practicing.', TRUE);

-- --------------------------------------------------------
-- Dummy Data for table CoursePrerequisite
--
insert into Course_Prerequisite(MainCourseID, PrerequisiteCourseID)
values(2, 1);
insert into Course_Prerequisite(MainCourseID, PrerequisiteCourseID)
values(5, 3);
insert into Course_Prerequisite(MainCourseID, PrerequisiteCourseID)
values(5, 4);

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

insert into Person(name, nric, ContactNo , email)
values('Yuhao', 'S9222222A', 82222222, 'yuhao@company.com');

insert into Person(name, nric, ContactNo , email)
values('Ling', 'S9222222A', 82222222, 'ling@company.com');

insert into Person(name, nric, ContactNo , email)
values('Thomas', 'S9222222A', 82222222, 'Thomas@company.com');

insert into Person(name, nric, ContactNo , email)
values('Sam', 'S9222222A', 82222222, 'sam@company.com');

insert into Person(name, nric, ContactNo , email)
values('Sammy', 'S9222222A', 82222222, 'Sammy@company.com');

-- --------------------------------------------------------
-- Dummy Data for table Trainer
--
insert into Trainer(PersonID) values(1);
insert into Trainer(PersonID) values(2);

-- --------------------------------------------------------
-- Dummy Data for table Learner
--
insert into Learner(PersonID) values(3);
insert into Learner(PersonID) values(4);
insert into Learner(PersonID) values(5);
insert into Learner(PersonID) values(6);
insert into Learner(PersonID) values(7);
insert into Learner(PersonID) values(8);
insert into Learner(PersonID) values(9);
insert into Learner(PersonID) values(10);
insert into Learner(PersonID) values(11);
insert into Learner(PersonID) values(12);
insert into Learner(PersonID) values(13);

insert into Learner(PersonID) values(14);
insert into Learner(PersonID) values(15);
insert into Learner(PersonID) values(16);
insert into Learner(PersonID) values(17);
insert into Learner(PersonID) values(18);

-- --------------------------------------------------------
-- Dummy Data for table Trainer_Schedule
--
insert into Trainer_Schedule(TrainerID, CourseID) values(1,1);
insert into Trainer_Schedule(TrainerID, CourseID) values(1,2);
insert into Trainer_Schedule(TrainerID, CourseID) values(2,3);
insert into Trainer_Schedule(TrainerID, CourseID) values(2,4);
insert into Trainer_Schedule(TrainerID, CourseID) values(2,5);

-- --------------------------------------------------------
-- Dummy Data for table Class_Description
--
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(1,1,50,'12:30', '2021-09-21', '2:00', '2021-12-21');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(2,1,40,'13:30', '2021-09-23', '4:00', '2021-12-23');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(3,1,40,'12:00', '2021-09-25', '6:00', '2021-12-25');

insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(4,2,50,'12:30', '2021-10-21', '2:00', '2022-01-21');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(5,2,40,'13:30', '2021-10-23', '4:00', '2022-01-23');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(6,2,40,'12:00', '2021-10-25', '6:00', '2022-01-25');

insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(7,3,50,'12:30', '2021-10-2', '2:00', '2022-01-2');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(8,3,40,'13:30', '2021-10-3', '4:00', '2022-01-3');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(9,3,40,'12:00', '2021-10-4', '6:00', '2022-01-4');

insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(10,4,50,'12:30', '2021-09-2', '2:00', '2021-12-2');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(11,4,40,'13:30', '2021-09-3', '4:00', '2021-12-3');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(12,4,40,'12:00', '2021-09-4', '6:00', '2021-12-4');

insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(13,5,50,'12:30', '2021-10-11', '2:00', '2022-01-11');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(14,5,40,'13:30', '2021-10-12', '4:00', '2022-01-12');
insert into Class_Description(ClassID, CourseID, ClassSize, StartTime, StartDate, EndTime, EndDate) values(15,5,40,'12:00', '2021-10-13', '6:00', '2022-01-13');

-- --------------------------------------------------------
-- Dummy Data for table Course_Record
--
-- need to edit 
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,1,1, 80.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,2,1, 100.0 , '90');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,3,1, 20.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,4,1, 10.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,5,1, 80.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,6,1, 80.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,7,1, 60.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,8,1, 30.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,9,1, 80.0 , 'NA');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,10,1, 100.0 , '100');

insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(1,1,11,1, 100.0 , '87.9');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(3,3,14,7, 100.0 , '85');
insert into Course_Record(CourseID, TrainerScheduleID,LearnerID, ClassID, CourseProgress, FinalQuizResult) values(4,4,14,10, 100.0 , '93.4');
-- --------------------------------------------------------
-- Dummy Data for table Enrollment
--
-- need to edit 

insert into Enrollment(LearnerID,CourseID, ClassID, Approved, passPrerequisite) values(11,2, 4, FALSE, TRUE); 
insert into Enrollment(LearnerID,CourseID, ClassID, Approved, passPrerequisite) values(12,2, 4, FALSE, FALSE);
insert into Enrollment(LearnerID,CourseID, ClassID, Approved, passPrerequisite) values(13,1, 1, FALSE, TRUE);
insert into Enrollment(LearnerID,CourseID, ClassID, Approved, passPrerequisite) values(14,5, 13, FALSE, TRUE);
insert into Enrollment(LearnerID,CourseID, ClassID, Approved, passPrerequisite) values(14,2, 4, FALSE, FALSE);
insert into Enrollment(LearnerID,CourseID, ClassID, Approved, passPrerequisite) values(15,5, 13, TRUE, FALSE);


-- --------------------------------------------------------
-- Dummy Data for table Section_Overview
--
insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(1, 1, 'In this section, you will be learning how to keep your documents safe by utilizing the secure print features. You will learn to use various security features and tools.', 100);
insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(2, 1, 'In this section, you will learn how to maximize your machine uptime by properly clearing paper jams.', 60);
insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(3, 1, 'In this section, you will learn how to go digital with scan to email and more. You will learn the functionalities of wireless and digital printing.', 0);


insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(1, 2, 'In this section, you will be learning what is secure access.', 100);
insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(2, 2, 'In this section, you will learn the secure access components.', 60);
insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(3, 2, 'In this section, you will learn about data reader support and user workflow.', 0);

insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(1, 3, 'In this section, you will be learning what is software.', 100);
insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(2, 3, 'In this section, you will learn the various components of software.', 60);
insert into Section_Overview(SectionID, CourseID, SectionDescription, SectionProgress)
values(3, 3, 'In this section, you will learn about how software has changed over the years.', 0);

-- --------------------------------------------------------
-- Dummy Data for table Section_Materials
--
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(1, 1, 1,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(2, 1, 1,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(3, 1, 1,'https://www.youtube.com/watch?v=Bt8lkPUmv7I');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(4, 1, 2,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(5, 1, 2,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(6, 1, 2,'https://www.youtube.com/watch?v=Bt8lkPUmv7I');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(7, 1, 3,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(8, 1, 3,'https://spmprojectcoursematerials.s3.us-east-2.amazonaws.com/Fundamentals+of+Xerox+WorkCentre+7845.pdf');
insert into Section_Materials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(9, 1, 3,'https://www.youtube.com/watch?v=Bt8lkPUmv7I');

-- --------------------------------------------------------
-- Dummy Data for table Section_Quiz
--
INSERT INTO Section_Quiz(SectionQuizID,SectionID,SectionMaterialsID,CourseID,quizResult,duration,quizStartTime)
values(1,1,1,1,'P',90,'12:30:00');
INSERT INTO Section_Quiz(SectionQuizID,SectionID,SectionMaterialsID,CourseID,quizResult,duration,quizStartTime)
values(2,1,1,1,'G',90,'12:30:00');

-- --------------------------------------------------------
-- Dummy Data for table Quiz_Qn
--
-- INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo1,QuizOption1,QuizOptionNo2,QuizOption2,QuizOptionNo3,QuizOption3,QuizOptionNo4,QuizOption4)
-- values(1,1,1,1,1,'A display listing of program options which users can select, is called',1,'Icons'2,'Options',3,'Selection',4,'Menu');

-- INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo1,QuizOption1,QuizOptionNo2,QuizOption2,QuizOptionNo3,QuizOption3,QuizOptionNo4,QuizOption4)
-- values(2,1,1,1,1,'An inventory management program can assist with the',1,'Distribution of inventory',2,'Purchasing of inventory',3,'Planning of inventory',4,'All of these');


-- INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo1,QuizOption1,QuizOptionNo2,QuizOption2,QuizOptionNo3,QuizOption3,QuizOptionNo4,QuizOption4)
-- values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',1,'1.1',2,'1.5',3,'2.0',4,'2.5');

-- INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo1,QuizOption1,QuizOptionNo2,QuizOption2,QuizOptionNo3,QuizOption3,QuizOptionNo4,QuizOption4)
-- values(4,1,1,1,1,'PHP is an open source software',1,'True',2,'False');

INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',1,'Icons');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',2,'Options');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',3,'Selection');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(1,1,1,1,1,'A display listing of program options which users can select, is called',4,'Menu');

INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',1,'Distribution of inventory');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',2,'Purchasing of inventory');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',3,'Planning of inventory');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(2,1,1,1,1,'An inventory management program can assist with the',4,'All of these');

INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',1,'1.1');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',2,'1.5');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',3,'2.0');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(3,1,1,1,1,'In any software package, which of the following version represents a major improvement on the earlier version?',4,'2.5');

INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(4,1,1,1,1,'PHP is an open source software',1,'True');
INSERT INTO Quiz_Qn(QuizQnID, CourseID,SectionMaterialsID, SectionQuizID, SectionID,QuizQuestion, QuizOptionNo,QuizOption)
values(4,1,1,1,1,'PHP is an open source software',2,'False');
-- --------------------------------------------------------
-- Dummy Data for table LearnerQuizAnswer
--

-- --------------------------------------------------------
-- Dummy Data for table Solution_Table
--
INSERT INTO Solution_Table(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (1,1,1,1,1,'Menu');
INSERT INTO Solution_Table(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (2,1,1,1,1,'All of these');
INSERT INTO Solution_Table(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (3,1,1,1,1,'2.0');
INSERT INTO Solution_Table(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,quizSolution)
values (4,1,1,1,1,'True');