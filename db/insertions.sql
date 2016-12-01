USE School_System; 

-- **SCHOOLS**

INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
VALUES ('Manor House International School', '67 Hussein Ahmed Rashad, Ad Doqi, Giza Governorate', 'Manor House American School thrives to provide a holistic learning experience that provides individuals the opportunity to learn and discover who they are in a culturally attuned environment that fosters pride in one’s identity. We instill the basic foundation of respect for the other.', 'Manor House American School is a learning institution that provides the opportunity for self discovery. The premise of “Know Thy Self” is our main belief.', 'English', 'Both American and IGCSE sections.', 30000, 'International', 'manorhouse@schools.com');
 
-- SET @school = (LAST_INSERT_ID());  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 33');
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 34'); 
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 36');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 37');  
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');

INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
VALUES ('Al Bashaer', ' Zahraa Al Maadi, El-Basatin Sharkeya, Al Maadi, Cairo Governorate', 'To build a generation who :\nBelieves in God and obeying Him lovingly and choosingly .\nUpdated with the latest scientific developments and technology. \n Well exposed to the entire world and well – rounded enough to cope with people from different cultures and backgrounds. \n Loving nature and proactively interacting with  surroundings.', 'To remain as one of the most prominent, moderate Islamic schools in Egypt. (current mission).\nCompete at the global level from the educational perspective. (within 3 years).\nExpansion and transfer of expertise, opening new schools in other Islamic or non Islamic countries (within 10 years).\nEstablishing a university or institutes, having the same mission, in the future (within the coming 10 years).', 'English', 'Al Bashaer Schools,  were founded in 1994, and cover five educational levels starting from Preschool & Kindergarten up to Secondary.', 200000, 'International', 'albashaer@schools.com'); 
SET @school_id = LAST_INSERT_ID(); 
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+201011108241');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+201000024687');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+2-029706625-6');  
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');


INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
VALUES ('Futures Languages Schools', 'El Meerag City, Ring Road, Near Carrefour Maadi, Cairo.', 'We are set to create a unique educational and cultural model that contributes to narrowing Egypt’s chronic growth gap through raising a critical mass of our graduates.', 'Futures Educational Systems (FES) was initiated with a mission to help enhance quality and equity of education in Egypt by establishing an educational model that would be replicable.', 'English', 'Commencing in 1993, Futures Language Schools (FLS) are now the largest chain of private schools in Egypt.', 70000, 'National', 'info@futuresnet.net'); 
SET @school_id = LAST_INSERT_ID(); 
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '(202) 2520 4592');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '(202) 2520 4596');  

INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');

INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
VALUES ('Narmer American College in Egypt', '20 El-Narguis Service Area El Tagamoa–El Khames, New Cairo City, Cairo, Egypt', 'Narmer American College has as its primary mission the education and development of the whole student-mind, body and spirit. The students will be equipped to assume positions of leadership with an understanding of technology and its impact on the global community. Students will be able to cooperate in a diverse multicultural community.', '', 'English', 'The school was founded in the year 2000 by Mr. Mohamed El Rashidy, an educator with an experience of 50 years in Education.  The school campus has outstanding facilities. Our Faculty members are highly experienced and qualified professional educators. ', 10000, 'International', 'info@nacegypt.com' ); 
SET @school_id = LAST_INSERT_ID(); 
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20(2) 2920-1200');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20(2) 2920-1990');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '0124801000'); 
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');


INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
VALUES ('Dar El Tarbiah National School', '12 Mahmoud Azmy Str.,Zamalek – Cairo – Egypt., Zamalek, Giza Governorate', 'A set of basic skills – linguistic, mathematical, scientific, artistic, physical and social. \nAn inquiring and discriminating mind and a desire for knowledge.\nStrong self esteem and high personal expectations.\nTolerance and respect for others. \nA very remarkable and outstanding standard of education needed to assist them in becoming future global citizens empowered to face all the challenges of the 21st century.', 's to enable all students to become life-long learners through providing them with the essential knowledge, skills and tools to become productive, responsible citizen in our fast growing world. We are committed to provide educational excellence for all.', 'English', 'Dar El Tarbiah Schools is an Egyptian educational institution founded in 1958 by Dr. Nawal El Degwi. Dar El Tarbiah was the first English-language instruction medium institution founded by Egyptians.',14000, 'National', 'national.bh@dareltarbiah.edu.eg'); 
SET @school_id = LAST_INSERT_ID(); 
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27368145');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27384152');  
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');


INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
VALUES ('Dar El Tarbiah IGCSE School', '24 Ismail Mohamed St., Zamalek  – Cairo- Egypt', 'A set of basic skills – linguistic, mathematical, scientific, artistic, physical and social. \nAn inquiring and discriminating mind and a desire for knowledge.\nStrong self esteem and high personal expectations.\nTolerance and respect for others. \nA very remarkable and outstanding standard of education needed to assist them in becoming future global citizens empowered to face all the challenges of the 21st century.', 's to enable all students to become life-long learners through providing them with the essential knowledge, skills and tools to become productive, responsible citizen in our fast growing world. We are committed to provide educational excellence for all.', 'English', 'Dar El Tarbiah Schools is an Egyptian educational institution founded in 1958 by Dr. Nawal El Degwi. Dar El Tarbiah was the first English-language instruction medium institution founded by Egyptians.',24000, 'International', 'ig.agouza@dareltarbiah.edu.eg'); 
SET @school_id = LAST_INSERT_ID(); 
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '33443231');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '33443231');  
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');

INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
VALUES ('Dar El Tarbiah American High School', '24 Ismail Mohamed St., Zamalek  – Cairo- Egypt', 'A set of basic skills – linguistic, mathematical, scientific, artistic, physical and social. \nAn inquiring and discriminating mind and a desire for knowledge.\nStrong self esteem and high personal expectations.\nTolerance and respect for others. \nA very remarkable and outstanding standard of education needed to assist them in becoming future global citizens empowered to face all the challenges of the 21st century.', 's to enable all students to become life-long learners through providing them with the essential knowledge, skills and tools to become productive, responsible citizen in our fast growing world. We are committed to provide educational excellence for all.', 'English', 'Dar El Tarbiah Schools is an Egyptian educational institution founded in 1958 by Dr. Nawal El Degwi. Dar El Tarbiah was the first English-language instruction medium institution founded by Egyptians.',24000, 'International', 'american@dareltarbiah.edu.eg'); 
SET @last_id = LAST_INSERT_ID(); 
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27365970');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27357682');  
INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27357683');  
INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');	


-- **COURSES** 

