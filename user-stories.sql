
DELIMITER //

-- *** SYSTEM ADMIN USER STORY*** 

CREATE PROCEDURE create_school (IN name VARCHAR(30), IN address VARCHAR(100), IN phone VARCHAR(15),IN  mission VARCHAR(120), IN vision VARCHAR(120), IN language VARCHAR(20), IN general_info VARCHAR(120), IN fees INT, IN type VARCHAR(20), IN email VARCHAR(50)) DETERMINISTIC 
BEGIN 
	INSERT INTO Schools (name, address, mission, vision, language, general_info, fees, type, email)
	 VALUES (name, address, mission, vision, language, general_info, fees, type, email); 
	 -- SET @school_id = LAST_INSERT_ID(); 
	INSERT INTO Phone_School (school_id, phone) VALUES (LAST_INSERT_ID(), phone); 
END //

CREATE PROCEDURE add_school_level(IN school_id INT, level VARCHAR(15))
BEGIN
	INSERT INTO Level_School (school_id, level) VALUES (school_id, level); 
END //

CREATE PROCEDURE add_school_phone(IN school_id INT, phone VARCHAR(15))
	INSERT INTO Phone_School(school_id, phone) VALUES (school_id, phone); 
//

CREATE PROCEDURE create_course(IN code int, IN name varchar(50), IN description varchar(250), IN grade int, IN level VARCHAR(20)) DETERMINISTIC
BEGIN
	INSERT INTO Courses (code, name, description, grade, level) VALUES (code, name, description, grade, level);

END //

CREATE PROCEDURE add_course_prerequisite(IN pre_code INT, code INT)
BEGIN
	INSERT INTO Course_Prerequisite_Course (pre_code, code) 
	VALUES (pre_code, code); 
END //


CREATE PROCEDURE create_admin (IN first_name VARCHAR(20), IN middle_name VARCHAR(20), IN last_name VARCHAR(20), IN username VARCHAR(20), IN password VARCHAR(20), IN email VARCHAR(50), IN gender VARCHAR(10), IN address VARCHAR(40), IN birthdate DATE)
BEGIN
	INSERT INTO Employees (first_name, middle_name, last_name, username, password, email, gender, address, birthdate) VALUES  
	(first_name, middle_name, last_name, username, password, email, gender, address, birthdate);
	SET @emp_id = LAST_INSERT_ID(); 
	INSERT INTO Administrators (id) VALUES (emp_id); 
END //

CREATE PROCEDURE add_admin_to_school (IN admin_id INT, IN school_name VARCHAR(30)) 
BEGIN
	DECLARE admin_salary , school_id INT;
	DECLARE school_type VARCHAR(20); 
	
	SELECT type, id INTO school_type, school_id
	FROM Schools 
	WHERE name = school_name; 
	IF school_type = 'national' THEN SET admin_salary = 3000; ELSE SET admin_salary = 5000; END IF; 
	
	UPDATE Employees E
	SET E.school_id = school_id, E.salary = admin_salary
	WHERE E.id = admin_id; 

END //

CREATE PROCEDURE delete_school (IN school_id INT) 
BEGIN 
	UPDATE Employees E 
	SET E.username = NULL, E.password = NULL 
	WHERE E.school_id = school_id; 

	UPDATE Students S
	SET S.username = NULL, S.password = NULL 
	WHERE S.school_id = school_id; 

	DELETE FROM Schools WHERE id = school_id; 
END //

-- ***SYSTEM USER*** 

CREATE PROCEDURE search_school(IN name VARCHAR(20), IN type VARCHAR(20), IN address VARCHAR(100))
BEGIN
	SELECT * 
	FROM Schools S 
	WHERE S.name = name OR S.type = type OR S.address = address; 
END //

CREATE PROCEDURE view_school_info(IN school INT) 
BEGIN
	SELECT S.name, S.name, S.address, S.mission, S.vision, S.language, S.general_info, S.fees, S.type, S.elementary, S.middle, S.high, 
	E.first_name, E.middle_name, E.last_name, R.review 
	FROM School S 
	INNER JOIN Parent_Review_School R ON S.id = R.school_id 
	INNER JOIN Employees E ON E.school_id = S.id 
	INNER JOIN Teachers T ON T.id = E.id; 

END //

