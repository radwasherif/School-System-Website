
-- CALL create_school ('Victoria', 'Maadi', '111111', 'provide quality education for leaders of the future', 'create a better future', 'English', 'Founded in 1998', 4000, 'national', 'bashayer@schools.com'); 


-- CALL add_school_level(LAST_INSERT_ID(), 'elementary'); 
-- CALL add_school_level(LAST_INSERT_ID(), 'middle'); 
-- CALL add_school_level(LAST_INSERT_ID(), 'high');


-- CALL create_course (204, 'Basic French II', '', 2, 'elementary');
-- CALL create_course (304, 'Basic French III', '', 3, 'elementary');

-- CALL add_course_prerequisite(204, 304);  

-- CALL create_admin('Ahmad', 'Fathy', 'Elsayed', 'ahmad.elsayed', '12345yy', 'elsayed@gmail.com', 'male', '12 Khalid st, Tagamoa, Cairo, Egypt', '1978-02-03'); 

-- CALL add_admin_to_school(LAST_INSERT_ID(), 'Victoria'); 

-- CALL search_school('Victoria', 'International', 'Maadi'); 

-- CALL user_view_school_info(1);

-- CALL view_school_by_level();

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
