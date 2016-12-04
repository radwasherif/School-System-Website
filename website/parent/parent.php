<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="parent.css">
<head>
	<title>Parent Home</title>
</head>
<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include "../connection-values.php"; 
$id = $_GET['id']; 
$call = $conn->prepare('SELECT * FROM Parents WHERE id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$result = $call->get_result(); 
	$parent = $result->fetch_array(MYSQLI_BOTH);	
} else {
	echo $call->error; 
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
	<div class = "container-custom container-fluid">
		<div class="row">
			<div class="col-md-3 ">
				<img id = "logo" src="parent-icon.png" class="img-responsive img-circle margin" width = "300" height="300">	

			</div>
			<div id = "welcome-panel" class="col-md-7 col-md-offset-1 jumbotron">
				<h1>Welcome, <?php echo $parent['first_name']; ?>!</h1> 
				<h3>We are here to help you take care of your children's education.</h3>
				<p>Now you can follow their educational process day-by-day, all in one place. </p> 
			</div>	
		</div>

		
	</div>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>All You Need In One Place </h4>
				<ul class="nav nav-pills nav-stacked">
					<li id="active-button" class="active"><a href="#section1">Apply for your Children</a></li>
					<!--     <li><a href="#section2">Friends</a></li> -->
					<li><a href="#section3">Family</a></li>
					<li><a href="#section3">Photos</a></li>
				</ul><br>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search Blog..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
			<div class="col-sm-4 col-md-offset-2">
			 <h1> Apply Now! </h1> 
			<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
					<div class="form-group">
						<label>First name: </label>
						<!-- <span class="error"><?php echo"<font color='red'>* $fnameErr </font>";?></span> -->
						<input type="text" class="form-control" placeholder="First name" name = "fname">
					</div>

					<div class="form-group">
						<label>Middle name: </label>
						<input type="text" class="form-control" placeholder="Middle name" name = "mname">
					</div>
					<div class="form-group">
						<label>Last name: </label>
						<!-- <span class="error"><?php echo"<font color='red'>* $lnameErr </font>";?></span> -->
						<input type="text" class="form-control" placeholder="Last name" name = "lname">		
					</div>
					<div class="form-group">
						<label>Child Social Security Number: </label>
						<!-- <span class="error"><?php echo "<font color='red'>* $emailErr </font>";?></span> -->
						<input type="text" class="form-control" placeholder="Child's SSN" name = "ssn">
					</div>
					<div class="form-group">
						<label>Birthdate: </label>
						<!-- <span class="error"><?php echo "<font color='red'>* $birthdateErr </font>";?></span> -->
						<input type="date" class="form-control" name = "birthdate">

					</div>
					<div class = "form-group">
						<label>Gender: </label>
						<!-- <span class="error"><?php echo "<font color='red'>* $genderErr </font>";?></span> -->
						<label class = "radio-inline">
							<input type="radio" name = "gender" value = "female"> female
						</label>

						<label class = "radio-inline">
							<input type="radio" name = "gender" value = "male"> male
						</label>
						<br>
						<label>Apply in: </label>
						<select name="school" >
							<!-- <option value="html">html</option>
							<option value="css">CSS</option>
							<option value="javascript">JavaScript</option>
							<option value="php">PHP</option> -->

							<?php
							if($call = $conn->query("SELECT S.id, S.name FROM Schools S")) {
								echo "WEEEE!!"; 
								while($row = $call->fetch_array(MYSQLI_BOTH)) {
									echo '<option value ="' . $row["id"] . '">' . $row["name"] . ' </option>'; 
								} 	
							} else {
								echo $call->error; 
							}


							?>
						</select>
						<br>
						
					</div>
					<button type="submit" class="btn btn-default btn-success">Apply</button>
				</form>	
			</div>
			
		</div>
	</div>


		</body>
		</html>