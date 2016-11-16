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
-- 	WHERE T.id = teacher_id and T.start_date = NULL; 
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
-- 	DECLARE last_id INT;
-- 	DECLARE ext VARCHAR(100); 
-- 	SELECT MAX(id) INTO last_id
-- 	FROM Students St INNER JOIN Schools Sc ON St.school_id = Sc.id; 

-- 	UPDATE Student S
-- 	SET S.username = CONCAT(first_name, '.', last_name, (last_id + 1))
-- 	WHERE S.ssn = student_ssn; 
-- END // 

-- CREATE PROCEDURE delete_student(IN student_ssn INT) 
-- BEGIN
-- 	UPDATE Students S 
-- 	SET S.school_id = NULL, S.username = NULL, S.password = NULL
-- 	WHERE S.ssn = student_ssn;  
-- END // 

-- CREATE PROCEDURE delete_employee(IN emp_id INT)
-- BEGIN
-- 	UPDATE Employees E
-- 	SET E.school_id = NULL, E.username = NULL, E.password = NULL;
-- END //

-- CREATE PROCEDURE edit_school_name (IN admin_id INT, IN new_name VARCHAR(30))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.name = new_name
-- 	WHERE S.id = school_id; 
-- END //

-- CREATE PROCEDURE edit_school_address(IN admin_id INT, IN new_address VARCHAR(100))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S 
-- 	SET S.address = new_address
-- 	WHERE S.id = school_id; 
-- END //


-- CREATE PROCEDURE edit_school_vision (IN admin_id INT, IN new_vision VARCHAR(120))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.vision = new_vision
-- 	WHERE S.id = school_id; 
-- END //


-- CREATE PROCEDURE edit_school_mission (IN admin_id INT, IN new_mission VARCHAR(120))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.mission = new_mission
-- 	WHERE S.id = school_id; 
-- END //


-- CREATE PROCEDURE edit_school_language (IN admin_id INT, IN new_language VARCHAR(20))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.language = new_language
-- 	WHERE S.id = school_id; 
-- END //


-- CREATE PROCEDURE edit_school_general_info (IN admin_id INT, IN new_general_info VARCHAR(120))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.name = new_name
-- 	WHERE S.id = school_id; 
-- END //


-- CREATE PROCEDURE edit_school_fees (IN admin_id INT, IN new_fees INT)
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.fees = new_fees
-- 	WHERE S.id = school_id; 
-- END //


-- CREATE PROCEDURE edit_school_type (IN admin_id INT, IN new_type VARCHAR(20))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.type = new_type
-- 	WHERE S.id = school_id; 
-- END //


-- CREATE PROCEDURE edit_school_email (IN admin_id INT, IN new_email VARCHAR(50))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 

-- 	UPDATE Schools S
-- 	SET S.email = new_email
-- 	WHERE S.id = school_id; 
-- END //



-- CREATE PROCEDURE admin_post_announcement(IN title VARCHAR(50), IN announcement_date DATE, IN type VARCHAR(50), 
-- 	IN descriptoin VARCHAR(500), IN admin_id INT)
-- BEGIN
-- 	INSERT INTO Announcements (title, announcement_date, type, descriptoin, admin_id) 
-- 	VALUES (title, announcement_date, type, descriptoin, admin_id); 
-- END //


-- CREATE PROCEDURE admin_create_activity( IN ativity_datetime DATETIME, location VARCHAR(100),equipment VARCHAR(100),
-- description VARCHAR(500), type VARCHAR(40), admin_id INT, teacher_id INT)
-- BEGIN
-- 	IF EXISTS (SELECT * FROM Employees E1 INNER JOIN Employees E2 ON E1.school_id = E2.school_id WHERE E1.id = admin_id AND E2.teacher_id) THEN 
-- 	INSERT INTO Acitivities (activity_datetime, location, equipment, descriptoin, type, admin_id, teacher_id) 
-- 	VALUES (activity_datetime, location, equipment, descriptoin, type, admin_id, teacher_id); 
-- 	END IF; 
-- END //

-- CREATE PROCEDURE change_activity_teacher(IN activity_datetime DATETIME, location VARCHAR(100), new_teacher_id INT, admin_id INT)
-- BEGIN
-- 	IF EXISTS (SELECT * FROM Employees E1 INNER JOIN Employees E2 ON E1.school_id = E2.school_id WHERE E1.id = admin_id AND E2.teacher_id) THEN 
-- 	UPDATE Activities A 
-- 	SET A.teacher_id = new_teacher_id
-- 	WHERE A.activity_datetime = activity_datetime AND A.location = location;
-- 	END IF; 
-- END //

-- CREATE PROCEDURE admin_accept_application(IN admin_id INT, student_ssn INT, password_in VARCHAR(30))
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	SET school_id = get_admin_school(admin_id); 
-- 	IF EXISTS (SELECT School_Apply_Student S WHERE S.school_id = school_id AND S.student_ssn = student_ssn)
-- 	THEN CALL verify_applied_student(student_ssn, password); 
-- 	END IF; 

-- 	DELETE FROM School_Apply_Student USING S AS School_Apply_Student
-- 	WHERE S.school_id = school_id AND S.student_ssn = student_ssn; 
-- END  //



-- CREATE PROCEDURE get_admin_school(IN admin_id INT, OUT school_id INT)
-- 	SELECT E.school_id INTO school_id
-- 	FROM Administrators A INNER JOIN Employees E ON E.id = A.id; 
-- //


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


DELIMITER ; 



