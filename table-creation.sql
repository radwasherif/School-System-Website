create database School-System;
use School-System;
create table Adminstrators
	(
		id int PRIMARY KEY AUTO_INCREMENT, 
		FOREIGN KEY (id) REFERENCES Employee(id) ON DELETE CASCADE
	);

create table Teachers 
	(
		id int PRIMARY KEY AUTO_INCREMENT,
		FOREIGN KEY (id) REFERENCES Employee(id) ON DELETE CASCADE,
		exp_years int,
		age int AS (YEAR(’2016-11-9’) - YEAR(start_date)) 
	);

create table Teachers_Supervising_Teachers
	(
		supervisor_id int,
		teacher_id int,
		PRIMARY KEY (supervisor_id, teacher_id),
		FOREIGN KEY (supervisor_id) REFERENCES Teachers(id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE,
	);

create table Activities
	(
		activity_datetime datetime,
		location varchar(100),
		equipment varchar(100),
		description varchar(500),
		type varchar(40),
		admin_id int,
		teacher_id int,
		PRIMARY KEY (activity_datetime, location),
		FOREIGN KEY (admin_id) REFERENCES Adminstrators(id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

create table Activities_JoinedBy_Students
	(
		student_ssn int,
		activity_datetime datetime,
		location varchar(100),
		PRIMARY KEY (student_ssn, activity_datetime, location),
		FOREIGN KEY (student_ssn) REFERENCES Students ON DELETE CASCADE,
		FOREIGN KEY (activity_datetime, location) REFERENCES Activities(activity_datetime, location) ON DELETE CASCADE
	);

create table Announcements
	(
		title varchar(50),
		announcement_date date,
		type varchar(50),
		descriptoin varchar(500),
		admin_id int,
		PRIMARY KEY (title, announcement_date),
		FOREIGN KEY (admin_id) REFERENCES Adminstrators(id) ON DELETE SET NULL
	);

create table Courses
	(
		code int,
		name varchar(50),
		description varchar(250),
		grade int,
		PRIMARY KEY (code)
	);

create table Courses_Prerequisite_Courses
	(
		pre_code int,
		code int,
		PRIMARY KEY (pre_code, code),
		FOREIGN KEY (pre_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (code) REFERENCES Courses(code) ON DELETE CASCADE
	);

create table Courses_TaughtIn_Schools
	(
		course_code int,
		school_id int,
		PRIMARY KEY (course_code, school_id),
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE
	);

create table Parents_Rate_Teachers
	(
		parent_username varchar (20),
		teacher_id int,
		rating int,
		PRIMARY KEY (parent_username, teacher_id),
		FOREIGN KEY (parent_username) REFERENCES Parents(username) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

create table Questions
	(
		q_id int,
		content varchar(250),
		student_ssn int,
		course_code int,
		PRIMARY KEY (q_id),
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE SET NULL,
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE
	);

create table Answers
	(
		answer_sub_id int,
		q_id int,
		answer varchar(250),
		teacher_id int,
		PRIMARY KEY (answer_sub_id, q_id),
		FOREIGN KEY (q_id) REFERENCES Questions(q_id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE SET NULL
	);

create table Courses_TaughtTo_Students_By_Teachers
	(
		course_code int,
		student_ssn int,
		teacher_id int,
		PRIMARY KEY (course_code, student_ssn),
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

create table Assignments
	(
		assignment_number int,
		course_code int,
		school_id int,
		post_date date,
		due_date date,
		contenet varchar(1000),
		teacher_id int,
		PRIMARY KEY (assignment_number, course_code, school_id),
		FOREIGN KEY (course_code) REFERENCES Courses(code) ON DELETE CASCADE,
		FOREIGN KEY (school_id) REFERENCES Schools(id) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

create table Solution
	(
		student_ssn int,
		assignment_number int,
		course_code int,
		school_id int,
		solution varchar(500),
		PRIMARY KEY (student_ssn, assignment_number, course_code, school_id),
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE,
		FOREIGN KEY (assignment_number, course_code, school_id) REFERENCES Assignments(assignment_number, course_code, school_id) ON
	);

create table Teachers_Grade_Solutions
	(
		student_ssn int,
		assignment_number int,
		course_code int,
		school_id int,
		grade int;
		teacher_id int,
		PRIMARY KEY (student_ssn, assignment_number, course_code, school_id),
		FOREIGN KEY (student_ssn, assignment_number, course_code, school_id) REFERENCES Solution (student_ssn, assignment_number, course_code, school_id), ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE	
	);

create table Reports
	(
		report_date date,
		student_ssn int,
		teacher_id int,
		comment varchar(500),
		PRIMARY KEY (report_date, student_ssn, teacher_id),
		FOREIGN KEY (student_ssn) REFERENCES Students(ssn) ON DELETE CASCADE,
		FOREIGN KEY (teacher_id) REFERENCES Teachers(id) ON DELETE CASCADE
	);

create table Parents_View_Reports
	(
		parent_username varchar(20),
		report_date date,
		student_ssn int,
		teacher_id int,
		PRIMARY KEY (parent_username, report_date, student_ssn, teacher_id),
		FOREIGN KEY (parent_username) REFERENCES Parents(username) ON DELETE CASCADE,
		FOREIGN KEY (report_date, student_ssn, teacher_id) REFERENCES Reports(report_date, student_ssn, teacher_id) ON DELETE CASCADE
	);

create table Parents_Reply_Reports
	(
		parent_username varchar(20),
		report_date date,
		student_ssn int,
		teacher_id int,
		content varchar(250),
		PRIMARY KEY (parent_username, report_date, student_ssn, teacher_id),
		FOREIGN KEY (parent_username) REFERENCES Parents(username) ON DELETE CASCADE,
		FOREIGN KEY (report_date, student_ssn, teacher_id) REFERENCES Reports(report_date, student_ssn, teacher_id) ON DELETE CASCADE
	);

