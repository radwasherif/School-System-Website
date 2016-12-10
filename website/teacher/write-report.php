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
	$ssn = $_GET['ssn'];
	$student_name = $_GET['student_name'];
	if($_SERVER["REQUEST_METHOD"] == "POST") 
	{
		$date = $_POST['date'];
		$comment = $_POST['comment'];
		$course_code = $_POST['code'];

		$call = $conn->prepare('CALL teacher_write_report(?, ?, ?, ?)'); 
		
		$call->bind_param('iiss', $id, $ssn, $date, $comment); 
		if($call->execute()){
		
			echo "<div class='panel panel-success'>";
			echo "<div class='panel-heading'><h2>You have successfully posted the report.<h2></div>";

			echo "</div>";
		} else {
			echo "<div class='panel panel-danger'>";
			echo "<div class='panel-heading'><h2>You have already wrote a report about this student on the same day.<h2></div>";

			echo "</div>";
			// echo $call->error; 
		}

	}	

	?>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Radwa and Alaa</a>
			</div>

			<ul class="nav navbar-nav">
				<li><a href="../index.php">Log Out</a></li>
				<li><a href="../view-schools.php">View Schools</a></li>
				<?php echo "<li><a href='teacher.php?id=$id'>My Homepage</a></li>";?>
				<?php echo "<li><a href='teacher-students.php?id=$id'>All Students</a></li>";?>
			</ul>

			<form id = "search-bar"  method = "post" class="navbar-form navbar-right" action = "../search-schools.php">
				<div class="form-group">
					<input  type="text" class="form-control" 
					placeholder="Search schools by name, address or type" name="school">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>

		</div>
	</nav>
	<br>
	<br>
	<div class = "container-custom container-fluid">
		<div class="row">
			<div id = "welcome-panel" class="col-md-7 col-md-offset-1 jumbotron">

				<h3><?php echo "Student: $student_name"; ?></h3> 
				<!-- <h4><?php echo "Student: $student_name"; ?></h4>  -->
			</div>	
		</div>

	</div>

	<div class="container">
		<div class = "row" class = "center">
			<div id="post-assignment" class = "col-md-6 col-centered">
				<h1> Write A Report</h1> 
				<form method ="post" action = '<?php echo htmlspecialchars($_SERVER["PHP_SELF"])."?id=$id&ssn=$ssn&student_name=$student_name";?>'>

					<!-- <form method="post" action='<?php "teacher-students.php?id=$id&ssn=$ssn&comment=$comment&date=$date&student_name=$student_name";?>'> -->
					<div class="form-group">
						<label>Report Date: </label>

						<input type="date" class="form-control" required name = "date">
					</div>

					<label>Course: </label>
						<select name="school" >
							<!-- <option value="html">html</option>
							<option value="css">CSS</option>
							<option value="javascript">JavaScript</option>
							<option value="php">PHP</option> -->

							<?php
							if($call = $conn->query("SELECT C.code, C.name FROM Courses C INNER JOIN Courses_TaughtTo_Students_By_Teachers CT ON C.code = CT.course_code WHERE CT.student_ssn = $ssn AND CT.teacher_id = $id")) {
								echo "WEEEE!!"; 
								while($row = $call->fetch_array(MYSQLI_BOTH)) {
									echo '<option value ="' . $row["code"] . '">' . $row["name"] . ' </option>'; 
								} 	
							} else {
								echo $call->error; 
							}


							?>
						</select>


					<div class="form-group">
					<br>
						<label>Comment: </label>
						<textarea class="form-control" rows="10" required name = "comment"></textarea>
					</div>
					<br>
					<button type="submit" class="btn btn-default">POST</button>	
				</div>

			</form>
		</div>
	</div>


</body>
</html>