INSERT INTO Courses (code, name, description, grade, level) 
VALUES (101, 'Basic Arabic I', 'Basic rules of Arabic grammar', 1, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (201, 'Basic Arabic II', 'Arabic grammar and basic vocabulary for the second grade.', 2, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (301, 'Basic Arabic III', 'Arabic grammar and basic vocabulary for the second grade.', 3, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (401, 'Basic Arabic IV', 'Introduction to Arabic essay writing and literature.', 4, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (501, 'Basic Arabic V', 'Introduction to Arabic essay writing and literature', 5, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (701, 'Preparatory Arabic', 'Foundation in Arabic grammar and literature', 7, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (801, 'Advanced Arabic', 'Foundation in Arabic grammar and literature', 8, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (102, 'Basic English I', 'Basics of English language. Spelling and easy grammar', 1, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (202, 'Basic English II', 'Basics of English. Writing and reading', 2, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (402, 'Introduction to English Literature', 'Studying an easy novel to get a feeling for English literature.',4, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (1002, 'Advanced English Literature', 'Going into depth into English Literature. Studying Hamlet by William Shakespeare', 10,'high');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (303, 'Math I', 'Baic mathematical operations for primary schools.', 3, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (403, 'Math II', 'Basic algebra and geometry.', 4, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (803, 'Calculus I', 'Differentiation and integration.', 8, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (1103, 'Advanced Calculus', 'Applications of calculus and partial differentials.', 11, 'high');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (1203, 'Probability and Statistics', 'An overview of the conepts of probability and statistics.', 12, 'high');

INSERT INTO Courses (code, name, description, grade, level) 
VALUES (104, 'Basic French', 'Conversation in French language.', 1, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (404, 'Elementry French', 'More advanced French.', 4, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (1004, 'Advanced French', 'Essay writing in French.', 10, 'high');

INSERT INTO Courses (code, name, description, grade, level) 
VALUES (305, 'Science I', 'Light introduction to basic scientific concepts using games.', 3, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (405, 'Science II', 'More in-depth coverage of basics of chemisrty, physics and biology.', 4, 'elementary');

INSERT INTO Courses (code, name, description, grade, level)
VALUES (506, 'Basic Chemisrty I', 'Structure of atoms and molecules.', 5, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (606, 'Basic Chemisrty II', 'Energy levels and introduction to nuclear chemisrty', 6, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (706, 'Nuclear Chemisrty', 'Radiation and radioactivity.', 7, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (1006, 'Organic Chemisrty', '', 10, 'high');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (1106, 'Analytical Chemisrty', '', 11, 'high');

INSERT INTO Courses (code, name, description, grade, level) 
VALUES (507, 'Basic Physics I','', 5, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (607, 'Basic Physics II','', 6, 'elementary');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (707, 'Mechanics I', '', 7, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (807, 'Mechanics II','', 8, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (907, 'Electrical Physics', '', 9, 'middle');
INSERT INTO Courses (code, name, description, grade, level) 
VALUES (1007, 'Modren Physics', '', 10, 'high');
INSERT INTO Courses (code, name, description, grade, level)
VALUES(1107, 'Advanced Physics', '', 11, 'high'); 
INSERT INTO Courses (code, name, description, grade, level)
VALUES(1207, 'Introduction to Engineering Physics', '', 12, 'high'); 



-- **COURSE PREREQUISITE**

INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(101, 102); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(201, 301);
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(301, 401); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(401, 501); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(501, 701); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(701, 801); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(102, 202 ); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(303, 403); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(1103, 1203); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(305, 405); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(506, 606); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(606, 706); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(1006, 1106); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(507, 607); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(607, 707); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(707, 807); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(807, 907); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(907, 1007); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(1007, 1107); 
INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
VALUES(1107, 1207); 

-- **SUPPLIES** 
INSERT INTO Supplies (name, school_id, grade)
VALUES('Scissors', 2, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Scissors', 3, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Scissors', 4, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Scissors', 4, 2);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Scissors', 3, 2);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Pencils', 5, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Pencils', 6, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Pencils', 3, 2);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Pencils', 5, 2);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Pencils', 7, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Notebooks', 2, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Notebooks', 3, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Notebooks', 4, 1);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Notebooks', 5, 2);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Notebooks', 7, 3);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Notebooks', 2, 2);
INSERT INTO Supplies (name, school_id, grade)
VALUES('Notebooks', 2, 4);

-- **CLUBS** 
INSERT INTO Clubs (name, school_id)
VALUES ('IEEE', 1); 

INSERT INTO Clubs (name, school_id)
VALUES ('IEEE', 2); 

INSERT INTO Clubs (name, school_id)
VALUES ('IEEE', 3); 

INSERT INTO Clubs (name, school_id)
VALUES ('Bdaya', 1); 

INSERT INTO Clubs (name, school_id)
VALUES ('Bdaya', 4); 

INSERT INTO Clubs (name, school_id)
VALUES ('Music Club', 5); 

INSERT INTO Clubs (name, school_id)
VALUES ('Music Club', 6); 

INSERT INTO Clubs (name, school_id)
VALUES ('Art Club', 1); 

INSERT INTO Clubs (name, school_id)
VALUES ('Art Club', 2); 

INSERT INTO Clubs (name, school_id)
VALUES ('Art Club', 7); 

INSERT INTO Clubs (name, school_id)
VALUES ('Cinema Club', 2); 

INSERT INTO Clubs (name, school_id)
VALUES ('Cinema Club', 3); 

INSERT INTO Clubs (name, school_id)
VALUES ('Cinema Club', 5); 


-- **EMPLOYEES** 

INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate)
VALUES(1, 'Hossam', 'Hassan', 'hossamhassan@gmail.com', 'male', '21, Zamalek st., Cairo, Egypt', '1967-3-11');


INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate)
VALUES(2, 'Ibrahim', 'Hassan', 'ibrahimhassan@gmail.com', 'male', '21, Zamalek st., Cairo, Egypt', '1967-3-11');

INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(3, 'Nelly', 'Karim', 'nellykarim@gmail.com', 'female', '34 El Horreya st. Cairo, Egypt', '1966-1-1', 1);

INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(4, 'Ensherah', 'Mohsen', 'missensherah@gmail.com', 'male', '12 El Baroon st. Cairo, Egypt', '1970-3-4', 1);

INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(5, 'Abdelmonein', 'Madbouly', 'madbouly@gmail.com', 'male', '32 El Horreya st., Nasr City, Cairo, Egypt', '1934-2-3', 4);

INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(6, 'Abdelsalam', 'Elnabolsy', 'abdelsalamelnaboulsy@hotmail.com', 'male', '32 El Fann st, Downtown, Cairo, Egypt', '1950-2-2',5);

INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(7, 'Youssef', 'Wahby', 'yaalalhaawl@gmail.com', 'male', '25 Sudan st, El Mohandseen, Cairo, Egypt', '1980-2-2', 6);

INSERT INTO Employees (id,first_name, middle_name, last_name, email, gender, address, birthdate, school_id)
VALUES(8, 'Ramadan', 'Mabrouk', 'Aboulalamein', 'ramadanmabrouk@hotmail.com', 'male', '12 El Bohooth st, Dokki, Cairo, Egypt', '1988-2-3', 7);


INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(9, 'Effat', 'Abdelkereem', 'effat@gmail.com', 'female', '31 Dokki st, Dokki, Cairo, Egypt', '1987-3-3', 3);

INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(10, 'Abdelmo3ty', 'Abdelmo3ty', 'mo3ty@gmail.com', 'male', '11 Manial st, Manial, Cairo, Egypt', '1966-2-3', 1);

INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(11, 'Elnazer', 'Salaheldeen', 'elnazer@hotmail.com', 'male', '23 Lebnan st, Cairo, Egypt', '1960-6-6', 5);

INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate, school_id)
VALUES(12, 'Zenat', 'Sedky', 'zenat@gmail.com', 'female', '12 Dokki st, Dokki, Cairo, Egypt', '1990-2-3',2);

INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate)
VALUES(13, 'Faten', 'Hamama', 'fatenhamama@gmail.com', 'female', '32 Mosaddak st., Mohandseen, Cairo, Egypt', '1970-2-2');

-- **ADMIN** 
INSERT INTO Administrators (id)
VALUES (10); 
INSERT INTO Administrators (id)
VALUES (11); 
INSERT INTO Administrators (id)
VALUES (7); 
INSERT INTO Administrators (id)
VALUES (13); 

-- **TEACHERS** 
INSERT INTO Teachers (id)
VALUES(1); 
INSERT INTO Teachers (id)
VALUES(2); 
INSERT INTO Teachers (id)
VALUES(3); 
INSERT INTO Teachers (id)
VALUES(4); 
INSERT INTO Teachers (id)
VALUES(5); 
INSERT INTO Teachers (id)
VALUES(6); 
INSERT INTO Teachers (id)
VALUES(8);
INSERT INTO Teachers (id)
VALUES(9); 
INSERT INTO Teachers (id)
VALUES(12); 


-- **SUPERVISORS** 
INSERT INTO Teachers_Supervising_Teachers(supervisor_id, teacher_id)
VALUES(3, 4);

-- **PARENTS**

INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (1, 'ahmed.aly','Ahmed', 'Aly', 'ahmed.aly@gmail.com', 'building 22 - Nile St.- Cairo', '02-2544234');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (2, 'mohamed.Malek', 'Mohamed', 'Malek', 'mohamed.malek12@gmail.com', 'building 12-horreya St-Nasr City-Cairo', '02-12345678');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (3, 'rania.ramy','Rania', 'Ramy', 'ranya.ramy52@gmail.com', 'building 43 - Khalid Ibn Elwaleed St.- Tagamoa - Cairo', '02-32467425');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (4, 'hosny.gserha','Hosny', 'Gesrha', 'hosny.gesrha19970@gmail.com', 'building 31 - Galaa St.- Giza', '02-54309954');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (5,'amr.tawfik', 'Amr', 'Tawfik', 'amr.tawfik26@gmail.com', 'building 50 - AbouBakr ElSeddek St.- Rehab City - Cairo', '02-23457532');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (6, 'khalid.hassan','Khalid', 'Hassan', 'khalid.hassan20@gmail.com', 'building 23 - Ramsees St.- Cairo', '02-25761274');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (7, 'mahmoud.radwan','Mahmoud', 'Radwan', 'mahmoud.radwan34@yahoo.com', 'building 22 - Salah Salem St.- Nasr City - Cairo', '02-25432156');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (8, 'omar.salman', 'Omar','Salman', 'omar.salman29@yahoo.com', 'building 22 - Abbas El-Akkad St.- Nasr City - Cairo', '02-287542097');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (9, 'hanaa.samir', 'Hanaa', 'Samir', 'hanaa.samir7@yahoo.com', 'building 54 - Tawfik Elhakeem St.- Rehab City - Cairo', '02-23456526');
INSERT INTO Parents (id,username, first_name, last_name, email, address, home_phone)
VALUES (10, 'hossam.helmy', 'Hossam', 'Helmy', 'hossam.helmy5@yahoo.com', 'building 22 - Makram Ebeid St.- Nasr City - Cairo', '02-2346656');

-- **MOBILE OF PARENT**

INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (1,'012345678910');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (2,'0122481786');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (2,'01000232386');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (4,'01113310987');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (5,'01034437668');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (3,'012345678234');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (6,'01034437633');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (7,'01173312345');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (8,'012345678542');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (9,'01034437822');
INSERT INTO Mobile_Of_Parent(parent_id, mobile)
VALUES (10,'01173312987');

-- **STUDENTS**

-- ibn 1
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(123945,'Zyiad', 'Aly','male','2009-1-15','elementary');
 -- ibn 1 brdo
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(323587, 'Iyad', 'Aly', 'male', '2002-4-14', 'middle');
-- bnt 2 w 9
-- music club
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level, school_id, username, password, id)
VALUES(424875, 'Nour', 'Malek', 'female', '2000-3-15', 'high', 5, 'Nour.Malek1', 'Ns123456@' ,1); 
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
VALUES(4309120, 'Ramy', 'Malek', 'male', '2004-12-12', 'middle', 4, 'Ramy.Malek1', 'Rs9871235', 1);
-- ibn 10 
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(6661239, 'Mohab', 'Helmy', 'male', '2006-2-26', 'elementary');
-- bnt 10 brdo
INSERT INTO Students(ssn, first_name, last_name, gender, birthdate, level)
VALUES(5532006, 'Haneen', 'Helmy', 'female', '2002-8-22', 'middle');

-- **PARENT OF STUDENT**

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

-- **SCHOOL APPLY STUDENT**

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

-- **PARENT REVIEW SCHOOL**

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

-- **CLUB MEMBER STUDENT**

INSERT INTO Club_Member_Student(student_ssn, school_id, club_name)
VALUES(5339261, 1, 'IEEE');
INSERT INTO Club_Member_Student(student_ssn, school_id, club_name)
VALUES(5339261, 1, 'Art Club');
INSERT INTO Club_Member_Student(student_ssn, school_id, club_name)
VALUES(424875,5,'Music Club');

-- **ACTIVITIES**

INSERT INTO Activities(name, school_id, activity_datetime, location, equipment, description, type, admin_id, teacher_id)
VALUES('Camping in Dahab',2,'2017-01-15 07:00','Dahab','personal stuff, blanket, compass', 'you are welcome to enjoy many camping activities in Dahab including snorkleling and Safari trips', 'Camp', 10, 3);
INSERT INTO Activities(name, school_id, activity_datetime, location, equipment, description, type, admin_id, teacher_id)
VALUES('Cycling Race', 5, '2016-12-12 17:00', 'ElGouna', 'Bicycle and Helmet', 'our students can participate in Cycling race, prizes will be offered to winners','Cycling Race',11,6);

-- **STUDENT JOIN ACTIVITY**

INSERT INTO Activities_JoinedBy_Students(student_ssn, activity_name, school_id)
VALUES(5339261, 'Camping in Dahab', 2);


-- **COURSES TAUGHT TO STUDENTS BY TEACHERS**

INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn, teacher_id)
VALUES(1107,424875,6);
INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn)
VALUES(1103,424875);
INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn)
VALUES(1106,424875);

INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn, teacher_id)
VALUES(301,5339261,12);
INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn)
VALUES(303,5339261);
INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn)
VALUES(305,5339261);

INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn, teacher_id)
VALUES(701,4309120,5);
INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn)
VALUES(706,4309120);
INSERT INTO Courses_TaughtTo_Students_By_Teachers(course_code, student_ssn)
VALUES(707,4309120);

-- **ASSIGNMENTS**

INSERT INTO Assignments(assignment_number, course_code, school_id, post_date, due_date, content, teacher_id)
VALUES(2, 1107, 5, '2016-10-30', '2016-11-12', 'http://dar-eltarbiah-national-school.edu.eg/download1107assignment2', 6);
INSERT INTO Assignments(assignment_number, course_code, school_id, post_date, due_date, content, teacher_id)
VALUES(1, 301, 2, '2016-10-15', '2016-11-1', 'http://al-bashaer-school.edu.eg/download301assignment1', 12);
INSERT INTO Assignments(assignment_number, course_code, school_id, post_date, due_date, content, teacher_id)
VALUES(3, 701, 4, '2016-11-18', '2016-11-30', 'http://narmer-american-college.edu.eg/download701assignment3', 5);

-- **SOLUTIONS**

INSERT INTO Solutions(student_ssn, assignment_number, course_code, school_id, solution)
VALUES(424875, 2, 1107, 5, 'assignment2-1107-nour-malek-4248.rar');
INSERT INTO Solutions(student_ssn, assignment_number, course_code, school_id, solution)
VALUES(5339261, 1, 301, 2, 'assignment1-301-shaghaf-tawfik-5339.zip');
INSERT INTO Solutions(student_ssn, assignment_number, course_code, school_id, solution)
VALUES(4309120, 3, 701, 4, 'assignment3-701-ramy-malek-4309.rar');

-- **GRADES**

INSERT INTO Teachers_Grade_Solutions(student_ssn, assignment_number, course_code, school_id, teacher_id, grade)
VALUES(424875, 2, 1107, 5, 6, 80);
INSERT INTO Teachers_Grade_Solutions(student_ssn, assignment_number, course_code, school_id, teacher_id, grade)
VALUES(5339261, 1, 301, 2, 12, 99);

 -- **ANNOUNCEMTNS** 

INSERT INTO Announcements(title, announcement_date, type, description, admin_id, school_id)
VALUES('Upcoming trip!', '2016-11-17', 'trip', 'We will be organizing a trip to the Giza Zoo next Friday.', 10, 1); 

INSERT INTO Announcements(title, announcement_date, type, description, admin_id, school_id)
VALUES('Day off.', '2016-11-20', 'news', 'Tomorrow and the day after are days off.', 10, 1); 

INSERT INTO Announcements(title, announcement_date, type, description, admin_id, school_id)
VALUES('Concert', '2016-10-1', 'activities', 'The school band will play a concert next week.', 11, 5); 

INSERT INTO Announcements(title, announcement_date, type, description, admin_id, school_id)
VALUES('Trip', '2016-11-20', 'trip', 'Trip to the nationl museum of Arts next week.', 11, 5);

INSERT INTO Announcements(title, announcement_date, type, description, admin_id, school_id)
VALUES('Competition', '2016-05-06', 'competition', 'Our school will be holding a poeetry contest next year. Sign up online.', 7, 6);

INSERT INTO Announcements(title, announcement_date, type, description, admin_id, school_id)
VALUES('Day off.', '2016-11-23', 'news', 'The first three days of the next week will be off.', 7,6);

INSERT INTO Announcements(title, announcement_date, type, description, admin_id, school_id)
VALUES('Football league', '2016-09-05', 'sport', 'Start of the football league this month.', 7, 6); 

-- **PARENT RATE TEACHER**

INSERT INTO Parents_Rate_Teachers(parent_id, teacher_id, rating)
VALUES(2, 6, 6);
INSERT INTO Parents_Rate_Teachers(parent_id, teacher_id, rating)
VALUES(9, 6, 8);
INSERT INTO Parents_Rate_Teachers(parent_id, teacher_id, rating)
VALUES(5, 12, 9);
INSERT INTO Parents_Rate_Teachers(parent_id, teacher_id, rating)
VALUES(9, 5, 8);

-- **QUESTIONS**

INSERT INTO Questions(q_id, student_ssn, course_code, content)
VALUES(1, 424875, 1107, 'what is the definition of specific heat capacity?');
INSERT INTO Questions(q_id, student_ssn, course_code, content)
VALUES(1, 4309120, 701, 'What will be included in the next quiz?');

-- **ANSWERS**

INSERT INTO Answers(answer_sub_id, q_id, course_code, teacher_id, answer)
VALUES(1,1,1107, 6, 'The energy required to raise the temperature of 1 Kg of the material 1°C');
INSERT INTO Answers(answer_sub_id, q_id, course_code, teacher_id, answer)
VALUES(1,1,701, 5, 'The first three chapters');
































































































































































