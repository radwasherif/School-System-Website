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

CREATE PROCEDURE verify_applied_student(IN student_ssn INT, IN password VARCHAR(20))
BEGIN 
	DELCARE num INT; 
	SELECT COUNT(*)
	FROM Student S1 
	INNER JOIN Student S2 ON S1.first_name = S2.first_name AND S1.last_name = S2.last_name AND S1.ssn <> S2.ssn
	WHERE S1.ssn = student_ssn; 

	DECLARE extension VARCHAR(100); 

	IF count = 0 THEN SET extension = ''; ELSE extension = count; END IF; 

	UPDATE Student S
	SET S.username = CONCAT(first_name, '.', last_name, extension)
	WHERE S.ssn = student_ssn; 


END
DELIMITER ; 



