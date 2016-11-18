CREATE DATABASE School_System;
USE School_System; 


CREATE TABLE Schools (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(30),
	address VARCHAR(100),  
	mission VARCHAR(120), 
	vision VARCHAR(120), 
	language VARCHAR(20), 
	general_info VARCHAR(120), 
	fees INT, 
	type VARCHAR(20), 
	CHECK (type = 'national' OR type = 'international'),  
	email VARCHAR(50), 
);  


CREATE TABLE Phone_School (
	PRIMARY KEY (school_id, phone),
	phone VARCHAR(15), 
	school_id INT,
	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE 
	
); 

CREATE TABLE Level_School
(
	PRIMARY KEY (school_id, level),
	level VARCHAR(15),
	CHECK (level = 'elementary' or level = 'middle' or level = 'high'),
	school_id INT,
	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE
);


CREATE TABLE Supplies (
	PRIMARY KEY (name, school_id, grade),
	name VARCHAR(15), 
	school_id INT, 
	grade INT,
	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE
); 


CREATE TABLE Clubs (
	PRIMARY KEY (name, school_id), 
	name VARCHAR(20), 
	school_id INT,
	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE
); 

CREATE TABLE Students (
	PRIMARY KEY (ssn), 
	ssn INT, 
	id INT,
	school_id INT, 
	first_name VARCHAR(20),
	last_name VARCHAR(20), 
	username VARCHAR(20),
	password VARCHAR(20), 
	gender VARCHAR(10), 
	birthdate date, 
	age INT AS (YEAR('2016-1-1') - YEAR(birthdate)), 
	grade INT, 
	level VARCHAR(15), 
	CHECK (level = 'elementary' or level = 'middle' or level = 'high'),
	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE SET NULL 
); 

CREATE TABLE Parents (
	PRIMARY KEY (id),
	id INT AUTO_INCREMENT, 
	username VARCHAR(20), 
	first_name VARCHAR(20), 
	last_name VARCHAR(20), 
	email VARCHAR(20), 
	address VARCHAR(120), 
	home_phone VARCHAR(15)
); 

CREATE TABLE Mobile_Of_Parent (
	PRIMARY KEY (mobile, parent_id), 
	parent_id INT, 
	mobile VARCHAR(15), 
	FOREIGN KEY (parent_id) REFERENCES Parents(id) ON DELETE CASCADE
);  

CREATE TABLE Parent_Of_Student (
	PRIMARY KEY (parent_id, child_ssn), 
	parent_id INT, 
	child_ssn INT, 
	FOREIGN KEY (child_ssn) REFERENCES Students(ssn), 
	FOREIGN KEY (parent_id) REFERENCES Parents(id)
); 

CREATE TABLE Club_Member_Student (
	PRIMARY KEY (student_ssn, school_id, club_name), 
	student_ssn INT, 
	school_id INT, 
	club_name VARCHAR(20), 
	FOREIGN KEY (club_name, school_id) REFERENCES Clubs(name, school_id) ON DELETE CASCADE, 
	FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE
);

CREATE TABLE Parent_Review_School (
	PRIMARY KEY (school_id, parent_id), 
	school_id INT, 
	parent_id INT, 
	review VARCHAR(200), 
	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE, 
	FOREIGN KEY (parent_id) REFERENCES Parents(id) ON DELETE CASCADE 
); 
CREATE TABLE School_Apply_Student(
 	PRIMARY KEY (school_id, student_ssn), 
 	school_id INT,
 	student_ssn INT,
 	parent_id INT, 
 	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE, 
 	FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE, 
 	FOREIGN KEY (parent_id) REFERENCES Parents(id) ON DELETE SET NULL 
); 


CREATE TABLE Employees (
	PRIMARY KEY(id), 
	id INT AUTO_INCREMENT, 
	school_id INT DEFAULT NULL, 
	first_name VARCHAR(20), 
	middle_name VARCHAR(20), 
	last_name VARCHAR(20), 
	username VARCHAR(20), 
	password VARCHAR(20), 
	email VARCHAR(50), 
	gender VARCHAR(10), 
	address VARCHAR(100), 
	birthdate DATE, 
	salary INT,  
	age INT AS (YEAR('2016-1-1') - YEAR(birthdate)), 
	FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE SET NULL
); 


CREATE TABLE Adminstrators
	 (
		id int PRIMARY KEY, 
		FOREIGN KEY (id) REFERENCES Employees(id) ON DELETE CASCADE
	);

CREATE TABLE Teachers 
	(
		id int PRIMARY KEY,
		start_date DATE,
		exp_years INT AS (YEAR('2016-11-9') - YEAR(start_date)),
		FOREIGN KEY (id) REFERENCES Employees(id) ON DELETE CASCADE
	);

