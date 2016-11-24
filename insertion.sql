-- -- DECLARE school INT;
-- INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- VALUES ('Manor House International School', '67 Hussein Ahmed Rashad, Ad Doqi, Giza Governorate', 'Manor House American School thrives to provide a holistic learning experience that provides individuals the opportunity to learn and discover who they are in a culturally attuned environment that fosters pride in one’s identity. We instill the basic foundation of respect for the other.', 'Manor House American School is a learning institution that provides the opportunity for self discovery. The premise of “Know Thy Self” is our main belief.', 'English', 'Both American and IGCSE sections.', 30000, 'International', 'manorhouse@schools.com');
 
-- -- SET @school = (LAST_INSERT_ID());  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 33');
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 34'); 
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 36');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20 26 17 21 37');  
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');

-- INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- VALUES ('Al Bashaer', ' Zahraa Al Maadi, El-Basatin Sharkeya, Al Maadi, Cairo Governorate', 'To build a generation who :\nBelieves in God and obeying Him lovingly and choosingly .\nUpdated with the latest scientific developments and technology. \n Well exposed to the entire world and well – rounded enough to cope with people from different cultures and backgrounds. \n Loving nature and proactively interacting with  surroundings.', 'To remain as one of the most prominent, moderate Islamic schools in Egypt. (current mission).\nCompete at the global level from the educational perspective. (within 3 years).\nExpansion and transfer of expertise, opening new schools in other Islamic or non Islamic countries (within 10 years).\nEstablishing a university or institutes, having the same mission, in the future (within the coming 10 years).', 'English', 'Al Bashaer Schools,  were founded in 1994, and cover five educational levels starting from Preschool & Kindergarten up to Secondary.', 200000, 'International', 'albashaer@schools.com'); 
-- SET @school_id = LAST_INSERT_ID(); 
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+201011108241');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+201000024687');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+2-029706625-6');  
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');


-- INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- VALUES ('Futures Languages Schools', 'El Meerag City, Ring Road, Near Carrefour Maadi, Cairo.', 'We are set to create a unique educational and cultural model that contributes to narrowing Egypt’s chronic growth gap through raising a critical mass of our graduates.', 'Futures Educational Systems (FES) was initiated with a mission to help enhance quality and equity of education in Egypt by establishing an educational model that would be replicable.', 'English', 'Commencing in 1993, Futures Language Schools (FLS) are now the largest chain of private schools in Egypt.', 70000, 'National', 'info@futuresnet.net'); 
-- SET @school_id = LAST_INSERT_ID(); 
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '(202) 2520 4592');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '(202) 2520 4596');  

-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');

-- INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- VALUES ('Narmer American College in Egypt', '20 El-Narguis Service Area El Tagamoa–El Khames, New Cairo City, Cairo, Egypt', 'Narmer American College has as its primary mission the education and development of the whole student-mind, body and spirit. The students will be equipped to assume positions of leadership with an understanding of technology and its impact on the global community. Students will be able to cooperate in a diverse multicultural community.', '', 'English', 'The school was founded in the year 2000 by Mr. Mohamed El Rashidy, an educator with an experience of 50 years in Education.  The school campus has outstanding facilities. Our Faculty members are highly experienced and qualified professional educators. ', 10000, 'International', 'info@nacegypt.com' ); 
-- SET @school_id = LAST_INSERT_ID(); 
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20(2) 2920-1200');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '+20(2) 2920-1990');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '0124801000'); 
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');


-- INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- VALUES ('Dar El Tarbiah National School', '12 Mahmoud Azmy Str.,Zamalek – Cairo – Egypt., Zamalek, Giza Governorate', 'A set of basic skills – linguistic, mathematical, scientific, artistic, physical and social. \nAn inquiring and discriminating mind and a desire for knowledge.\nStrong self esteem and high personal expectations.\nTolerance and respect for others. \nA very remarkable and outstanding standard of education needed to assist them in becoming future global citizens empowered to face all the challenges of the 21st century.', 's to enable all students to become life-long learners through providing them with the essential knowledge, skills and tools to become productive, responsible citizen in our fast growing world. We are committed to provide educational excellence for all.', 'English', 'Dar El Tarbiah Schools is an Egyptian educational institution founded in 1958 by Dr. Nawal El Degwi. Dar El Tarbiah was the first English-language instruction medium institution founded by Egyptians.',14000, 'National', 'national.bh@dareltarbiah.edu.eg'); 
-- SET @school_id = LAST_INSERT_ID(); 
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27368145');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27384152');  
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');


-- INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- VALUES ('Dar El Tarbiah IGCSE School', '24 Ismail Mohamed St., Zamalek  – Cairo- Egypt', 'A set of basic skills – linguistic, mathematical, scientific, artistic, physical and social. \nAn inquiring and discriminating mind and a desire for knowledge.\nStrong self esteem and high personal expectations.\nTolerance and respect for others. \nA very remarkable and outstanding standard of education needed to assist them in becoming future global citizens empowered to face all the challenges of the 21st century.', 's to enable all students to become life-long learners through providing them with the essential knowledge, skills and tools to become productive, responsible citizen in our fast growing world. We are committed to provide educational excellence for all.', 'English', 'Dar El Tarbiah Schools is an Egyptian educational institution founded in 1958 by Dr. Nawal El Degwi. Dar El Tarbiah was the first English-language instruction medium institution founded by Egyptians.',24000, 'International', 'ig.agouza@dareltarbiah.edu.eg'); 
-- SET @school_id = LAST_INSERT_ID(); 
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '33443231');  
-- -- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '33443231');  
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'middle');
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'high');

-- INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- VALUES ('Dar El Tarbiah American High School', '24 Ismail Mohamed St., Zamalek  – Cairo- Egypt', 'A set of basic skills – linguistic, mathematical, scientific, artistic, physical and social. \nAn inquiring and discriminating mind and a desire for knowledge.\nStrong self esteem and high personal expectations.\nTolerance and respect for others. \nA very remarkable and outstanding standard of education needed to assist them in becoming future global citizens empowered to face all the challenges of the 21st century.', 's to enable all students to become life-long learners through providing them with the essential knowledge, skills and tools to become productive, responsible citizen in our fast growing world. We are committed to provide educational excellence for all.', 'English', 'Dar El Tarbiah Schools is an Egyptian educational institution founded in 1958 by Dr. Nawal El Degwi. Dar El Tarbiah was the first English-language instruction medium institution founded by Egyptians.',24000, 'International', 'american@dareltarbiah.edu.eg'); 
-- SET @last_id = LAST_INSERT_ID(); 
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27365970');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27357682');  
-- INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), '27357683');  
-- INSERT INTO Level_School (school_id, level) VALUES (LAST_INSERT_ID(), 'elementary');	


-- -- **COURSES** 

