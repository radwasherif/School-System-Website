<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="homepage.css">
<head>
	<title>Radwa and Alaa's School Directory</title>
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
			echo "HIIIII"; 
			echo $username . " " . $password; 
			
			if($usertype == "parent") {
				echo "gowaa"; 
				$call = $conn->prepare('CALL search_parent(?)');
				$call->bind_param(s, $username); 
				if($call->execute()) {
					echo "You have successfully logged in."; 
				} else {
					echo $call->error; 
				}
			}
			echo "barraa"; 


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
				<li><a href="#">View Schools</a></li>
			</ul>
			<form class="navbar-form navbar-right" action = "search.php">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search schools by name, address or type" name="school">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>
		</div>
	</nav>
	<div class = "container-custom container-fluid">
		<img id = "logo" src="resources/school-icon.png" class="img-responsive img-circle margin" width = "300" height="300">	
		<div class="jumbotron">
			<h1>Radwa and Alaa's School Directory</h1> 
			<p>We help you choose the best for your children.</p> 
		</div>
	</div>
	<br>
	<br> 
	<div class = "container">
		<div class = "row">
			<div  id = "login" class = "col-md-3 col-md-offset-4">
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
						<label>Log in as: </label>
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

	</div>



</body>
</html>