CREATE PROCEDURE view_school_by_level()
BEGIN
	SELECT S.* , L.level
	FROM Schools S 
	INNER JOIN Level_School L ON L.school_id = S.id
	GROUP BY L.level; 
END //

-- ***SCHOOL ADMIN USER STORY***

CREATE PROCEDURE view_applied_teacher (IN admin_id INT) -- needs revision. how do we view applied teachers
  BEGIN 
  		SELECT * 
  		FROM Employees E1, Employees E2 
  		INNER JOIN Teachers T ON E1.id = T.id 
  		INNER JOIN Administrators A ON E2.id = A.id  
  		WHERE E.username = NULL AND E.password = NULL AND E1.school_id = E2.school_id; 
  END //

CREATE PROCEDURE verify_applied_teacher(IN teacher_id INT, IN password_in VARCHAR(20)) -- needs revision. how to view applied teachers
BEGIN
	DECLARE experience_years INT; 
	UPDATE Teachers T 
	SET T.start_date = CURDATE()
	WHERE T.id = teacher_id AND T.start_date = NULL; 

	SELECT T.exp_years INTO experience_years 
	FROM Teachers T WHERE T.id = teacher_id; 

	UPDATE Employees E 
	SET E.username = CONCAT (E.first_name,'.', E.last_name, E.id), E.password = password_in, E.salary = 500*experience_years
	WHERE E.id = teacher_id; 

END	//
  
  CREATE PROCEDURE view_applied_students (IN admin_id INT) 
  BEGIN
  		DECLARE school_id INT; 
  		CALL get_admin_school(admin_id, school_id); 

  		SELECT S.ssn, S.first_name, S.last_name, S.birthdate, S.gender, S.age
  		FROM Students S 
  		INNER JOIN School_Apply_Student A ON  A.student_ssn = S.ssn 
  		WHERE A.school_id = school_id; 
  END //


CREATE PROCEDURE verify_applied_student(IN admin_id INT, student_ssn INT, IN password VARCHAR(20))
BEGIN 
	DECLARE last_id, school_id INT;
	DECLARE ext VARCHAR(100); 
	CALL get_admin_school(admin_id, school_id); 
	IF EXISTS (SELECT * FROM  School_Apply_Student SAP WHERE SAP.student_ssn = student_ssn AND SAP.school_id = school_id) 
	THEN BEGIN
	SELECT MAX(id) INTO last_id
	FROM Students St INNER JOIN Schools Sc ON St.school_id = Sc.id; 

	UPDATE Student S
	SET S.username = CONCAT(first_name, '.', last_name, (last_id + 1)), S.id = (last_id + 1)
	WHERE S.ssn = student_ssn AND S.school_id = school_id; 

	END; 
	END IF; 
END // 



CREATE PROCEDURE delete_student(IN admin_id INT, student_ssn INT) 
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 
	UPDATE Students S 
	SET S.school_id = NULL, S.username = NULL, S.password = NULL
	WHERE S.ssn = student_ssn AND S.school_id = school_id;  
END // 

CREATE PROCEDURE delete_employee(IN admin_id INT, emp_id INT)
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 
	UPDATE Employees E
	SET E.school_id = NULL, E.username = NULL, E.password = NULL
	WHERE E.id = emp_id AND E.school_id = school_id; 
END //

CREATE PROCEDURE edit_school_name (IN admin_id INT, IN new_name VARCHAR(30))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.name = new_name
	WHERE S.id = school_id; 
END //

CREATE PROCEDURE edit_school_address(IN admin_id INT, IN new_address VARCHAR(100))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S 
	SET S.address = new_address
	WHERE S.id = school_id; 
END //


CREATE PROCEDURE edit_school_vision (IN admin_id INT, IN new_vision VARCHAR(120))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.vision = new_vision
	WHERE S.id = school_id; 
END //


CREATE PROCEDURE edit_school_mission (IN admin_id INT, IN new_mission VARCHAR(120))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.mission = new_mission
	WHERE S.id = school_id; 
END //


CREATE PROCEDURE edit_school_language (IN admin_id INT, IN new_language VARCHAR(20))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.language = new_language
	WHERE S.id = school_id; 
END //


CREATE PROCEDURE edit_school_general_info (IN admin_id INT, IN new_general_info VARCHAR(120))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.name = new_name
	WHERE S.id = school_id; 
