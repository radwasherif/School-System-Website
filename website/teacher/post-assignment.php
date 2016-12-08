<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="teacher.css">
	<head>
		<title>R.A. Inc. </title>
	</head>
	<body>
		<?php
		include '../connection-values.php'; 
		$id = $_GET['id'];
		$code = $_GET['code'];
		$name = $_GET['name'];
		$grade = $_GET['grade'];
		$assignmentnumber = $postdate = $duedate = $content = "";
		if($_SERVER["REQUEST_METHOD"] == "POST") 
		{
			$assignmentnumber= $_POST['assignmentnumber'];
			$postdate = $_POST['postdate'];
			$duedate = $_POST['duedate'];
			$content = $_POST['content'];

			if($postdate < date("Y-m-d"))
			{
				echo "<br>";
					echo "<br>";
					echo "<div class='panel panel-danger'>";
					echo "<div class='panel-heading'><h2>You can not post assignment with this post date.<h2></div>";
					echo "<div class='panel-body'> <h4>Please choose current or upcoming date for posting this assignment. <h4></div>";
					echo "</div>";	
			}
			else if($duedate < date("Y-m-d"))
			{
				echo "<br>";
					echo "<div class='panel panel-danger'>";
					echo "<div class='panel-heading'><h2>You can not post assignment with this due date.<h2></div>";
					echo "<div class='panel-body'> <h4>Please choose current or upcoming date for submitting this assignment. <h4></div>";
					echo "</div>";	
			}
			else
			{

								$call2 = $conn->prepare('CALL teacher_post_assignment(?, ?, ?, ?, ?, ?)'); 
					$call2->bind_param('iisssi', $id, $code, $postdate, $duedate, $content, $assignmentnumber); 
					if($call2->execute()){
						echo "hiiiiiii";
						echo "<br>";
						echo "<br>";
						echo "<div class='panel panel-success'>";
						echo "<div class='panel-heading'><h2>You have successfully posted the assignment.<h2></div>";

						echo "</div>";
					} else {
					echo "<br>";
					echo "<br>";
					echo "<div class='panel panel-danger'>";
					echo "<div class='panel-heading'><h2>Assignemnt with the same number already exists in this course.<h2></div>";
					echo "<div class='panel-body'> <h4>Please enter a valid assignment number. <h4></div>";
					echo "</div>";	
					}

		}
		}	

		?>
		
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Radwa and Alaa</a>
				</div>

				<ul class="nav navbar-nav">
					<li><a href="../index.php">Home</a></li>
					<li><a href="../view-schools.php">View Schools</a></li>
					<?php echo "<li><a href='teacher.php?id=$id'>My Homepage</a></li>";?>
					<?php echo "<li><a href='course-info.php?id=$id&code=$code'>Course Main Page</a></li>";?>
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
				<div id = "welcome-panel" class="col-md-7 col-md-offset-1 jumbotron">
					<h3><?php echo "Course: $name"; ?></h3> 
					<h4>grade: <?php echo $grade; ?> </h4>
				</div>	
			</div>

		</div>

		<div class="container">
			<div class = "row" class = "center">
				<div id="post-assignment" class = "col-md-6 col-centered">
					<h1> Post An Assignment </h1> 
					<form method="post" action='<?php echo htmlspecialchars($_SERVER["PHP_SELF"])."?id=$id&code=$code&name=$name&grade=$grade";?>'>
						<div class="form-group">
							<label>Assignemnt Number: </label>
							<input type="text" class="form-control" required  placeholder="Assignemnt No." name = "assignmentnumber">
						</div>

						<div class="form-group">
							<label>Post Date: </label>

							<input type="date" class="form-control" name = "postdate">

						</div>
						<div class="form-group">
							<label>Due Date: </label>

							<input type="date" class="form-control" required name = "duedate">
						</div>
						<div class="form-group">
							<label>Content: </label>
							<textarea class="form-control" rows="10" required name = "content"></textarea>
						</div>
						<br>
						<button type="submit" class="btn btn-default">POST</button>	
					</div>
					
				</form>
			</div>
		</div>


	</body>
</html>