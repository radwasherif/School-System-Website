DELIMITER // 
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

DELIMITER ; 
