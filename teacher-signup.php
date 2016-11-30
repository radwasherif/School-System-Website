<?php
$fname = $mname = $lname = $email = $address = $gender = $birthdate = ""; 
$fnameErr = $lnameErr = $emailErr = $genderErr = $birthdateErr = "";
if($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["fname"])) {
		$fnameErr = "First name is required";
	} else {
		$fname = $_POST['fname'];
	}
	$mname = $_POST['mname'];
	if (empty($_POST["lname"])) {
		$lnameErr = "Last name is required";
	} else {
		$lname = $_POST['lname'];
	}
	if (empty($_POST["email"])) {
		$emailErr = "Email is required";
	} else {
		$email = $_POST['email'];
	}
	$address = $_POST['address'];
	if (empty($_POST["gender"])) {
		$genderErr = "Gender is required";
	} else {
		$gender = $_POST['gender'];
	}
	if (empty($_POST["birthdate"])) {
		$birthdateErr = "Birthdate is required";
	} else {
		$birthdate = $_POST['birthdate'];
	} 
}
// echo $fname . " " . $lname . " " . $email; 
?>
