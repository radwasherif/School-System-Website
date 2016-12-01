
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
		$username = 'radwa'; 
		$servername = 'localhost'; 
		$password = '1tayswi3'; 
		$dbname = 'School_System'; 
		$conn = new mysqli($servername, $username, $password, $dbname, "88");
		if($conn->connect_errno) {
			die("An error in database connection has occured."); 
		}
		// $id_test = 3; 
		// $str_test = 'foo'; 
		// $call = $conn->prepare('CALL test(?, ?)');
		// $call->bind_param(is, $id_test, $str); 
		// $call->execute();  

		// $bd = '2012-1-1'; 		
		// $call = $conn->prepare('CALL test(?)');
		// $call->bind_param(s, $bd); 
		// $call->execute(); 
		$school_id = 1; 
		$call = $conn->prepare('CALL teacher_sign_up(?, ?, ?, ?, ?, ?, ?, ?)');
		$call->bind_param(sssssssi, $fname, $mname, $lname, $birthdate, $address, $email, $gender, $school_id); 
		if($call->execute()) {
			echo "You have successfully signed up."; 
		} else {
			echo $call->error; 
		}

	}
		?>



<div class = "row" class = "center">
				<div class = "col-md-4 col-md-offset-1">
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
					</form>

				</div>
				
				<div class = "col-md-4 col-md-offset-1">
					<h1> Sign Up As A Parent </h1> 
					<form>
						<div class="form-group">
							<label>First name: </label>
							<input type="text" class="form-control" placeholder="First name" name = "fname">
						</div>
						<div class="form-group">
							<label>Last name: </label>
							<input type="text" class="form-control" placeholder="Last name" name = "lname">
						</div>

						<div class="form-group">
							<label>Mobile number: </label>
							<input type="text" class="form-control" placeholder="Middle name" name = "mname">
						</div>
						<div class="form-group">
							<label>Email: </label>
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
							<input type="text" class="form-control" placeholder="Username" name = "username">
							
						</div>
						<div class="form-group">
							<label>Password: </label>
							<input type="text" class="form-control" placeholder="Password" name = "password">
						</div>
						<button type="submit" class="btn btn-default">Sign up</button>
					</form>
				</div>
			</div>