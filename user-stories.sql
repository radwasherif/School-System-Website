DELIMITER //

-- CREATE PROCEDURE Create_School(IN name VARCHAR(30), IN address VARCHAR(100), IN phone VARCHAR(15),IN  mission VARCHAR(120), IN vision VARCHAR(120), IN language VARCHAR(20), IN general_info VARCHAR(120), IN fees INT, IN type VARCHAR(20), IN min_grade INT, IN max_grade INT, IN email VARCHAR(50)) DETERMINISTIC 
-- BEGIN 
-- 	INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, min_grade, max_grade, email)
-- 	 VALUES (name, address, mission, vision, language, general_info, fees, type, min_grade, max_grade, email); 
-- 	 SET @school_id = LAST_INSERT_ID(); 
-- 	INSERT INTO Phone_School (school_id, phone) VALUES (school_id, phone); 
-- END //


-- CREATE PROCEDURE Create_Course(IN code int, IN name varchar(50), IN description varchar(250), IN grade int, IN level VARCHAR(20)) DETERMINISTIC
-- BEGIN
-- 	INSERT INTO Courses (coude, name, description, grade, level) VALUES (code, name, description, grade, level);

-- END //

-- CREATE PROCEDURE Create_Admin (IN first_name VARCHAR(20), IN middle_name VARCHAR(20), IN last_name VARCHAR(20), IN username VARCHAR(20), IN password VARCHAR(20), IN email VARCHAR(50), IN gender VARCHAR(10), IN address VARCHAR(40), IN birthdate DATE)
-- BEGIN
-- 	INSERT INTO Employees (first_name, middle_name, last_name, username, password, email, gender, address, birthdate) VALUES  
-- 	(first_name, middle_name, last_name, username, password, email, gender, address, birthdate);
-- 	SET @emp_id = LAST_INSERT_ID(); 
-- 	INSERT INTO Administrators (id) VALUES (emp_id); 
-- END //

-- CREATE PROCEDURE Add_Admin_To_School (IN admin_id INT, IN school INT) 
-- BEGIN
-- 	DECLARE admin_salary INT;
-- 	DECLARE type VARCHAR(20); 
	
-- 	SELECT S.type INTO type
-- 	FROM Schools S
-- 	WHERE S.id = school; 
-- 	IF type = 'national' THEN SET admin_salary = 3000; ELSE SET admin_salary = 5000; END IF; 
	
-- 	UPDATE Employees 
-- 	SET school_id = school, salary = admin_salary
-- 	WHERE E.id = admin_id; 

-- END //

-- CREATE PROCEDURE Delete_School (IN school_id INT) 
-- BEGIN 
-- 	UPDATE Employees E 
-- 	SET E.username = NULL, E.password = NULL 
-- 	WHERE E.school_id = school_id; 

-- 	UPDATE Students S
-- 	SET S.username = NULL, S.password = NULL 
-- 	WHERE S.school_id = school_id; 

-- 	DELETE FROM Schools WHERE id = school_id; 
-- END //

-- CREATE PROCEDURE search_school(IN name VARCHAR(20), IN type VARCHAR(20), IN address VARCHAR(100))
-- BEGIN
-- 	SELECT * 
-- 	FROM Schools S 
-- 	WHERE S.name = name OR S.type = type OR S.address = address; 
-- END //

-- CREATE PROCEDURE view_school_info(IN school INT) 
-- BEGIN
-- 	SELECT S.name, S.name, S.address, S.mission, S.vision, S.language, S.general_info, S.fees, S.type, S.elementary, S.middle, S.high, 
-- 	E.first_name, E.middle_name, E.last_name, R.review 
-- 	FROM School S 
-- 	INNER JOIN Parent_Review_School R ON S.id = R.school_id 
-- 	INNER JOIN Employees E ON E.school_id = S.id 
-- 	INNER JOIN Teachers T ON T.id = E.id; 

-- END //
-- CREATE PROCEDURE view_applied_teacher (IN admin_id INT) 
--   BEGIN 
--   		SELECT * 
--   		FROM Employees E1, Employees E2 
--   		INNER JOIN Teachers T ON E1.id = T.id 
--   		INNER JOIN Administrators A ON E2.id = A.id  
--   		WHERE E.username = NULL AND E.password = NULL AND E1.school_id = E2.school_id; 
--   END //

-- CREATE PROCEDURE verify_applied_teacher(IN teacher_id INT, IN password_in VARCHAR(20))
-- BEGIN
-- 	UPDATE Employees E 
-- 	SET E.username = CONCAT (E.first_name,'.', E.last_name, E.id), E.password = password_in
-- 	WHERE E.id = teacher_id; 

