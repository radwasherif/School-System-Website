DELIMITER //

-- -- *** SYSTEM ADMIN USER STORY*** 

-- CREATE PROCEDURE create_school (IN name VARCHAR(30), IN address VARCHAR(100), IN phone VARCHAR(15),IN  mission VARCHAR(120), IN vision VARCHAR(120), IN language VARCHAR(20), IN general_info VARCHAR(120), IN fees INT, IN type VARCHAR(20), IN email VARCHAR(50)) DETERMINISTIC 
-- BEGIN 
-- 	INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
-- 	 VALUES (name, address, mission, vision, language, general_info, fees, type, email); 
-- 	 -- SET @school_id = LAST_INSERT_ID(); 
-- 	INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), phone); 
-- END //

-- CREATE PROCEDURE add_school_level(IN school_id INT, level VARCHAR(15))
-- BEGIN
-- 	INSERT INTO Level_School (school_id, level) VALUES (school_id, level); 
-- END //

-- CREATE PROCEDURE add_school_phone(IN school_id INT, phone VARCHAR(15))
-- 	INSERT INTO Phone_School(school_id, phone) VALUES (school_id, phone); 
-- //

-- CREATE PROCEDURE create_course(IN code int, IN name varchar(50), IN description varchar(250), IN grade int, IN level VARCHAR(20)) DETERMINISTIC
-- BEGIN
-- 	INSERT INTO Courses (code, name, description, grade, level) VALUES (code, name, description, grade, level);

-- END //

-- CREATE PROCEDURE add_course_prerequisite(IN pre_code INT, code INT)
-- BEGIN
-- 	INSERT INTO Course_Prerequisite_Course (pre_code, code) 
-- 	VALUES (pre_code, code); 
-- END //


-- CREATE PROCEDURE create_admin (IN first_name VARCHAR(20), IN middle_name VARCHAR(20), IN last_name VARCHAR(20), IN username VARCHAR(20), IN password VARCHAR(20), IN email VARCHAR(50), IN gender VARCHAR(10), IN address VARCHAR(40), IN birthdate DATE)
-- BEGIN
-- 	INSERT INTO Employees (first_name, middle_name, last_name, username, password, email, gender, address, birthdate) VALUES  
-- 	(first_name, middle_name, last_name, username, password, email, gender, address, birthdate);
-- 	SET @emp_id = LAST_INSERT_ID(); 
-- 	INSERT INTO Administrators (id) VALUES (emp_id); 
-- END //

-- CREATE PROCEDURE add_admin_to_school (IN admin_id INT, IN school_name VARCHAR(30)) 
-- BEGIN
-- 	DECLARE admin_salary , school_id INT;
-- 	DECLARE school_type VARCHAR(20); 
	
-- 	SELECT type, id INTO school_type, school_id
-- 	FROM Schools 
-- 	WHERE name = school_name; 
-- 	IF school_type = 'national' THEN SET admin_salary = 3000; ELSE SET admin_salary = 5000; END IF; 
	
-- 	UPDATE Employees E
-- 	SET E.school_id = school_id, E.salary = admin_salary
-- 	WHERE E.id = admin_id; 

-- END //

-- CREATE PROCEDURE delete_school (IN school_id INT) 
-- BEGIN 
-- 	UPDATE Employees E 
-- 	SET E.username = NULL, E.password = NULL 
-- 	WHERE E.school_id = school_id; 

-- 	UPDATE Students S
-- 	SET S.username = NULL, S.password = NULL 
-- 	WHERE S.school_id = school_id; 

-- 	DELETE FROM Schools WHERE id = school_id; 
-- END //

-- -- ***SYSTEM USER*** 

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

-- CREATE PROCEDURE view_school_by_level()
-- BEGIN
-- 	SELECT S.* , L.level
-- 	FROM Schools S 
-- 	INNER JOIN Level_School L ON L.school_id = S.id
-- 	GROUP BY L.level; 
-- END //

-- -- ***SCHOOL ADMIN USER STORY***

-- CREATE PROCEDURE view_applied_teacher (IN admin_id INT) -- needs revision. how do we view applied teachers
--   BEGIN 
--   		SELECT * 
--   		FROM Employees E1, Employees E2 
--   		INNER JOIN Teachers T ON E1.id = T.id 
--   		INNER JOIN Administrators A ON E2.id = A.id  
--   		WHERE E.username = NULL AND E.password = NULL AND E1.school_id = E2.school_id; 
--   END //

-- CREATE PROCEDURE verify_applied_teacher(IN teacher_id INT, IN password_in VARCHAR(20)) -- needs revision. how to view applied teachers
-- BEGIN
-- 	DECLARE experience_years INT; 
-- 	UPDATE Teachers T 
-- 	SET T.start_date = CURDATE()
-- 	WHERE T.id = teacher_id AND T.start_date = NULL; 