END //


CREATE PROCEDURE edit_school_fees (IN admin_id INT, IN new_fees INT)
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.fees = new_fees
	WHERE S.id = school_id; 
END //


CREATE PROCEDURE edit_school_type (IN admin_id INT, IN new_type VARCHAR(20))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.type = new_type
	WHERE S.id = school_id; 
END //


CREATE PROCEDURE edit_school_email (IN admin_id INT, IN new_email VARCHAR(50))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 

	UPDATE Schools S
	SET S.email = new_email
	WHERE S.id = school_id; 
END //



CREATE PROCEDURE admin_post_announcement(IN title VARCHAR(50), IN announcement_date DATE, IN type VARCHAR(50), 
	IN descriptoin VARCHAR(500), IN admin_id INT)
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 
	INSERT INTO Announcements (title, announcement_date, type, descriptoin, admin_id, school_id) 
	VALUES (title, announcement_date, type, descriptoin, admin_id, school_id); 
END //


CREATE PROCEDURE admin_create_activity( IN name VARCHAR(70),IN ativity_datetime DATETIME, location VARCHAR(100),equipment VARCHAR(100),
description VARCHAR(500), type VARCHAR(40), admin_id INT, teacher_id INT)
BEGIN
  DECLARE school_id INT;
  CALL get_admin_school(admin_id, school_id);
	IF EXISTS (SELECT * FROM Employees E1 INNER JOIN Employees E2 ON E1.school_id = E2.school_id WHERE E1.id = admin_id AND E2.teacher_id) THEN 
	INSERT INTO Acitivities (name, school_id, activity_datetime, location, equipment, descriptoin, type, admin_id, teacher_id) 
	VALUES (name, school_id, activity_datetime, location, equipment, descriptoin, type, admin_id, teacher_id); 
	END IF; 
END //

CREATE PROCEDURE change_activity_teacher(IN activity_name VARCHAR(70), new_teacher_id INT, admin_id INT)
BEGIN
	IF EXISTS (SELECT * FROM Employees E1 INNER JOIN Employees E2 ON E1.school_id = E2.school_id WHERE E1.id = admin_id AND E2.teacher_id) THEN 
	UPDATE Activities A 
	SET A.teacher_id = new_teacher_id
	WHERE A.name = activity_name;
	END IF; 
END //

CREATE PROCEDURE admin_accept_application(IN admin_id INT, student_ssn INT, password_in VARCHAR(30))
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 
	IF EXISTS (SELECT School_Apply_Student S WHERE S.school_id = school_id AND S.student_ssn = student_ssn AND S.status = 'pending')
		THEN 
		BEGIN 
		UPDATE School_Apply_Student S
		SET S.status = 'accepted' 
		WHERE S.student_ssn = student_ssn AND S.school_id = school_id; 
		END;
	END IF; 
END  //

CREATE PROCEDURE admin_reject_application (IN admin_id INT, student_ssn INT) 
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 
	IF EXISTS (SELECT School_Apply_Student S WHERE S.school_id = school_id AND S.student_ssn = student_ssn AND S.status = 'pending')
		THEN 
		BEGIN 
		UPDATE School_Apply_Student S
		SET S.status = 'rejected'
		WHERE S.student_ssn = student_ssn AND S.school_id = school_id; 
		END;
	END IF;
END //

CREATE PROCEDURE admin_assign_supervisor(IN admin_id INT, IN supervisor_id INT, IN teacher_id INT) 
BEGIN
	DECLARE school_id INT; 
	CALL get_admin_school(admin_id, school_id); 
	IF EXISTS (SELECT * FROM Employees E WHERE E.id = supervisor_id AND E.school_id = admin_school_id)
		THEN IF EXISTS (SELECT * FROM Employees E WHERE E.id = teacher_id AND E.school_id = admin_school_id)
		 	THEN INSERT INTO Teachers_Supervising_Teachers (supervisor_id, teacher_id) VALUES (supervisor_id, teacher_id); END IF; 
	END IF; 
END //


CREATE PROCEDURE get_admin_school(IN admin_id INT, OUT school_id INT)
	SELECT E.school_id INTO school_id
	FROM Administrators A INNER JOIN Employees E ON E.id = A.id; 
//


-- ***PARENT USER STORY***

