-- -- -- SYSTEM ADMIN

-- CALL create_school ('Victoria', 'Maadi', '111111', 'provide quality education for leaders of the future', 'create a better future', 'English', 'Founded in 1998', 4000, 'national', 'bashayer@schools.com'); 
 
-- CALL add_school_level(8, 'elementary'); 
-- CALL add_school_level(8, 'middle'); 
-- CALL add_school_level(8, 'high');


-- CALL create_course (204, 'Basic French II', '', 2, 'elementary');
-- CALL create_course (304, 'Basic French III', '', 3, 'elementary');

-- CALL add_course_prerequisite(204, 304);  

-- CALL create_admin('Ahmad', 'Fathy', 'Elsayed', 'ahmad.elsayed', '12345yy', 'elsayed@gmail.com', 'male', '12 Khalid st, Tagamoa, Cairo, Egypt', '1978-02-03'); 

-- CALL add_admin_to_school(LAST_INSERT_ID(), 'Victoria'); 

-- -- CALL search_school('Victoria', 'International', 'Maadi'); 

-- CALL user_view_school_info(1);

-- -- CALL view_school_by_level();

-- CALL teacher_sign_up ('Ismail', '', 'Yasseen', '1969-01-01', '21 Dokki st, Cairo, Egypt', 'som3a@gmail.com', 'male', 1); 
-- CALL teacher_sign_up ('Foad', '', 'El-Mohandess', '1978-01-03', '34 El-Nahda st, Cairo, Egypt', 'foad@gmail.com', 'male', 1); 
-- CALL teacher_sign_up ('Samira', '', 'Saeed', '1969-1-1', '21 Bohooth st, Cairo, Egypt', 'yomwarayom@gmail.com', 'female', 1); 
-- CALL teacher_sign_up ('Amina', '', 'Rezk', '1940-04-1', '12 Dokki st, Cairo, Egypt', 'aminarezk@gmail.com', 'female', 2); 
-- CALL teacher_sign_up ('Mona', '', 'Zaki', '1978-5-6', '21 Nile st, Cairo, Egypt', 'som3a@gmail.com', 'female', 2); 


-- CALL view_applied_teacher(10); 
-- CALL view_applied_teacher(11); 
-- CALL view_applied_teacher(7); 

-- CALL verify_applied_teacher(10, 4, 1); 
-- CALL verify_applied_teacher(10, 3, 1); 

-- CALL view_applied_students(10); 
-- CALL view_applied_students(11); 

-- CALL admin_accept_application(10, 612065); 
-- CALL admin_accept_application(11, 623019);

-- CALL parent_view_accepted(6); 

-- CALL parent_enroll_child(6, 612065, 1); 
-- CALL parent_enroll_child(6, 623019, 5); 

-- CALL verify_applied_student(10, 612065, '12345password'); 
-- CALL verify_applied_student(11, 623019, '123456password');  

-- CALL delete_employee(11, 6); 

-- CALL edit_school_fees(11, 11000); 

-- CALL admin_post_announcement('Trip to the cinema', '2016-11-23', 'trip', 'Trip to see finding nemo on 11/23.', 11);

-- CALL admin_post_announcement('Trip to the cinema', '2016-11-23', 'trip', 'Trip to see The Lego Movie on 11/23.', 10);

-- CALL admin_create_activity('Painting lessons', '2016-11-27 10:00', 'Building B', 'Paint brushes and canvases', 'Oil painting classes for beginners.', 'Art', 10, 4);
-- CALL admin_create_activity('Adnanced painting lessons', '2016-11-27 10:00', 'Building B', 'Paint brushes and canvases', 'Oil painting classes for experienced amateurs.', 'Art', 10, 3); 
-- CALL change_activity_teacher('Painting lessons', 15,10 ); 
-- CALL admin_reject_application(7, 6661239); 
-- CALL admin_assign_teacher_to_course (10, 4, 801); 

--  -- -- PARENT 
-- CALL parent_signup ('radwasherif', 'betengan', 'Radwa', 'Sherif', 'radwasherif@mail.com', '8 Dokki st, Cairo, Egypt', '23490000');
-- CALL parent_add_mobile(11, '0101111111');
-- CALL parent_apply_child(11, '12345', 'Ali', 'Mohamed', 'male', '1997-1-1', 5); 

-- CALL parent_view_accepted(6); 

-- CALL view_children_schools(6); 

-- CALL parent_view_announcement(5);

-- CALL teacher_write_report(4, 2, '2016-11-2', 'Needs more practice.'); 
-- CALL teacher_write_report(5, 1, '2016-10-23', 'Excellent work.'); 

-- CALL parent_view_report( 2, 4309120);
-- CALL parent_view_report( 9, 4309120); 

-- CALL parent_reply_report(2, 'We appreciate your encouragement.', 4309120, 5, '2016-10-23'); 
-- CALL parent_rate_teacher(2, 5, 8);
-- -- CALL parent_rate_teacher(9, 5, 2);
-- CALL parent_delete_review(6, 1); 
-- CALL parent_review_school(6, 1, 'An excellent school.'); 

-- CALL view_rating_teacher(6); 

-- CALL school_highest_number_of_reviews(2); 
-- CALL school_highest_number_of_students(9); 
-- CALL international_school_with_higher_reputation_than_all_national(); 

 

-- -- -- TEACHER
-- CALL teacher_sign_up('Abou El-Fadl', 'Hasanin', 'Abou El-Fadl' ,'1960-5-5', '25-bbas El Akkad - Nasr City - Cairo', 'abouelfadl605@yahoo.com', 'male', 3);
-- CALL teacher_view_courses(5);

-- CALL teacher_post_assignment(6,1107, '2016-11-30', '2016-12-12', 'http://dar-eltarbiah-national-school.edu.eg/download1107assignment3', 3);
-- CALL  teacher_view_solutions(6);
-- CALL teacher_grade_solutions(5,1,3,701,92);
-- CALL teacher_delete_assignment(5,701,3);
-- CALL teacher_write_report(5,1,'2016-10-15','very good student');
-- CALL teacher_view_questions(6,1107);
CALL teacher_view_students(6);
CALL teacher_view_students_without_activities(5);
CALL teacher_view_students_without_activities(6);
 CALL student_in_max_clubs(12);
 
-- -- STUDENT

 CALL student_view_courses(424875);
 CALL student_view_courses(4309120);
 
 CALL student_post_question(424875, 1106, 'how to do titration?');
 CALL student_post_question(424875, 701, 'will this question be added to the table?');
 
 CALL student_view_questions(424875, 701);
CALL student_view_questions(424875, 1106);

CALL student_view_assignments(424875);
CALL student_view_assignments(4309120);
CALL student_view_assignments(5339261);

CALL student_solve_assignment(424875,3,1107, 'assignment3-1107-nour-malek-4248.zip');

CALL student_view_grade(424875);
CALL student_view_grade(5339261);

CALL student_view_announcement(424875);

CALL student_view_activities(424875);

CALL student_apply_activity(424875, 'Cycling Race');

CALL student_view_clubs(5339261);
CALL student_view_clubs(424875);

CALL student_join_club(424875, 'Cinema Club');
CALL student_view_clubs(4309120);
CALL student_join_club(4309120, 'Bdaya');

CALL student_search_courses(4309120,'701');
CALL student_search_courses(424875, 'Advanced Physics');

CALL student_update_first_name(761293, 'Merna');

CALL student_update_password(4309120, '1212Rm@@');

