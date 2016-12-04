<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="homepage.css">
<head>
	<title>R.A. Inc. </title>
</head>
<?php
	include 'connection-values.php'; 
	$username = $password = $usertype = $loginError  = ""; 
	if($_SERVER["REQUEST_METHOD"] == "POST") {
		if(!empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['usertype'])) {
			$username = $_POST['username']; 
			$password = $_POST['password']; 
			$usertype = $_POST['usertype'];  
			$userID; 
			if($usertype == "parent") {
				// echo "HIIIII";
				$call = $conn->prepare('CALL search_parent(?, ?)');
				$call->bind_param('ss', $username, $password); 
				if($call->execute()) {
					$result = $call->get_result(); 
					if($row = $result->fetch_array(MYSQLI_BOTH)) {
						echo $row['id'];  
						header("Location: parent/parent.php?id=" . $row['id']); 
					} else {
						$loginError =  "* Please enter a valid username-password combination."; 
					}
				} else {
					echo $call->error; 
				}
			} elseif ($usertype == "teacher") {
				$call = $conn->prepare('CALL search_teacher(?, ?)');
				$call->bind_param('ss', $username, $password); 
				if($call->execute()) {
					$result = $call->get_result(); 
					if($row = $result->fetch_array(MYSQLI_BOTH)) {

						$r = $row['id'];  
						header("Location: teacher/teacher.php?id=$r"); 

					} else {
						$loginError =  "* Please enter a valid username-password combination."; 
					}
				} else {
					echo $call->error; 
				}
			}
		}
		else 
		{
			$loginError = "Please fill all required fields";
		}

	}
	?>
<body>
	<nav class="navbar navbar-inverse ">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Radwa and Alaa</a>
			</div>
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="view-schools.php">View Schools</a></li>
			</ul>
			
			<form id = "search-bar"  method = "post" class="navbar-form navbar-right" action = "search-schools.php">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search schools by name, address or type" name="school">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>

		</div>
	</nav>


	<div class = "container-custom container-fluid">
		<br>
		<br>
		<img id = "logo" src="resources/school-icon.png" class="img-responsive img-circle margin" width = "300" height="300">	
		<br>
		<br>
		<div id = "homepage-banner" class="jumbotron">
			<h1>R.A. Inc. </h1> 
			<h3>The Future of School Networking. </h3> 
		</div>
	</div>
	<br>
	<br> 
	<div class = "container">
		<div class = "row">
			<div  id = "login" class = "col-md-3 col-md-offset-5">
				<h1>Log in</h1>
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
					<div class="form-group">
						<label>Username: <font color='red'>*</font></label>
						<input type="text" class="form-control" placeholder="username" name = "username">
					</div>

					<div class="form-group">
						<label> Password: <font color='red'>*</font></label>
						<input type="text" class="form-control" placeholder="password" name = "password">
					</div>
					<div class = "form-group">
						<label>Log in as: <font color='red'>*</font></label>
						<label class = "radio-inline">
							<input type="radio" name = "usertype" value = "parent"> parent
						</label>

						<label class = "radio-inline">
							<input type="radio" name = "usertype" value = "teacher"> teacher
						</label>
						<br>
					</div>
					<button type="submit" class="btn btn-default">Login</button>
					<br>
					<span class="error"> <?php echo "<font color='red'> $loginError </font>";?></span>

					<br> 
				</form>
			</div>
		</div>
		
		<!-- <div class = "center row">
			<div class = "col-md-4 col-md-offset-1">
				<button class = "button btn btn-lg">TEACHER SIGNUP</button>	
			</div>
			
			<div class = "col-md-4 col-md-offset-2">
				<button class = "button btn btn-lg">PARENT SIGNUP </button>
			</div>
			
		</div> -->

		<div class="col-centered row">
			<a href="teacher/teacher-signup.php">
				<div class="rectangle col-md-4 col-md-offset-2">
					TEACHER SIGNUP
				</div>
			</a>

			<a href="parent/parent-signup.php">
				<div class="rectangle col-md-4 col-md-offset-1">
					PARENT SIGNUP
				</div>

			</a>
		</div>

	</div>
	
	
	



</body>
</html>