CREATE PROCEDURE parent_signup ( IN username VARCHAR(20), first_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(20), 
address VARCHAR(120), home_phone VARCHAR(15))
BEGIN
  INSERt INTO Parents (username, first_name, last_name, email, address, home_phone) 
  VALUES (username, first_name, last_name, email, address, home_phone); 
END //

CREATE PROCEDURE parent_add_mobile (IN parent_id INT, mobile VARCHAR(15))
BEGIN
  INSERT INTO Mobile_Of_Parent(parent_id, mobile) VALUES (parent_id, mobile);  
END //

CREATE PROCEDURE parent_apply_child(IN parent_id INT, student_ssn INT, first_name VARCHAR(20),
last_name VARCHAR(20), gender VARCHAR(10), birthdate DATE, school_id INT) 
BEGIN
  IF NOT EXISTS (SELECT * FROM Students S WHERE S.ssn = student_ssn)
  THEN 
    INSERT INTO Students (ssn, first_name, last_name, gender, birthdate)
    VALUES (student_ssn, first_name, last_name, gender, birthdate); 
  END IF; 

  INSERT INTO School_Apply_Student(school_id, student_ssn) VALUES (school_id, student_ssn); 
END //

CREATE PROCEDURE parent_view_accepted (IN parent_id INT) 
BEGIN
  SELECT Sc.name, St.first_name, St.last_name
  FROM Schools Sc 
  INNER JOIN School_Apply_Student A ON Sc.id = A.school_id
  INNER JOIN Students St ON St.ssn = A.student_ssn
  WHERE A.status = 'accepted' AND St.ssn IN (SELECT P.child_ssn FROM  Parent_Of_Student P WHERE P.parent_id = parent_id)
  GROUP BY St.first_name, St.last_name; 
END // 

CREATE PROCEDURE parent_enroll_child(IN parent_id INT, child_ssn INT, school_id INT) 
BEGIN
   IF EXISTS (SELECT * FROM Parent_Of_Student P WHERE P.parent_id = parent_id AND P.child_ssn = child_ssn)
   THEN
    UPDATE Students S
    SET S.school_id = school_id
    WHERE S.ssn = child_ssn; 
   END IF; 

END //

CREATE PROCEDURE view_children_schools (IN parent_id INT) 
BEGIN
  SELECT Sc.name, St.first_name, St.last_name
  FROM Parent_Of_Student POS 
  INNER JOIN Students St ON St.ssn = POS.child_ssn
  INNER JOIN Schools Sc ON St.school_id = Sc.id
  WHERE POS.parent_id = parent_id
  ORDER BY Sc.name; 
END //

CREATE PROCEDURE parent_view_announcement(IN parent_id INT) 
BEGIN
  SELECT Sc.name, St.first_name, St.last_name
  FROM Parent_Of_Student POS 
  INNER JOIN Students St ON St.ssn = POS.child_ssn
  INNER JOIN Avvouncment A ON A.school_id = St.school_id
  WHERE POS.parent_id = parent_id AND DAY(CURDATE() - A.announcement_date) <= 10; 
END //


CREATE PROCEDURE parent_view_report(IN parent_id INT, IN child_ssn INT)
BEGIN
  SELECT E.first_name, E.last_name, S.first_name, S.last_name, R.comment
  FROM Reports R 
  INNER JOIN Employees E ON E.id = R.teacher_id 
  INNER JOIN Parent_Of_Student P ON R.student_ssn = P.child_ssn
  INNER JOIN Students S ON S.ssn = P.child_ssn
  WHERE P.child_ssn = child_ssn AND P.parent_id = parent_id; 
END //

CREATE PROCEDURE parent_reply_report(IN parent_id INT, reply VARCHAR(250), child_ssn INT, teacher_id INT, report_date DATE)
BEGIN
  IF EXISTS (
  SELECT *
  FROM Reports R 
  INNER JOIN Parent_Of_Student P ON R.student_ssn = P.child_ssn
  WHERE P.child_ssn = child_ssn AND P.parent_id = parent_id AND R.teacher_id = teacher_id AND R.report_date = report_date)
  THEN 
    INSERT INTO Parents_Reply_Reports(parent_id, report_date, student_ssn, teacher_id, content)
    VALUES (parent_id, report_date, child_ssn, teacher_id, reply); 
  END IF; 
END //

