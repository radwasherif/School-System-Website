CALL view_applied_teacher(1);
CALL verify_applied_teacher(1, 2, '12345');
CALL verify_applied_teacher(1, 3, '12345');
CALL verify_applied_teacher(1, 4, '12345');

CALL view_applied_teacher(5);
CALL verify_applied_teacher(5, 6 , '12345');
CALL verify_applied_teacher(5, 7, '12345');
CALL verify_applied_teacher(5, 8, '12345');

CALL view_applied_teacher(9);
CALL verify_applied_teacher(9, 10, '12345');
CALL verify_applied_teacher(9, 11, '12345');
CALL verify_applied_teacher(9, 12, '12345');
CALL verify_applied_teacher(9, 13, '12345');


INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (1, 1122, 1, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (1, 2211, 1, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (2, 3344, 3, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (2, 4433, 3, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (2, 5555, 5, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (3, 6666, 6, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (3, 7777, 7, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (3, 888, 8, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (3, 8888, 8, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (2, 999, 9, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (2, 9999, 9, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (1, 1010, 10, 'pending');
INSERT INTO School_Apply_Student(school_id, student_ssn, parent_id, status)
    VALUES (1, 101010, 10, 'pending');


CALL view_applied_students(1);

CALL admin_accept_application(1, 1010);
CALL admin_accept_application(1, 101010);
CALL admin_accept_application(1, 1122);
CALL admin_accept_application(1, 2211);

CALL parent_enroll_child(10, 1010, 1);
CALL parent_enroll_child(10, 101010, 1);
CALL parent_enroll_child(1, 1122, 1);
CALL parent_enroll_child(1, 2211, 1);

CALL verify_applied_student(1, 1010, 12345);
CALL verify_applied_student(1, 101010, 12345);
CALL verify_applied_student(1, 1122, 12345);
CALL verify_applied_student(1, 2211, 12345);


CALL view_applied_students(5);
CALL admin_accept_application(5, 999);
CALL admin_accept_application(5, 9999);
CALL admin_accept_application(5, 3344);
CALL admin_accept_application(5, 4433);
CALL admin_accept_application(5, 5555);

CALL parent_enroll_child(9, 999, 2);
CALL parent_enroll_child(9, 9999, 2);
CALL parent_enroll_child(3, 3344, 2);
CALL parent_enroll_child(3, 4433, 2);
CALL parent_enroll_child(5, 5555, 2);

CALL verify_applied_student(5, 999, 12345);
CALL verify_applied_student(5, 9999, 12345);
CALL verify_applied_student(5, 3344, 12345);
CALL verify_applied_student(5, 4433, 12345);
CALL verify_applied_student(5, 5555, 12345);


CALL view_applied_students(9);
CALL admin_accept_application(9, 888);
CALL admin_accept_application(9, 8888);
CALL admin_accept_application(9, 6666);
CALL admin_accept_application(9, 7777);

CALL parent_enroll_child(8, 888, 3);
CALL parent_enroll_child(8, 8888, 3);
CALL parent_enroll_child(6, 6666, 3);
CALL parent_enroll_child(7, 7777, 3);

CALL verify_applied_student(9, 888, 12345);
CALL verify_applied_student(9, 8888, 12345);
CALL verify_applied_student(9, 6666, 12345);
CALL verify_applied_student(9, 7777, 12345);

SELECT DISTINCT CTTSBT.course_code
FROM Courses_TaughtTo_Students_By_Teachers CTTSBT
INNER JOIN Students S ON S.ssn = CTTSBT.student_ssn
WHERE S.school_id = 1
  ORDER BY CTTSBT.course_code;

CALL admin_assign_teacher_to_course(1, 2, 201);
CALL admin_assign_teacher_to_course(1, 2, 202);

CALL admin_assign_teacher_to_course(1, 3, 501);
CALL admin_assign_teacher_to_course(1, 3, 506);
CALL admin_assign_teacher_to_course(1, 4, 507);
CALL admin_assign_teacher_to_course(1, 4, 404);
CALL admin_assign_teacher_to_course(1, 4, 907);


SELECT DISTINCT CTTSBT.course_code
FROM Courses_TaughtTo_Students_By_Teachers CTTSBT
INNER JOIN Students S ON S.ssn = CTTSBT.student_ssn
WHERE S.school_id = 2
  ORDER BY CTTSBT.course_code;

UPDATE Parents
SET password = '12345';

