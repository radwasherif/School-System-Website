<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="parent.css">
<head>
	<title>Teacher Signup</title>
</head>
<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include "../connection-values.php"; 
$fname = $lname = $email = $address = $username = $mobile = $password = $homephone = ""; 
$fnameErr = $lnameErr = $emailErr = $mobileErr = $usernameErr = $loginError = $passwordErr = "";
$allRequired = true; 
if($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["fname"])) {
		$allRequired = false; 
		$fnameErr = "First name is required";
	} else {
		$fname = $_POST['fname'];
	}
	if (empty($_POST["lname"])) {
		$allRequired = false; 
		$lnameErr = "Last name is required";
	} else {
		$lname = $_POST['lname'];
	}
	
	if(empty($_POST["mobile"])) {
		$allRequired = false; 
		$mobileErr = "Mobile no. is required."; 
	} else {
		$mobile = $_POST['mobile']; 
	}
	
	if (empty($_POST["email"])) {
		$allRequired = false; 
		$emailErr = "Email is required";
	} else {
		$email = $_POST["email"];
		echo $email;
		echo strlen($email);
	}
	
	$address = $_POST['address'];
	$homephone = $_POST["homephone"]; 
	
	if (empty($_POST["username"])) {
		$allRequired = false; 
		$usernameErr = "Username is required";
	} else {
		$username = $_POST['username'];
		$call = $conn->prepare('SELECT P.username FROM Parents P WHERE P.username = ?'); 
		$call->bind_param('s', $username);
		if($call->execute()) { 
			$result = $call->get_result(); 
			if($row = $result->fetch_array(MYSQLI_BOTH)) {
			$allRequired = false; 
			$loginError = "Sorry, this username is already taken."; 
			}
		}
	}
	
	if (empty($_POST["password"])) {
		$allRequired = false; 
		$passwordErr = "Password is required";
	} else {
		$password = $_POST['password'];
	} 
	

	if($allRequired) {
		$id; 
		$call = $conn->prepare('CALL parent_signup(?, ?, ?, ?, ?, ?, ?)'); 
		$call->bind_param('sssssss', $username, $password, $fname, $lname, $email, $address, $homephone); 
		if($call->execute()){
			$result = $call->get_result(); 
			$row = $result->fetch_array(MYSQLI_BOTH); 
			$id = $row[0]; 
			header("Location: parent.php?id=" . $id);  
			
			
		} else 	{
			echo $call->error; 
			$loginError = "Please insert valid data."; 
		}
		// if($call = $conn->prepare('CALL parent_add_mobile(?, ?)') {
		// 	$call->bind_param('is', $id, $mobile); 
		// if($call->execute()) {
		// 	$result = $call->get_result(); 
		// 	$parent = $result->fetch_array(MYSQLI_BOTH);
		// 	header("Location: parent.php/id=$id"); 	
		// } else {
		// 	echo $call->error; 
		// }	
		// } else {
		// 	echo $call->error;
		// 	echo $conn->error; 
		// } 
		
	}
	
}

	
?>
<body>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Radwa and Alaa</a>
			</div>
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="../index.php">Home</a></li>
				<li><a href="../view-schools.php">View Schools</a></li>
			</ul>
			
			<form id = "search-bar"  method = "post" class="navbar-form navbar-right" action = "../search-schools.php">
				<div class="form-group">
					<input  type="text" class="form-control" placeholder="Search schools by name, address or type" name="school">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>

		</div>
	</nav>
	<div class="container">
		<div class = "row" class = "center">
			<div id="sign-up" class = "col-md-4 col-centered">
				<h1> Sign Up As A Parent </h1> 
					<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
						<div class="form-group">
							<label>First name: </label>
							<span class="error">* <?php echo $fnameErr;?></span>
							<input type="text" class="form-control" placeholder="First name" name = "fname">
						</div>
						<div class="form-group">
							<label>Last name: </label>
							<span class="error">* <?php echo $lnameErr;?></span>
							<input type="text" class="form-control" placeholder="Last name" name = "lname">
						</div>

						<div class="form-group">
							<label>Mobile no.: </label>
							<span class="error">* <?php echo $mobileErr;?></span>
							<input type="text" class="form-control" placeholder="Mobile no." name = "mobile">
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
							<label>Home phone no.: </label>
							<input type="text" class="form-control" placeholder="Home phone number" name = "homephone">
						</div>
						<div class = "form-group">
							<label>Username: </label>
							<span class="error">* <?php echo $usernameErr;?></span>
							<input type="text" class="form-control" placeholder="Username" name = "username">
							
						</div>
						<div class="form-group">
							<label>Password: </label>
							<span class="error">* <?php echo $passwordErr;?></span>
							<input type="text" class="form-control" placeholder="Password" name = "password">
						</div>
						<button type="submit" class="btn btn-default">Sign up</button>
						<br> 
						<span class="error"> <?php echo $loginError;?></span>
						<br>
					</form>

			</div>
		</div>
	</body>
	</html>