CREATE PROCEDURE parent_rate_teacher (IN parent_id INT, teacher_id INT, rating INT)
BEGIN
  IF EXISTS (SELECT * 
    FROM Parent_Of_Student POS 
    INNER JOIN Courses_TaughtTo_Students_By_Teachers C ON C.student_ssn = POS.child_ssn
    WHERE POS.parent_id = parent_id AND C.teacher_id = teacher_id
    )
  THEN 
    INSERT INTO Parents_Rate_Teachers(parent_id, teacher_id, rating)
    VALUES (parent_id, teacher_id, rating); 
  END IF; 
END //

CREATE PROCEDURE parent_review_school (IN parent_id INT, IN school_id INT, review VARCHAR(200)) 
BEGIN
  IF EXISTS (
    SELECT * 
    FROM Students S 
    INNER JOIN Parent_Of_Student POS ON S.ssn = POS.student_ssn 
    WHERE POS.parent_id = parent_id AND S.school_id = school_id
    )
  THEN 
  INSERT INTO Parents_Review_Schools(parent_id, school_id, review) 
  VALUES (parent_id, school_id, review); 
  END IF; 
  
END //

CREATE PROCEDURE parent_delete_review (IN parent_id INT, school_id INT)
BEGIN
  DELETE FROM Parents_Review_Schools USING PRS AS Parents_Review_Schools
  WHERE PRS.parent_id = parent_id AND PRS.school_id = school_id; 

END //

CREATE PROCEDURE view_rating_teacher (IN teacher_id INT)
BEGIN
  SELECT T.first_name, T.middle_name, T.last_name, AVG(R.rating)
  FROM Parent_Rate_Teacher R
  INNER JOIN Teachers T ON T.teacher_id = R.teacher_id 
  WHERE R.teacher_id = teacher_id; 
END //

CREATE PROCEDURE school_highest_number_of_reviews (IN parent_id INT)
BEGIN
  SELECT S.name, COUNT(*)
  FROM Parents_Review_Schools PRS 
  INNER JOIN Schools S ON S.id = PRS.school_id 
  WHERE S.school_id NOT IN (SELECT S.school_id FROM Parent_Of_Student POS 
    INNER JOIN Students S ON S.ssn = POS.child_ssn WHERE POS.parent_id = parent_id)
  ORDER BY COUNT(*)
  LIMIT 10; 
END //

CREATE PROCEDURE school_highest_number_of_students (IN parent_id INT)
BEGIN
  SELECT S.name, COUNT(*)
  FROM Students St 
  INNER JOIN Schools S ON S.id = St.school_id
  WHERE S.school_id NOT IN (SELECT S.school_id FROM Parent_Of_Student POS 
    INNER JOIN Students S ON S.ssn = POS.child_ssn WHERE POS.parent_id = parent_id)
  ORDER BY COUNT(*)
  LIMIT 10; 
END //


CREATE PROCEDURE international_school_with_higher_reputation_than_all_national()
BEGIN
  SELECT S.name, S.address, S.mission, S.vision, S.language, S.fees, S.general_info, S.email, COUNT(*)
  FROM Schools S 
  INNER JOIN Parents_Review_Schools PRS ON PRS.school_id = S.id 
  WHERE S.type = 'international' 
  AND COUNT(*) > ALL (
    SELECT COUNT(*)
    FROM Schools S2 
    INNER JOIN Parents_Review_Schools PRS2 ON PRS2.school_id = S2.id 
    WHERE S2.type = 'national'
    );
END //


--   ***TEACHER STORY***

CREATE PROCEDURE teacher_sign_up(IN first_name VARCHAR(20), IN middle_name VARCHAR(20), IN last_name VARCHAR(20), IN birthdate DATE, IN address VARCHAR(100), IN email VARCHAR(50), IN gender VARCHAR(10))
BEGIN
  INSERT INTO Employees (first_name, middle_name, last_name, birthdate, address, email, gender)
  VALUES (first_name, middle_name, last_name, birthdate, address, email, gender);
  SET @emp_id = LAST_INSERT_ID();
  INSERT INTO Teachers (id) VALUES (emp_id);
END //


