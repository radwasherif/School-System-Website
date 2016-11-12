DELIMITER //

CREATE PROCEDURE Create_School(IN name VARCHAR(30), IN address VARCHAR(100), IN phone VARCHAR(15),IN  mission VARCHAR(120), IN vision VARCHAR(120), IN language VARCHAR(20), IN general_info VARCHAR(120), IN fees INT, IN type VARCHAR(20), IN min_grade INT, IN max_grade INT, IN email VARCHAR(50)) DETERMINISTIC 
BEGIN 
	INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, min_grade, max_grade, email)
	 VALUES (name, address, mission, vision, language, general_info, fees, type, min_grade, max_grade, email); 
	 SET @school_id = LAST_INSERT_ID(); 
	INSERT INTO Phone_School (school_id, phone) VALUES (school_id, phone); 
END //


CREATE PROCEDURE Create_Course(IN code int, IN name varchar(50), IN description varchar(250), IN grade int, IN level VARCHAR(20)) DETERMINISTIC
BEGIN
	INSERT INTO Courses (coude, name, description, grade, level) VALUES (code, name, description, grade, level);

END //

CREATE PROCEDURE Create_Admin (IN first_name VARCHAR(20), IN middle_name VARCHAR(20), IN last_name VARCHAR(20), IN username VARCHAR(20), IN password VARCHAR(20), IN email VARCHAR(50), IN gender VARCHAR(10), IN address VARCHAR(40), IN birthdate DATE)
BEGIN
	INSERT INTO Employees (first_name, middle_name, last_name, username, password, email, gender, address, birthdate) VALUES  
	(first_name, middle_name, last_name, username, password, email, gender, address, birthdate);
	SET @emp_id = LAST_INSERT_ID(); 
	INSERT INTO Administrators (id) VALUES (emp_id); 
END //

CREATE PROCEDURE Add_Admin_To_School (IN admin_id INT, IN school_id INT) 
BEGIN
	DECLARE admin_salary INT, type VARCHAR(20); 
	
	SELECT type = S.type 
	FROM Schools 
	WHERE S.id = school_id; 

	IF type == 'national' THEN admin_salary = 3000; ELSE admin_salary = 5000; ENDIF; 

	UPDATE Employees E
	SET E.school_id = school_id, E.salary = admin_salary
	WHERE E.id = admin_id; 
END //

CREATE PROCEDURE Delete_School (IN school_id INT) 
BEGIN 
	UPDATE Employees E 
	SET E.school_id = NULL 
	WHERE E.school_id = school_id; 

	UPDATE Students S
	SET S.school_id = NULL 
	WHERE S.school_id = school_id; 

	DELETE FROM Schools WHERE id = school_id; 
END //

DELIMITER ; 



