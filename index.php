	<!DOCTYPE html>
	<html>
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
	<link rel="stylesheet" type="text/css" href="homepage.css">
	<head>
		<title>Parent</title>
	</head>
	<body>
		<?php ?> 
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Radwa and Alaa</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">View Schools</a></li>
				</ul>
				<form class="navbar-form navbar-left" action = "search.php">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search schools by name, address or type" name="school">
					</div>
					<button type="submit" class="btn btn-default">Search</button>
				</form>
			</div>
		</nav>

		<div class = "container">
			<div class = "row" class = "center">
				<div class = "col-md-4 col-md-offset-4">
					<h1>Log in</h1>
					<form method="post" action="signup.php">
						<div class="form-group">
							<label>Username: </label>
							<input type="text" class="form-control" placeholder="username" name = "username">
						</div>

						<div class="form-group">
							<label> Password: </label>
							<input type="text" class="form-control" placeholder="password" name = "password">
						</div>

						<div class = "form-group">
							<label>Sign in as </label>
							<label class = "radio-inline">
								<input type="radio" name = "usertype" value = "teacher"> teacher
							</label>

							<label class = "radio-inline">
								<input type="radio" name = "usertype" value = "parent"> parent
							</label>
							<br>
							<button type="submit" class="btn btn-default">Login</button>
						</div>

					</form>
				</div>
			</div>
			<div class = "row" class = "center">
				<div class = "col-md-4 col-md-offset-1">
					<h1> Sign Up As A Teacher </h1> 
					<form>
						<div class="form-group">
							<label>First name: </label>
							<input type="text" class="form-control" placeholder="First name" name = "fname">
						</div>

						<div class="form-group">
							<label>Middle name: </label>
							<input type="text" class="form-control" placeholder="Middle name" name = "mname">
						</div>
						<div class="form-group">
							<label>Last name: </label>
							<input type="text" class="form-control" placeholder="Last name" name = "lname">
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
							<label>Birthdate: </label>
							<input type="date" class="form-control" name = "birthdate">
						</div>
						<div class = "form-group">
							<label>Gender: </label>
							<label class = "radio-inline">
								<input type="radio" name = "gender"> female
							</label>

							<label class = "radio-inline">
								<input type="radio"> male
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
		</div>
	</body>
	</html>