CREATE PROCEDURE teacher_view_courses(IN teacher_id INT)
BEGIN
  SELECT C.name, C.level, C.grade
  FROM Teachers T
  INNER JOIN Courses_TaughtTo_Students_By_Teachers CT ON T.id = CT.teacher_id  
  INNER JOIN Courses C  ON C.code = CT.course_code
  WHERE T.id = teacher_id
  GROUP BY level AND grade;
END // 

CREATE PROCEDURE teacher_post_assignment(IN teacher_id INT, IN course_code INT, IN post_date DATE, IN due_date DATE, IN content VARCHAR(1000), IN assignment_number INT)
BEGIN
  DECLARE school_id INT;
  SELECT E.school_id INTO school_id
  FROM Employees E
  WHERE id = teacher_id;
  INSERT INTO Assignemnts (assignment_number, course_code, school_id, post_date, due_date, content, teacher_id)
   VALUES (assignment_number, course_code, school_id, post_date, due_date, content, teacher_id);
END //


CREATE PROCEDURE teacher_view_solutions(IN teacher_id INT)
BEGIN
  SELECT SOL.assignment_number, SOL.course_code, S.id, SOL.solution
  FROM Solutions SOL 
  INNER JOIN Students S ON SOL.student_ssn = S.ssn
  INNER JOIN Assignemnts A ON A.assignment_number = SOL.assignment_number AND A.course_code = SOL.course_code AND A.school_id = SOL.school_id
  WHERE A.teacher_id = teacher_id
  ORDER BY S.id;
END //

CREATE PROCEDURE teacher_grade_solutions(IN teacher_id INT, IN student_id INT, IN assignment_number INT, IN course_code INT, IN grade INT)
BEGIN
  DECLARE school_id INT;
  DECLARE student_ssn INT;
  SELECT E.school_id INTO school_id
  FROM Employees E
  WHERE E.id = teacher_id;
 
  SELECT S.student_ssn INTO student_ssn
  FROM Students S 
  WHERE S.school_id = school_id AND S.id = student_id;  

  INSERT INTO Teachers_Grade_Solutions (student_ssn, assignment_number, course_code, school_id, grade, teacher_id) 
  VALUES (student_ssn, assignment_number, course_code, school_id, grade, teacher_id);
END //

CREATE PROCEDURE teacher_delete_assignment(IN teacher_id INT, IN courseCode INT, IN assignment_num INT)
BEGIN
  DECLARE schoolID INT;
  SELECT E.school_id INTO schoolID
  FROM Employees E
  WHERE E.id = teacher_id;

  DELETE FROM Assignments 
  WHERE assignment_number = assignment_num AND course_code = courseCode AND school_id = schoolID;
END //

CREATE PROCEDURE teacher_write_report(IN teacher_id INT, IN student_id INT, IN report_date DATE, IN comment VARCHAR(500))
BEGIN
  DECLARE school_id INT;
  DECLARE student_ssn INT;
  SELECT E.school_id INTO school_id
  FROM Employees E
  WHERE E.id = teacher_id;

  SELECT S.student_ssn INTO student_ssn
  FROM Students S
  WHERE S.student_id = student_id AND S.school_id = school_id;

  IF EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.teacher_id = teacher_id)
  THEN 
  INSERT INTO Reports (report_date, student_ssn, teacher_id, comment) 
  VALUES (report_date, student_ssn, teacher_id, comment);
  END IF;
END //

CREATE PROCEDURE teacher_view_questions(IN teacher_id INT, IN course_code INT)
BEGIN 
  SELECT S.id, S.name, Q.q_id, Q.content, Q.course_code
  FROM Questions Q INNER JOIN Students S ON Q.student_ssn = S.ssn
  WHERE Q.course_code = course_code
   AND EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.teacher_id = teacher_id AND CT.course_code = course_code);
END //

CREATE PROCEDURE teacher_answer_questions(IN teacher_id INT, IN course_code INT, IN q_id INT, IN answer VARCHAR(250))
BEGIN
  DECLARE count INT;
  SELECT COUNT DISTINCIT INTO count
  FROM Answers A
  WHERE A.course_code = course_code AND A.q_id = q_id;

  INSERT INTO Answers (answer_sub_id, q_id, answer, teacher_id) VALUES (count + 1, q_id, answer, teacher_id);

END //

