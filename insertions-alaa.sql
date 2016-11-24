

-- USE School_System; 

-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (1, 'ahmed.aly','Ahmed', 'Aly', 'ahmed.aly@gmail.com', 'building 22 - Nile St.- Cairo', '02-2544234');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (2, 'mohamed.sherif', 'Mohamed', 'Sherif', 'mohamed.sherif12@gmail.com', 'building 12-horreya St-Nasr City-Cairo', '02-12345678');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (3, 'rania.ramy','Rania', 'Ramy', 'ranya.ramy52@gmail.com', 'building 43 - Khalid Ibn Elwaleed St.- Tagamoa - Cairo', '02-32467425');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (4, 'hosny.gserha','Hosny', 'Gesrha', 'hosny.gesrha19970@gmail.com', 'building 31 - Galaa St.- Giza', '02-54309954');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (5,'amr.tawfik', 'Amr', 'Tawfik', 'amr.tawfik26@gmail.com', 'building 50 - AbouBakr ElSeddek St.- Rehab City - Cairo', '02-23457532');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (6, 'khalid.hassan','Khalid', 'Hassan', 'khalid.hassan20@gmail.com', 'building 23 - Ramsees St.- Cairo', '02-25761274');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (7, 'mahmoud.radwan','Mahmoud', 'Radwan', 'mahmoud.radwan34@yahoo.com', 'building 22 - Salah Salem St.- Nasr City - Cairo', '02-25432156');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (8, 'omar.salman', 'Omar','Salman', 'omar.salman29@yahoo.com', 'building 22 - Abbas El-Akkad St.- Nasr City - Cairo', '02-287542097');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (9, 'hanaa.samir', 'Hanaa', 'Samir', 'hanaa.samir7@yahoo.com', 'building 54 - Tawfik Elhakeem St.- Rehab City - Cairo', '02-23456526');
-- INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
-- VALUES (10, 'hossam.helmy', 'Hossam', 'Helmy', 'hossam.helmy5@yahoo.com', 'building 22 - Makram Ebeid St.- Nasr City - Cairo', '02-2346656');


-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (1,'012345678910');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (2,'0122481786');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (2,'01000232386');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (4,'01113310987');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (5,'01034437668');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (3,'012345678234');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (6,'01034437633');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (7,'01173312345');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (8,'012345678542');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (9,'01034437822');
-- INSERT INTO Mobile_Of_Parent(parent_id, mobile)
-- VALUES (10,'01173312987');

-- -- ibn 1
-- INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
-- VALUES(123945,'Zyiad', 'Aly','male','2009-1-15','elementary');
--  -- ibn 1 brdo
-- INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
-- VALUES(323587, 'Iyad', 'Aly', 'male', '2002-4-14', 'middle');
-- -- bnt 2 w 9
-- -- music club
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level, school_id, username, password, id)
VALUES(424875, 'Nour', 'Sherif', 'female', '2000-3-15', 'high', 5, 'Nour.Sherif1', 'Ns123456@' ,1); 
-- bnt 3
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(743812, 'Jana', 'Yehia', 'female', '2005-6-12','elementary');
-- bnt 4
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(761293,'Marwa', 'Gesrha', 'female', '2000-5-25', 'high');
-- bnt 5
-- f IEEE w bdaya
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level, school_id, username, password, id)
VALUES(5339261,'Shaghaf', 'Tawfik', 'female', '2008-8-26', 'elementary', 2, 'Shaghaf.Tawfik1','St1124610', 1);
-- bnt 5 brdo
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(5420917, 'Shahd', 'Tawfik', 'female', '2003-3-30', 'middle');
-- ibn 6
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(612065, 'Ahmed', 'Hassan', 'male', '2003-2-11', 'middle');
-- bnt 6 brdo 
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(623019, 'Sarah', 'Hassan', 'female', '2007-7-7', 'elementary');
-- ibn 7
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(3296401, 'Mohannad', 'Radwan', 'male', '2001-9-30','middle');
-- ibn 8 
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(6712049, 'Mazen', 'Salman', 'male', '1999-6-30','high');
-- bnt 8 brdo
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(1308752, 'Malak', 'Salman', 'female', '2010-10-20', 'elementary');
-- ibn 2 w 9 
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level, school_id, username, password, id)
VALUES(4309120, 'Ramy', 'Sherif', 'male', '2004-12-12', 'middle', 4, 'Ramy.Sherif1', 'Rs9871235', 1);
-- ibn 10 
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(6661239, 'Mohab', 'Helmy', 'male', '2006-2-26', 'elementary');
-- bnt 10 brdo
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(5532006, 'Haneen', 'Helmy', 'female', '2002-8-22', 'middle');


INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(1, 123945);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(1, 323587);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(2, 424875);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(9, 424875);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(3, 743812);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(4, 761293);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(5, 5339261);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(5, 5420917);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(6, 612065);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(6, 623019);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(7, 3296401);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(8, 6712049);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(2, 4309120);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(9, 4309120);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(10, 6661239);
INSERT INTO Parent_Of_Student(parent_id, child_ssn)
VALUES(10, 5532006);

INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(1, 612065, 6, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(1, 5339261, 5, 'accepted');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(5, 424875, 9, 'accepted');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(4, 4309120, 2, 'accepted');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(3, 123945, 1, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(5, 623019, 6, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(6, 6661239, 10, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
VALUES(7, 6712049, 8, 'rejected');

INSERT INTO Parent_Review_School(school_id, parent_id, review)
VALUES(1, 6, 'good');
INSERT INTO Parent_Review_School(school_id, parent_id, review)
VALUES(1, 5, 'great school');
INSERT INTO Parent_Review_School(school_id, parent_id, review)
VALUES(5, 9, 'bad');
INSERT INTO Parent_Review_School(school_id, parent_id, review)
VALUES(2, 4, 'highly recommended');
INSERT INTO Parent_Review_School(school_id, parent_id, review)
VALUES(7, 8, 'not recommended at all');

INSERT INTO Club_Member_Student(student_ssn, school_id, club_name)
VALUES(5339261, 1, 'IEEE');
INSERT INTO Club_Member_Student(student_ssn, school_id, club_name)
VALUES(5339261, 1, 'Bdaya');
INSERT INTO Club_Member_Student(student_ssn, school_id, club_name)
VALUES(424875,5,'Music Club');


INSERT INTO Activities(name, school_id, activity_datetime, location, equipment, description, type, admin_id, teacher_id)
VALUES('Camping in Dahab',1,'2017-01-15 07:00','Dahab','personal stuff, blanket, compass', 'you are welcome to enjoy many camping activities in Dahab including snorkleling and Safari trips', 'Camp', 10, 3);
INSERT INTO Activities(name, school_id, activity_datetime, location, equipment, description, type, admin_id, teacher_id)
VALUES('Cycling Race', 5, '2016-12-12 17:00', 'ElGouna', 'Bicycle and Helmet', 'our students can participate in Cycling race, prizes will be offered to winners','Cycling Race',11,6);