-- 	UPDATE Teachers T 
-- 	SET T.start_date = CURDATE()
-- 	WHERE T.id = teacher_id; 
-- END	//
  
  -- CREATE PROCEDURE view_applied_students (IN admin_id INT) 
  -- BEGIN
  -- 		DECLARE school_id INT; 
  -- 		SELECT S.id into school_id
  -- 		FROM Schools 
  -- 		INNER JOIN Employees E ON E.school_id = S.id 
  -- 		INNER JOIN Administrators A ON A.id = E.id; 

  -- 		SELECT S.ssn, S.first_name, S.last_name, S.birthdate, S.gender, S.age
  -- 		FROM Students S 
  -- 		INNER JOIN School_Apply_Student A ON  A.student_ssn = S.ssn 
  -- 		WHERE A.school_id = school_id; 
  -- END //

-- CREATE PROCEDURE verify_applied_student(IN student_ssn INT, IN password VARCHAR(20))
-- BEGIN 
-- 	DECLARE num INT; 
--     DECLARE extension VARCHAR(100); 
-- 	SELECT COUNT(*)
-- 	FROM Student S1 
-- 	INNER JOIN Student S2 ON S1.first_name = S2.first_name AND S1.last_name = S2.last_name AND S1.ssn <> S2.ssn
-- 	WHERE S1.ssn = student_ssn; 

	

-- 	IF count = 0 THEN SET extension = ''; ELSE extension = count; END IF; 

-- 	UPDATE Student S
-- 	SET S.username = CONCAT(first_name, '.', last_name, extension)
-- 	WHERE S.ssn = student_ssn; 


-- END  //

-- CREATE PROCEDURE teacher_sign_up(IN first_name VARCHAR(20), IN middle_name VARCHAR(20), IN last_name VARCHAR(20), IN birthdate DATE, IN address VARCHAR(100), IN email VARCHAR(50), IN gender VARCHAR(10))
-- BEGIN
--   INSERT INTO Employees (first_name, middle_name, last_name, birthdate, address, email, gender)
--   VALUES (first_name, middle_name, last_name, birthdate, address, email, gender);
--   SET @emp_id = LAST_INSERT_ID();
--   INSERT INTO Teachers (id) VALUES (emp_id);
-- END //


-- CREATE PROCEDURE teacher_view_courses(IN teacher_id INT)
-- BEGIN
--   SELECT C.name, C.level, C.grade
--   FROM Teachers T
--   INNER JOIN Courses_TaughtTo_Students_By_Teachers CT ON T.id = CT.teacher_id  
--   INNER JOIN Courses C  ON C.code = CT.course_code
--   WHERE T.id = teacher_id
--   GROUP BY level AND grade;

-- END //

-- CREATE PROCEDURE teacher_post_assignment(IN teacher_id INT, IN course_code INT, IN post_date DATE, IN due_date DATE, IN content VARCHAR(1000), IN assignment_number INT)
-- BEGIN
--   DECLARE school_id INT;
--   SELECT E.school_id INTO school_id
--   FROM Employees E
--   WHERE id = teacher_id;
--   INSERT INTO Assignemnts (assignment_number, course_code, school_id, post_date, due_date, content, teacher_id)
--    VALUES (assignment_number, course_code, school_id, post_date, due_date, content, teacher_id);
-- END //


-- CREATE PROCEDURE teacher_view_solutions(IN teacher_id INT)
-- BEGIN
--   SELECT SOL.assignment_number, SOL.course_code, S.id, SOL.solution
--   FROM Solutions SOL 
--   INNER JOIN Students S ON SOL.student_ssn = S.ssn
--   INNER JOIN Assignemnts A ON A.assignment_number = SOL.assignment_number AND A.course_code = SOL.course_code AND A.school_id = SOL.school_id
--   WHERE A.teacher_id = teacher_id
--   ORDER BY S.id;
-- END //

-- CREATE PROCEDURE teacher_grade_solutions(IN teacher_id INT, IN student_id INT, IN assignment_number INT, IN course_code INT, IN grade INT)
-- BEGIN
--   DECLARE school_id INT;
--   DECLARE student_ssn INT;
--   SELECT E.school_id INTO school_id
--   FROM Employees E
--   WHERE E.id = teacher_id;
 
--   SELECT S.student_ssn INTO student_ssn
--   FROM Students S 
--   WHERE S.school_id = school_id AND S.id = student_id;  

--   INSERT INTO Teachers_Grade_Solutions (student_ssn, assignment_number, course_code, school_id, grade, teacher_id) 
--   VALUES (student_ssn, assignment_number, course_code, school_id, grade, teacher_id);
-- END //