CREATE PROCEDURE teacher_view_students(IN teacher_id INT)
BEGIN
  SELECT S.first_name, S.last_name, S.id, S.username, S.ssn, S.grade, S.level, S.gender, S.birthdate, S.age
  FROM Students S
  WHERE EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.teacher_id = teacher_id AND CT.student_ssn = S.ssn)
  GROUP BY S.grade
  ORDER BY S.first_name, S.last_name;
END //

CREATE PROCEDURE teacher_view_students_without_activities(IN teacher_id INT)
BEGIN
  DECLARE school_id INT;
  SELECT E.school_id INTO school_id
  FROM Employees E
  WHERE E.id = teacher_id;

  SELECT S.first_name, S.last_name, S.id, S.username, S.ssn, S.grade, S.level, S.gender, S.birthdate, S.age
  FROM Students S
  WHERE S.school_id = school_id AND A.ssn NOT IN (SELECT A.student_ssn FROM Activities_JoinedBy_Students);
END //

CREATE PROCEDURE student_in_max_clubs(IN teacher_id INT)
BEGIN
  DECLARE school_id INT;
  SELECT E.school_id INTO school_id
  FROM Employees E
  WHERE E.id = teacher_id;
   
  SELECT S.first_name,S.last_name
  FROM Students S 
  INNER JOIN 
  (
    SELECT C.student_ssn, COUNT (C.club_name) as count
    FROM Club_Member_Student C
    WHERE C.school_id = school_id
    GROUP BY student_ssn
    ORDER BY count DESC LIMIT 1
  ) Max
  ON S.ssn = Max.student_ssn;
 END // 
 

--   ***STUDENT STORY***

CREATE PROCEDURE student_view_courses(IN student_ssn INT)
BEGIN
  SELECT C.name
  FROM Courses C INNER JOIN Courses_TaughtTo_Students_By_Teachers CT ON C.course_code = CT.course_code
  WHERE CT.student_ssn = student_ssn
  ORDER BY C.name;
END //

CREATE PROCEDURE student_post_question(IN student_ssn INT, IN course_code INT, IN content VARCHAR(250))
BEGIN
  DECLARE q_count INT;
  SELECT COUNT INTO q_count
  FROM Questions Q
  WHERE Q.course_code = course_code;

  -- if student can only post questions in courses he take
  IF EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.course_code = course_code)
  THEN
  INSERT INTO Questions (q_id, student_ssn, course_code, content) VALUES (q_count + 1, student_ssn, course_code, content);
  END IF;
END //

CREATE PROCEDURE student_view_questions(IN student_ssn INT, IN course_code INT)
BEGIN
  SELECT Q.q_id, Q.content, A.answer_sub_id, A.answer
  FROM Questions Q INNER JOIN Answers A ON Q.q_id = A.q_id AND Q.course_code = A.course_code
  WHERE Q.course_code = course_code
  -- in case of only questions asked by other students
  AND Q.student_ssn <> student_ssn;
END //

CREATE PROCEDURE student_view_assignments(IN student_ssn INT)
BEGIN
  SELECT *
  FROM Assignemnts A 
  WHERE EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE A.course_code = CT.course_code AND CT.student_ssn = student_ssn);
END //

CREATE PROCEDURE student_solve_assignment(IN student_ssn INT, IN assignment_number INT, IN course_code INT, IN solution VARCHAR(500))
BEGIN
  DECLARE school_id INT;
  SELECT S.school_id INTO school_id
  FROM Students S
  WHERE S.ssn = student_ssn;
  IF EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.course_code = course_code)
    AND EXISTS (SELECT * FROM Assignemnts A WHERE A.course_code = course_code AND A.assignment_number = assignment_number AND A.school_id = school_id)
  THEN 
  INSERT INTO Solutions (student_ssn, assignment_number, course_code, school_id, solution) 
    VALUES  (student_ssn, assignment_number, course_code, school_id, solution);
  END IF;
END //

CREATE PROCEDURE student_view_grade(IN student_ssn INT)
BEGIN 
  SELECT G.assignment_number, G.course_code, G.grade
  FROM Teachers_Grade_Solutions G
  WHERE G.student_ssn = student_ssn;
END //


CREATE PROCEDURE student_view_announcement(IN student_ssn INT)
BEGIN
  DECLARE school_id INT;
  SELECT S.school_id INTO school_id
  FROM Students S
  WHERE S.ssn = student_ssn;
  SELECT A.title, A.announcement_date, A.type, A.description, (E.first_name, E.last_name) AS admin_name
  FROM Announcements A INNER JOIN Employees E ON E.id = A.admin_id
  WHERE E.school_id = school_id AND A.announcement_date >= CURDATE() - 10;

