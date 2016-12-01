<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="/var/www/html/School-System-Website/website/homepage.css">
<head>
	<title>Radwa and Alaa's School Directory</title>
</head>
<body>	
<?php
	include 'connection-values.php'; 

		$username = $password = $usertype = $loginError  = ""; 
		if($_SERVER["REQUEST_METHOD"] == "POST") { 
			$loginError = "Please make sure you enter a valid username and password."; 
			if(!empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['user-type'])) {
				$username = $_POST['username']; 
				$password = $_POST['password']; 
				$usertype = $_POST['user-type']; 
								
			}

		}
?> 

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
			<img src="resources/school-icon.png" class="img-responsive img-circle margin" style="display:inline margin:auto; " width = "300" height="300">	
			<div class="homepage-banner jumbotron">
    			<h1>Radwa and Alaa's School Directory</h1> 
    			<p>We help you choose the best for your children.</p> 
  			</div>
		</div>
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
							<span class="error">* <?php echo $genderErr;?></span>
							<label class = "radio-inline">
								<input type="radio" name = "user-type" value = "parent"> parent
							</label>

							<label class = "radio-inline">
								<input type="radio" name = "user-type" value = "teacher"> teacher
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