-- CREATE PROCEDURE teacher_delete_assignment(IN teacher_id INT, IN courseCode INT, IN assignment_num INT)
-- BEGIN
--   DECLARE schoolID INT;
--   SELECT E.school_id INTO schoolID
--   FROM Employees E
--   WHERE E.id = teacher_id;

--   DELETE FROM Assignments 
--   WHERE assignment_number = assignment_num AND course_code = courseCode AND school_id = schoolID;
-- END //

-- CREATE PROCEDURE teacher_write_report(IN teacher_id INT, IN student_id INT, IN report_date DATE, IN comment VARCHAR(500))
-- BEGIN
--   DECLARE school_id INT;
--   DECLARE student_ssn INT;
--   SELECT E.school_id INTO school_id
--   FROM Employees E
--   WHERE E.id = teacher_id;

--   SELECT S.student_ssn INTO student_ssn
--   FROM Students S
--   WHERE S.student_id = student_id AND S.school_id = school_id;

--   IF EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.teacher_id = teacher_id)
--   THEN 
--   INSERT INTO Reports (report_date, student_ssn, teacher_id, comment) 
--   VALUES (report_date, student_ssn, teacher_id, comment);
--   END IF;
-- END //

-- CREATE PROCEDURE teacher_view_questions(IN teacher_id INT, IN course_code INT)
-- BEGIN 
--   SELECT S.id, S.name, Q.q_id, Q.content, Q.course_code
--   FROM Questions Q INNER JOIN Students S ON Q.student_ssn = S.ssn
--   WHERE Q.course_code = course_code
--    AND EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.teacher_id = teacher_id AND CT.course_code = course_code);
-- END //

-- CREATE PROCEDURE teacher_answer_questions(IN teacher_id INT, IN course_code INT, IN q_id INT, IN answer VARCHAR(250))
-- BEGIN
--   DECLARE count INT;
--   SELECT COUNT DISTINCIT INTO count
--   FROM Answers A
--   WHERE A.course_code = course_code AND A.q_id = q_id;

--   INSERT INTO Answers (answer_sub_id, q_id, answer, teacher_id) VALUES (count + 1, q_id, answer, teacher_id);

-- END //

-- CREATE PROCEDURE teacher_view_students(IN teacher_id INT)
-- BEGIN
--   SELECT S.first_name, S.last_name, S.id, S.username, S.ssn, S.grade, S.level, S.gender, S.birthdate, S.age
--   FROM Students S
--   WHERE EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.teacher_id = teacher_id AND CT.student_ssn = S.ssn)
--   GROUP BY S.grade
--   ORDER BY S.first_name, S.last_name;
-- END //

-- CREATE PROCEDURE teacher_view_students_without_activities(IN teacher_id INT)
-- BEGIN
--   DECLARE school_id INT;
--   SELECT E.school_id INTO school_id
--   FROM Employees E
--   WHERE E.id = teacher_id;

--   SELECT S.first_name, S.last_name, S.id, S.username, S.ssn, S.grade, S.level, S.gender, S.birthdate, S.age
--   FROM Students S
--   WHERE S.school_id = school_id AND A.ssn NOT IN (SELECT A.student_ssn FROM Activities_JoinedBy_Students);
-- END //


-- not sure
-- CREATE PROCEDURE student_in_max_clubs(IN teacher_id INT)
-- BEGIN
--   DECLARE school_id INT;
--   SELECT E.school_id INTO school_id
--   FROM Employees E
--   WHERE E.id = teacher_id;
   
--   SELECT S.first_name,S.last_name
--   FROM Students S 
--   INNER JOIN 
--   (
--     SELECT C.student_ssn, COUNT (C.club_name) as count
--     FROM Club_Member_Student C
--     WHERE C.school_id = school_id
--     GROUP BY student_ssn
--     ORDER BY count DESC LIMIT 1
--   ) 
--   ON S.ssn = C.student_ssn;
--  END // 

-- CREATE PROCEDURE student_view_courses(IN student_ssn INT)
-- BEGIN
--   SELECT C.name
--   FROM Courses C INNER JOIN Courses_TaughtTo_Students_By_Teachers CT ON C.course_code = CT.course_code
--   WHERE CT.student_ssn = student_ssn
--   ORDER BY C.name;
-- END //

-- CREATE PROCEDURE student_post_question(IN student_ssn INT, IN course_code INT, IN content VARCHAR(250))
-- BEGIN
--   DECLARE q_count INT;
--   SELECT COUNT INTO q_count
--   FROM Questions Q
--   WHERE Q.course_code = course_code;