END //


CREATE PROCEDURE student_view_activities(IN student_ssn INT)
BEGIN
  DECLARE school_id INT;
  CALL get_student_school(student_ssn, school_id);

  SELECT A.activity_datetime, A.location, A.equipment, A.description, A.type, (T.first_name, T.middle_name, T.last_name) AS teacher_name
  FROM Activities A INNER JOIN Employees T ON A.teacher_id = T.q_id
  WHERE A.school_id = school_id;
END //

not complete .. el student el mafrood yda5al datetime w location, msh kteer shwya
CREATE PROCEDURE student_apply_activity(IN student_ssn INT, IN activity_name VARCHAR(70))
BEGIN
  DECLARE school_id INT;
  CALL get_student_school(student_ssn, school_id);
  IF EXISTS(SELECT * FROM Activities A WHERE A.name = activity_name AND A.school_id = school_id)
  THEN INSERT INTO Activities_JoinedBy_Students(student_ssn, school_id, activity_name) VALUES (student_ssn, school_id, activity_name);
  END IF;
END //


CREATE PROCEDURE student_join_club(IN student_ssn INT, IN club_name VARCHAR(20))
BEGIN 
  DECLARE school_id INT;
  DECLARE student_level VARCHAR(15);
  SELECT S.school_id,S.level INTO school_id, student_level
  FROM Students S
  WHERE S.ssn = student_ssn;
  IF(student_level = 'high')
  THEN
    INSERT INTO Club_Member_Student (student_ssn, school_id, club_name) VALUES (student_ssn, school_id, club_name);
  END IF;
END //

-- I added this (not required) procedure to show all available clubs in my school, to use it with the previous procedure later
CREATE PROCEDURE student_view_clubs(IN student_ssn INT)
BEGIN
  DECLARE school_id INT;
  SELECT S.school_id INTO school_id
  FROM Students S
  WHERE S.ssn = student_ssn;
  SELECT C.club_name
  FROM Clubs C
  WHERE C.school_id = school_id;
END //

CREATE PROCEDURE student_search_courses(IN student_ssn INT, IN keyword VARCHAR(50))
BEGIN
  SELECT *
  FROM Courses C
  WHERE (C.name = keyword OR CONCAT(C.course_code,'') = keyword) 
    AND EXISTS (SELECT * FROM Courses_TaughtTo_Students_By_Teachers CT WHERE CT.student_ssn = student_ssn AND CT.course_code = C.course_code);
END //

CREATE PROCEDURE student_update_first_name(IN student_ssn INT, IN new_first_name VARCHAR(20))
BEGIN
  UPDATE Students S
  SET S.first_name = new_first_name
  WHERE S.ssn = student_ssn;
END //

CREATE PROCEDURE student_update_last_name(IN student_ssn INT, IN new_last_name VARCHAR(20))
BEGIN
  UPDATE Students S
  SET S.last_name = new_last_name
  WHERE S.ssn = student_ssn;
END //

CREATE PROCEDURE student_update_password(IN student_ssn INT, IN new_password VARCHAR(20))
BEGIN
  UPDATE Students S
  SET S.password = new_password
  WHERE S.ssn = student_ssn;
END //

CREATE PROCEDURE student_update_birthdate(IN student_ssn INT, IN new_birthdate date)
BEGIN
  UPDATE Students S
  SET S.birthdate = new_birthdate
  WHERE S.ssn = student_ssn;
END //

CREATE PROCEDURE student_update_grade(IN student_ssn INT, IN new_grade INT)
BEGIN
  UPDATE Students S
  SET S.grade = new_grade
  WHERE S.ssn = student_ssn;
END //

CREATE PROCEDURE student_update_level(IN student_ssn INT, IN new_level VARCHAR(15))
BEGIN
  UPDATE Students S
  SET S.level = new_level
  WHERE S.ssn = student_ssn;
END //

CREATE PROCEDURE get_student_school(IN student_ssn INT, OUT school_id INT)
SELECT S.school_id INTO school_id
FROM Students S
WHERE S.ssn = student_ssn;
DELIMITER ; 