-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (101, 'Basic Arabic I', 'Basic rules of Arabic grammar', 1, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (201, 'Basic Arabic II', 'Arabic grammar and basic vocabulary for the second grade.', 2, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (301, 'Basic Arabic III', 'Arabic grammar and basic vocabulary for the second grade.', 3, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (401, 'Basic Arabic IV', 'Introduction to Arabic essay writing and literature.', 4, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (501, 'Basic Arabic V', 'Introduction to Arabic essay writing and literature', 5, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (601, 'Preparatory Arabic', 'Foundation in Arabic grammar and literature', 7, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (701, 'Advanced Arabic', 'Foundation in Arabic grammar and literature', 8, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (102, 'Basic English I', 'Basics of English language. Spelling and easy grammar', 1, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (202, 'Basic English II', 'Basics of English. Writing and reading', 2, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (402, 'Introduction to English Literature', 'Studying an easy novel to get a feeling for English literature.',4, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (1002, 'Advanced English Literature', 'Going into depth into English Literature. Studying Hamlet by William Shakespeare', 10,'high');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (303, 'Math I', 'Baic mathematical operations for primary schools.', 3, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (403, 'Math II', 'Basic algebra and geometry.', 4, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (803, 'Calculus I', 'Differentiation and integration.', 8, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (1103, 'Advanced Calculus', 'Applications of calculus and partial differentials.', 11, 'high');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (1203, 'Probability and Statistics', 'An overview of the conepts of probability and statistics.', 12, 'high');

-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (104, 'Basic French', 'Conversation in French language.', 1, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (404, 'Elementry French', 'More advanced French.', 4, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (1004, 'Advanced French', 'Essay writing in French.', 10, 'high');

-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (305, 'Science I', 'Light introduction to basic scientific concepts using games.', 3, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (405, 'Science II', 'More in-depth coverage of basics of chemisrty, physics and biology.', 4, 'elementary');

-- INSERT INTO Courses (code, name, description, grade, level)
-- VALUES (506, 'Basic Chemisrty I', 'Structure of atoms and molecules.', 5, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (606, 'Basic Chemisrty II', 'Energy levels and introduction to nuclear chemisrty', 6, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (706, 'Nuclear Chemisrty', 'Radiation and radioactivity.', 7, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (1006, 'Organic Chemisrty', '', 10, 'high');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (1106, 'Analytical Chemisrty', '', 11, 'high');

-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (507, 'Basic Physics I','', 5, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (607, 'Basic Physics II','', 6, 'elementary');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (707, 'Mechanics I', '', 7, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (807, 'Mechanics II','', 8, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (907, 'Electrical Physics', '', 9, 'middle');
-- INSERT INTO Courses (code, name, description, grade, level) 
-- VALUES (1007, 'Modren Physics', '', 10, 'high');
-- INSERT INTO Courses (code, name, description, grade, level)
-- VALUES(1107, 'Advanced Physics', '', 11, 'high'); 
-- INSERT INTO Courses (code, name, description, grade, level)
-- VALUES(1207, 'Introduction to Engineering Physics', '', 12, 'high'); 



-- -- **COURSE PREREQUISITE**

-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(101, 102); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(201, 301);
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(301, 401); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(401, 501); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(501, 601); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(601, 701); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(102, 202 ); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(303, 403); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(1103, 1203); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(305, 405); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(506, 606); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(606, 706); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(1006, 1106); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(507, 607); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(607, 707); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(707, 807); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(807, 907); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(907, 1007); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(1007, 1107); 
-- INSERT INTO Courses_Prerequisite_Courses (pre_code, code)
-- VALUES(1107, 1207); 

-- -- **SUPPLIES** 
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Scissors', 2, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Scissors', 3, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Scissors', 4, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Scissors', 4, 2);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Scissors', 3, 2);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Pencils', 5, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Pencils', 6, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Pencils', 3, 2);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Pencils', 5, 2);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Pencils', 7, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Notebooks', 2, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Notebooks', 3, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Notebooks', 4, 1);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Notebooks', 5, 2);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Notebooks', 7, 3);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Notebooks', 2, 2);
-- INSERT INTO Supplies (name, school_id, grade)
-- VALUES('Notebooks', 2, 4);

-- -- **CLUBS** 
-- INSERT INTO Clubs (name, school_id)
-- VALUES ('IEEE', 1); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('IEEE', 2); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('IEEE', 3); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Bdaya', 1); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Bdaya', 4); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Music Club', 5); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Music Club', 6); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Art Club', 1); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Art Club', 2); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Art Club', 7); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Cinema Club', 2); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Cinema Club', 3); 

-- INSERT INTO Clubs (name, school_id)
-- VALUES ('Cinema Club', 5); 


-- -- **EMPLOYEES** 

-- INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate)
-- VALUES(1, 'Hossam', 'Hassan', 'hossamhassan@gmail.com', 'male', '21, Zamalek st., Cairo, Egypt', '1967-3-11');


-- INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate)
-- VALUES(2, 'Ibrahim', 'Hassan', 'ibrahimhassan@gmail.com', 'male', '21, Zamalek st., Cairo, Egypt', '1967-3-11');

-- INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(3, 'Nelly', 'Karim', 'nellykarim@gmail.com', 'female', '34 El Horreya st. Cairo, Egypt', '1966-1-1', 1);

-- INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(4, 'Ensherah', 'Mohsen', 'missensherah@gmail.com', 'male', '12 El Baroon st. Cairo, Egypt', '1970-3-4', 1);

-- INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(5, 'Abdelmonein', 'Madbouly', 'madbouly@gmail.com', 'male', '32 El Horreya st., Nasr City, Cairo, Egypt', '1934-2-3', 4);

-- INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(6, 'Abdelsalam', 'Elnabolsy', 'abdelsalamelnaboulsy@hotmail.com', 'male', '32 El Fann st, Downtown, Cairo, Egypt', '1950-2-2',5);

-- INSERT INTO Employees (id,first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(7, 'Youssef', 'Wahby', 'yaalalhaawl@gmail.com', 'male', '25 Sudan st, El Mohandseen, Cairo, Egypt', '1980-2-2', 6);

-- INSERT INTO Employees (id,first_name, middle_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(8, 'Ramadan', 'Mabrouk', 'Aboulalamein', 'ramadanmabrouk@hotmail.com', 'male', '12 El Bohooth st, Dokki, Cairo, Egypt', '1988-2-3', 7);


-- INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(9, 'Effat', 'Abdelkereem', 'effat@gmail.com', 'female', '31 Dokki st, Dokki, Cairo, Egypt', '1987-3-3', 3);

-- INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(10, 'Abdelmo3ty', 'Abdelmo3ty', 'mo3ty@gmail.com', 'male', '11 Manial st, Manial, Cairo, Egypt', '1966-2-3', 1);

-- INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate, school_id)
-- VALUES(11, 'Elnazer', 'Salaheldeen', 'elnazer@hotmail.com', 'male', '23 Lebnan st, Cairo, Egypt', '1960-6-6', 5);

-- INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate)
-- VALUES(12, 'Zenat', 'Sedky', 'zenat@gmail.com', 'female', '12 Dokki st, Dokki, Cairo, Egypt', '1990-2-3');

-- INSERT INTO Employees (id, first_name, last_name, email, gender, address, birthdate)
-- VALUES(13, 'Faten', 'Hamama', 'fatenhamama@gmail.com', 'female', '32 Mosaddak st., Mohandseen, Cairo, Egypt', '1970-2-2');

-- -- **ADMIN** 
-- INSERT INTO Adminstrators (id)
-- VALUES (10); 
-- INSERT INTO Adminstrators (id)
-- VALUES (11); 
-- INSERT INTO Adminstrators (id)
-- VALUES (7); 
-- INSERT INTO Adminstrators (id)
-- VALUES (13); 

-- -- **TEACHERS** 
-- INSERT INTO Teachers (id)
-- VALUES(1); 
-- INSERT INTO Teachers (id)
-- VALUES(2); 
-- INSERT INTO Teachers (id)
-- VALUES(3); 
-- INSERT INTO Teachers (id)
-- VALUES(4); 
-- INSERT INTO Teachers (id)
-- VALUES(5); 
-- INSERT INTO Teachers (id)
-- VALUES(6); 
-- INSERT INTO Teachers (id)
-- VALUES(8);
-- INSERT INTO Teachers (id)
-- VALUES(9); 
-- INSERT INTO Teachers (id)
-- VALUES(12); 

-- -- **SUPERVISORS** 
-- INSERT INTO Teachers_Supervising_Teachers(supervisor_id, teacher_id)
-- VALUES(3, 4);
 
-- **ANNOUNCEMTNS** 

-- INSERT INTO Announcements(title, announcemente_date, type, description, admin_id, school_id)
-- VALUES('Upcoming trip!', '2016-11-17', 'trip', 'We will be organizing a trip to the Giza Zoo next Friday.', 10, 1); 

-- INSERT INTO Announcements(title, announcemente_date, type, description, admin_id, school_id)
-- VALUES('Day off.', '2016-11-20', 'news', 'Tomorrow and the day after are days off.', 10, 1); 

-- INSERT INTO Announcements(title, announcemente_date, type, description, admin_id, school_id)
-- VALUES('Concert', '2016-10-1', 'activities', 'The school band will play a concert next week.', 11, 5); 

-- INSERT INTO Announcements(title, announcemente_date, type, description, admin_id, school_id)
-- VALUES('Trip', '2016-10-23', 'trip', 'Trip to the nationl museum of Arts next week.', 11, 5);

-- INSERT INTO Announcements(title, announcemente_date, type, description, admin_id, school_id)
-- VALUES('');

-- INSERT INTO Announcements(title, announcemente_date, type, description, admin_id, school_id)
-- VALUES('');

-- INSERT INTO Announcements(title, announcemente_date, type, description, admin_id, school_id)
-- VALUES(''); 