--   -- if student can only post questions in courses he take
--   IF EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.course_code = course_code)
--   THEN
--   INSERT INTO Questions (q_id, student_ssn, course_code, content) VALUES (q_count + 1, student_ssn, course_code, content);
--   END IF;
-- END //

-- CREATE PROCEDURE student_view_questions(IN student_ssn INT, IN course_code INT)
-- BEGIN
--   SELECT Q.q_id, Q.content, A.answer_sub_id, A.answer
--   FROM Questions Q INNER JOIN Answers A ON Q.q_id = A.q_id AND Q.course_code = A.course_code
--   WHERE Q.course_code = course_code
--   -- in case of only questions asked by other students
--   AND Q.student_ssn <> student_ssn;
-- END //

-- CREATE PROCEDURE student_view_assignments(IN student_ssn INT)
-- BEGIN
--   SELECT *
--   FROM Assignemnts A 
--   WHERE EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE A.course_code = CT.course_code AND CT.student_ssn = student_ssn);
-- END //

-- CREATE PROCEDURE student_solve_assignment(IN student_ssn INT, IN assignment_number INT, IN course_code INT, IN solution VARCHAR(500))
-- BEGIN
--   DECLARE school_id INT;
--   SELECT S.school_id INTO school_id
--   FROM Students S
--   WHERE S.ssn = student_ssn;
--   IF EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.course_code = course_code)
--     AND EXISTS (SELECT * FROM Assignemnts A WHERE A.course_code = course_code AND A.assignment_number = assignment_number AND A.school_id = school_id)
--   THEN 
--   INSERT INTO Solutions (student_ssn, assignment_number, course_code, school_id, solution) 
--     VALUES  (student_ssn, assignment_number, course_code, school_id, solution);
--   END IF;
-- END //

-- CREATE PROCEDURE student_view_grade(IN student_ssn INT)
-- BEGIN 
--   SELECT G.assignment_number, G.course_code, G.grade
--   FROM Teachers_Grade_Solutions G
--   WHERE G.student_ssn = student_ssn;
-- END //


-- CREATE PROCEDURE student_view_announcement(IN student_ssn INT)
-- BEGIN
--   DECLARE school_id INT;
--   SELECT S.school_id INTO school_id
--   FROM Students S
--   WHERE S.ssn = student_ssn;
--   SELECT A.title, A.announcement_date, A.type, A.description, (E.first_name, E.last_name) AS admin_name
--   FROM Announcements A INNER JOIN Employees E ON E.id = A.admin_id
--   WHERE E.school_id = school_id AND A.announcement_date >= CURDATE() - 10;

-- END //


-- CREATE PROCEDURE student_view_activities(IN student_ssn INT)
-- BEGIN
--   DECLARE school_id INT;
--   SELECT S.school_id INTO school_id
--   FROM Students S
--   WHERE S.ssn = student_ssn;

--   SELECT A.activity_datetime, A.location, A.equipment, A.description, A.type, (T.first_name, T.middle_name, T.last_name) AS teacher_name
--   FROM Activities A INNER JOIN Employees T ON A.teacher_id = T.q_id
--   WHERE T.school_id = school_id;
-- END //

--not complete .. el student el mafrood yda5al datetime w location, msh kteer shwya :"D 
-- CREATE PROCEDURE student_apply_activity(IN student_ssn INT)
-- BEGIN
  
-- END //


-- CREATE PROCEDURE student_join_club(IN student_ssn INT, IN club_name VARCHAR(20))
-- BEGIN 
--   DECLARE school_id INT;
--   DECLARE student_level VARCHAR(15);
--   SELECT S.school_id,S.level INTO school_id, student_level
--   FROM Students S
--   WHERE S.ssn = student_ssn;
--   IF(student_level = 'high')
--   THEN
--     INSERT INTO Club_Member_Student (student_ssn, school_id, club_name) VALUES (student_ssn, school_id, club_name);
--   END IF;
-- END //

-- -- I added this (not required) procedure to show all available clubs in my school, to use it with the previous procedure later
-- CREATE PROCEDURE student_view_clubs(IN student_ssn INT)
-- BEGIN
--   DECLARE school_id INT;
--   SELECT S.school_id INTO school_id
--   FROM Students S
--   WHERE S.ssn = student_ssn;
--   SELECT C.club_name
--   FROM Clubs C
--   WHERE C.school_id = school_id;
-- END //

-- CREATE PROCEDURE student_search_courses(IN student_ssn INT, IN keyword VARCHAR(50))
-- BEGIN
--   SELECT *
--   FROM Courses C
--   WHERE (C.name = keyword OR CONCAT(C.course_code,'') = keyword) 
--     AND EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.course_code = C.course_code);
-- END //

DELIMITER ; 



