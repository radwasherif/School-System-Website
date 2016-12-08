<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="teacher.css">
<head>
	<head>
		<title>R.A. Inc. </title>
	</head>
	<body>
		<?php
		include '../connection-values.php'; 
		$code = $_GET['code'];
		$teacher_id = $_GET['id'];
		$stmt = mysqli_stmt_init($conn);
		if(!mysqli_stmt_prepare($stmt, 'SELECT * from Courses C WHERE C.code = ?;'))
	{
		print "Failed to prepare statement\n";
	}
	else
	{
		
		mysqli_stmt_bind_param($stmt, "i", $code);
		mysqli_stmt_execute($stmt);
		$result = mysqli_stmt_get_result($stmt);

		while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
		{
			$name = $row[1];
			$description = $row[2];
			$grade = $row[3];
			$level = $row[4];
		}
	}
		?>

		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Radwa and Alaa</a>
			</div>
			
			<ul class="nav navbar-nav">
				<li><a href="../index.php">Home</a></li>
				<li><a href="../view-schools.php">View Schools</a></li>
				<?php echo "<li><a href='teacher.php?id=$teacher_id'>My Homepage</a></li>";?>
				<?php echo "<li><a href='teacher-courses.php?id=$teacher_id'>All Courses</a></li>";?>
			</ul>
			
			<form id = "search-bar"  method = "post" class="navbar-form navbar-right" action = "../search-schools.php">
				<div class="form-group">
					<input  type="text" class="form-control" placeholder="Search schools by name, address or type" name="school">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>

		</div>
	</nav>

	<style type="text/css">
			/*body{
				background-color: #2BBBAD;
			}*/
		</style>
		<div class = "container-custom container-fluid">
		<div class="row">
			<div id = "welcome-panel" class="col-md-7 col-md-offset-1 jumbotron">
				<h1><?php echo $name; ?></h1> 
				<h3><?php echo $description; ?></h3>
				<h4>course code: <?php echo $code; ?> </h4>
				<h4>grade: <?php echo $grade; ?> </h4>
				<h4>level: <?php echo $level; ?></h4>
			</div>	
		</div>
	
	</div>
<div class="container">
		<?php
		echo "<a href='post-assignment.php?id=$teacher_id&code=$code&name=$name&grade=$grade' class='btn btn-default my-circle-button2 col-md-4 col-md-offset-2 divider6'><br/>POST<br/><br/>ASSIGNMENT</a>";
		?>

		<?php
		echo "<a href='view-assignments.php?id=$teacher_id&code=$code' class='btn btn-default my-circle-button2 col-md-4 col-md-offset-2 divider5'><br/>VIEW<br/><br/>ASSIGNMENTS</a>";
		?>
		<?php
		echo "<a href='view-questions.php?id=$teacher_id&code=$code' class='btn btn-default my-circle-button2 col-md-4 col-md-offset-2 divider4'><br/>VIEW<br/><br/>QUESTIONS</a>";
		?>
		

		</div>



	</body>
</head>
</html>






