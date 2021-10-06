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
values(1, 1, 'This is a good section', 20);

-- --------------------------------------------------------
-- Dummy Data for table SectionMaterials
--
insert into SectionMaterials(SectionMaterialsID, CourseID, SectionID, SectionMaterials)
values(1, 1, 1,'This is a good section');

-- --------------------------------------------------------
-- Dummy Data for table SectionMaterials
--
INSERT INTO SectionQuiz(SectionQuizID,SectionID,SectionMaterialsID,CourseID,quizType,quizResult,duration,quizStartTime)
values(1,1,1,1,'MCQ','P',90,'12:30:00 pm');

-- --------------------------------------------------------
-- Dummy Data for table SectionQuiz
--

-- --------------------------------------------------------
-- Dummy Data for table QuizQn
--

-- --------------------------------------------------------
-- Dummy Data for table LearnerQuizAnswer
--

-- --------------------------------------------------------
-- Dummy Data for table SolutionTable
--
