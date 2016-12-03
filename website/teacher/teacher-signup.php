<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="teacher.css">
<head>
	<title>Teacher Signup</title>
</head>
<?php
include "../connection-values.php"; 
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
?>
<body>
	<div class="container">
		<div class = "row" class = "center">
			<div id="sign-up" class = "col-md-4 col-centered">
				<h1> Sign Up As A Teacher </h1> 
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
					<div class="form-group">
						<label>First name: </label>
						<span class="error">* <?php echo $fnameErr;?></span>
						<input type="text" class="form-control" placeholder="First name" name = "fname">
					</div>

					<div class="form-group">
						<label>Middle name: </label>
						<input type="text" class="form-control" placeholder="Middle name" name = "mname">
					</div>
					<div class="form-group">
						<label>Last name: </label>
						<span class="error">* <?php echo $lnameErr;?></span>
						<input type="text" class="form-control" placeholder="Last name" name = "lname">		
					</div>
					<div class="form-group">
						<label>Email: </label>
						<span class="error">* <?php echo $emailErr;?></span>
						<input type="text" class="form-control" placeholder="Email" name = "email">
					</div>

					<div class="form-group">
						<label>Address: </label>
						<input type="text" class="form-control" placeholder="Address" name = "address">
					</div>
					<div class="form-group">
						<label>Birthdate: </label>
						<span class="error">* <?php echo $birthdateErr;?></span>
						<input type="date" class="form-control" name = "birthdate">

					</div>
					<div class = "form-group">
						<label>Gender: </label>
						<span class="error">* <?php echo $genderErr;?></span>
						<label class = "radio-inline">
							<input type="radio" name = "gender" value = "female"> female
						</label>

						<label class = "radio-inline">
							<input type="radio" name = "gender" value = "male"> male
						</label>
						<br>

						<button type="submit" class="btn btn-default">Sign up</button>
					</div>
					<form>
						<select name="lang">
							<option value="html">html</option>
							<option value="css">CSS</option>
							<option value="javascript">JavaScript</option>
							<option value="php">PHP</option>
						</select>
						<br />
						<input type="submit">
					</form>
				</form>
			</div>
		</div>
	</body>
	</html>

