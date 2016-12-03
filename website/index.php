<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="homepage.css">
<head>
	<title>R.A. Inc. </title>
</head>
<body>	
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
				$call = $conn->prepare('CALL search_parent(?, ?)');
				$call->bind_param(ss, $username, $password); 
				if($call->execute()) {
					echo "You have successfully logged in."; 
					$result = $call->get_result(); 
					$row = $result->fetch_array(MYSQLI_BOTH);
					echo $row['id'];  
					header("Location: parent/parent.php"); 
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
	<style type="text/css">
		
	</style>
	
	<nav class="navbar navbar-inverse">
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
					<input  type="text" class="form-control" placeholder="Search schools by name, address or type" name="school">
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
		<div id = "homepage-banner"class="jumbotron">
			<h1>R.A. Inc. </h1> 
			<h3>The Future of School Networking. </h3> 
		</div>
	</div>
	<br>
	<br> 
	<div class = "container">
		<div class = "row">
			<div  id = "login" class = "col-md-3 col-centered">
				<h1>Log in</h1>
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
					<div class="form-group">
						<label>Username: *</label>
						<input type="text" class="form-control" placeholder="username" name = "username">
					</div>

					<div class="form-group">
						<label> Password: *</label>
						<input type="text" class="form-control" placeholder="password" name = "password">
					</div>
					<div class = "form-group">
						<label>Log in as: *</label>
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
					<span class="error"> <?php echo $loginError;?></span>

					<br> 
				</form>
			</div>
		</div>
		<div class = "center row">
			<div class = "col-md-4 col-md-offset-1">
				<button class = "button btn btn-lg">TEACHER SIGNUP</button>	
			</div>
			
			<div class = "col-md-4 col-md-offset-2">
				<button class = "button btn btn-lg">PARENT SIGNUP </button>
			</div>
			
		</div>

	</div>



</body>
</html>