<?php
	$servername = 'localhost'; 
	$dbusername = 'root'; 
	$dbpassword = '1tayswi3'; 
	$dbname = 'School_System'; 
	$conn = new mysqli($servername, $username, $password, $dbname, "88");
	if($conn->connect_errno) {
		die("An error in database connection has occured."); 
	}
?>