CREATE TABLE Teachers_Supervising_Teachers
	(
		supervisor_id int,
		teacher_id int,
		PRIMARY KEY (supervisor_id, teacher_id),
		FOREIGN KEY (supervisor_id) REFERENCES Teachers(id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

CREATE TABLE Activities
	(	
		PRIMARY KEY (activity_datetime, location),
		activity_datetime datetime,
		location varchar(100),
		equipment varchar(100),
		description varchar(500),
		type varchar(40),
		admin_id int,
		teacher_id int,
		FOREIGN KEY (admin_id) REFERENCES Adminstrators(id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE,
	);

CREATE TABLE Activities_JoinedBy_Students
	(	
		PRIMARY KEY (student_ssn, activity_datetime, location),
		student_ssn int,
		activity_datetime datetime,
		location varchar(100),
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE,
		FOREIGN KEY (activity_datetime, location) REFERENCES Activities(activity_datetime, location) ON DELETE CASCADE
	);

CREATE TABLE Announcements
	(	
		PRIMARY KEY (title, announcement_date),
		title varchar(50),
		announcement_date date,
		type varchar(50),
		descriptoin varchar(500),
		admin_id int,
		FOREIGN KEY (admin_id) REFERENCES Adminstrators(id) ON DELETE SET NULL,
	);

CREATE TABLE Courses
	(
		PRIMARY KEY (code),
		code int,
		name varchar(50),
		description varchar(250),
		grade int, 
		level VARCHAR(20), 
		CHECK (level = 'elementary' or level = 'middle' or level = 'high')	
	);

CREATE TABLE Courses_Prerequisite_Courses
	(
		PRIMARY KEY (pre_code, code),
		pre_code int,
		code int,
		FOREIGN KEY (pre_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (code) REFERENCES Courses(code) ON DELETE CASCADE
	);

CREATE TABLE Courses_TaughtIn_Schools
	(
		PRIMARY KEY (course_code, school_id),
		course_code int,
		school_id int,
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE
	);

CREATE TABLE Parents_Rate_Teachers
	(
		PRIMARY KEY (parent_id, teacher_id),
		parent_id INT,
		teacher_id INT,
		rating INT,
		FOREIGN KEY (parent_id) REFERENCES Parents(id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

CREATE TABLE Questions
	(
		PRIMARY KEY (q_id, course_code),
		q_id int,
		content varchar(250),
		student_ssn int,
		course_code int,
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE SET NULL,
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE
	);

CREATE TABLE Answers
	(
		PRIMARY KEY (answer_sub_id, q_id, course_code),
		answer_sub_id int,
		q_id int,
		answer varchar(250),
		teacher_id int,
		course_code int,
		FOREIGN KEY (q_id, course_code) REFERENCES Questions(q_id, course_code) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE SET NULL
	);

CREATE TABLE Courses_TaughtTo_Students_By_Teachers
	(
		PRIMARY KEY (course_code, student_ssn),
		course_code int,
		student_ssn int,
		teacher_id int NOT NULL,
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

CREATE TABLE Assignments
	(
		PRIMARY KEY (assignment_number, course_code, school_id),
		assignment_number int,
		course_code int,
		school_id int,
		post_date date,
		due_date date,
		contenet varchar(1000),
		teacher_id int,
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

CREATE TABLE Solutions
	(
		PRIMARY KEY (student_ssn, assignment_number, course_code, school_id),
		student_ssn int,
		assignment_number int,
		course_code int,
		school_id int,
		solution varchar(500),
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE,
		FOREIGN KEY (assignment_number, course_code, school_id) REFERENCES Assignments(assignment_number, course_code, school_id) ON DELETE CASCADE
	);

CREATE TABLE Teachers_Grade_Solutions
	(
		PRIMARY KEY (student_ssn, assignment_number, course_code, school_id),
		student_ssn int,
		assignment_number int,
		course_code int,
		school_id int,
		grade int,
		teacher_id int,
		FOREIGN KEY (student_ssn, assignment_number, course_code, school_id) REFERENCES Solutions (student_ssn, assignment_number, course_code, school_id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE	
	);

CREATE TABLE Reports
	(
		report_date date,
		student_ssn int,
		teacher_id int,
		comment varchar(500),
		PRIMARY KEY (report_date, student_ssn, teacher_id),
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

CREATE TABLE Parents_View_Reports
	(
		parent_id INT,
		report_date date,
		student_ssn int,
		teacher_id int,
		PRIMARY KEY (parent_id, report_date, student_ssn, teacher_id),
		FOREIGN KEY (parent_id) REFERENCES Parents(id) ON DELETE CASCADE,
		FOREIGN KEY (report_date, student_ssn, teacher_id) REFERENCES Reports(report_date, student_ssn, teacher_id) ON DELETE CASCADE
	);

CREATE TABLE Parents_Reply_Reports
	(
		parent_id INT,
		report_date date,
		student_ssn int,
		teacher_id int,
		content varchar(250),
		PRIMARY KEY (parent_id, report_date, student_ssn, teacher_id),
		FOREIGN KEY (parent_id) REFERENCES Parents(id) ON DELETE CASCADE,
		FOREIGN KEY (report_date, student_ssn, teacher_id) REFERENCES Reports(report_date, student_ssn, teacher_id) ON DELETE CASCADE
	);