-- 	SELECT T.exp_years INTO experience_years 
-- 	FROM Teachers T WHERE T.id = teacher_id; 

-- 	UPDATE Employees E 
-- 	SET E.username = CONCAT (E.first_name,'.', E.last_name, E.id), E.password = password_in, E.salary = 500*experience_years
-- 	WHERE E.id = teacher_id; 

-- END	//
  
--   CREATE PROCEDURE view_applied_students (IN admin_id INT) 
--   BEGIN
--   		DECLARE school_id INT; 
--   		CALL get_admin_school(admin_id, school_id); 

--   		SELECT S.ssn, S.first_name, S.last_name, S.birthdate, S.gender, S.age
--   		FROM Students S 
--   		INNER JOIN School_Apply_Student A ON  A.student_ssn = S.ssn 
--   		WHERE A.school_id = school_id; 
--   END //


-- CREATE PROCEDURE verify_applied_student(IN admin_id INT, student_ssn INT, IN password VARCHAR(20))
-- BEGIN 
-- 	DECLARE last_id, school_id INT;
-- 	DECLARE ext VARCHAR(100); 
-- 	CALL get_admin_school(admin_id, school_id); 
-- 	IF EXISTS (SELECT * FROM  School_Apply_Student SAP WHERE SAP.student_ssn = student_ssn AND SAP.school_id = school_id) 
-- 	THEN BEGIN
-- 	SELECT MAX(id) INTO last_id
-- 	FROM Students St INNER JOIN Schools Sc ON St.school_id = Sc.id; 

-- 	UPDATE Student S
-- 	SET S.username = CONCAT(first_name, '.', last_name, (last_id + 1)), S.id = (last_id + 1)
-- 	WHERE S.ssn = student_ssn AND S.school_id = school_id; 

-- 	END; 
-- 	END IF; 
-- END // 



-- CREATE PROCEDURE delete_student(IN admin_id INT, student_ssn INT) 
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 
-- 	UPDATE Students S 
-- 	SET S.school_id = NULL, S.username = NULL, S.password = NULL
-- 	WHERE S.ssn = student_ssn AND S.school_id = school_id;  
-- END // 

-- CREATE PROCEDURE delete_employee(IN admin_id INT, emp_id INT)
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 
-- 	UPDATE Employees E
-- 	SET E.school_id = NULL, E.username = NULL, E.password = NULL
-- 	WHERE E.id = emp_id AND E.school_id = school_id; 
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
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 
-- 	INSERT INTO Announcements (title, announcement_date, type, descriptoin, admin_id, school_id) 
-- 	VALUES (title, announcement_date, type, descriptoin, admin_id, school_id); 
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
-- 	CALL get_admin_school(admin_id, school_id); 
-- 	IF EXISTS (SELECT School_Apply_Student S WHERE S.school_id = school_id AND S.student_ssn = student_ssn AND S.status = 'pending')
-- 		THEN 
-- 		BEGIN 
-- 		UPDATE School_Apply_Student S
-- 		SET S.status = 'accepted' 
-- 		WHERE S.student_ssn = student_ssn AND S.school_id = school_id; 
-- 		END;
-- 	END IF; 
-- END  //

-- CREATE PROCEDURE admin_reject_application (IN admin_id INT, student_ssn INT) 
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 
-- 	IF EXISTS (SELECT School_Apply_Student S WHERE S.school_id = school_id AND S.student_ssn = student_ssn AND S.status = 'pending')
-- 		THEN 
-- 		BEGIN 
-- 		UPDATE School_Apply_Student S
-- 		SET S.status = 'rejected'
-- 		WHERE S.student_ssn = student_ssn AND S.school_id = school_id; 
-- 		END;
-- 	END IF;
-- END //

-- CREATE PROCEDURE admin_assign_supervisor(IN admin_id INT, IN supervisor_id INT, IN teacher_id INT) 
-- BEGIN
-- 	DECLARE school_id INT; 
-- 	CALL get_admin_school(admin_id, school_id); 
-- 	IF EXISTS (SELECT * FROM Employees E WHERE E.id = supervisor_id AND E.school_id = admin_school_id)
-- 		THEN IF EXISTS (SELECT * FROM Employees E WHERE E.id = teacher_id AND E.school_id = admin_school_id)
-- 		 	THEN INSERT INTO Teachers_Supervising_Teachers (supervisor_id, teacher_id) VALUES (supervisor_id, teacher_id); END IF; 
-- 	END IF; 
-- END //


-- CREATE PROCEDURE get_admin_school(IN admin_id INT, OUT school_id INT)
-- 	SELECT E.school_id INTO school_id
-- 	FROM Administrators A INNER JOIN Employees E ON E.id = A.id; 
-- //



DELIMITER ; 



