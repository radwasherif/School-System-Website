<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="../homepage.css">
<link rel="stylesheet" type="text/css" href="teacher.css">
<head>
	<head>
		<title>R.A. Inc. </title>
	</head>
	<body>

		<?php 
		$id = 0;
		$id = $_GET['id'];
	// echo $id;
		?>
		<style type="text/css">

		</style>

		<nav class="navbar navbar-inverse ">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Radwa and Alaa</a>
				</div>

				<ul class="nav navbar-nav">
					<li><a href="../index.php">Home</a></li>
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

		<style type="text/css">
			body{
				background-color: #2BBBAD;
			}
		</style>
		<div class="container">
		<?php
		echo "<a href='teacher-courses.php?id=$id' class='btn btn-default my-circle-button col-md-4 col-md-offset-2 divider1'><br/>MY<br/>COURSES</a>";
		?>

	<!-- 	<a href='teacher-courses.php?id=$id'>
			<divclass="btn btn-default my-circle-button col-md-4 col-md-offset-2 divider1">
				MY<br/>COURSES<br />
			</div>
		</a> -->
		<?php
		echo "<a href='teacher-students.php?id=$id' class='btn btn-default my-circle-button col-md-4 col-md-offset-2 divider3'><br/>MY<br/>STUDENTS</a>";
		?>
		<!-- <button class="btn btn-default my-circle-button col-md-4 col-md-offset-2 divider1" href="teacher-courses.php?id=$id">MY<br/>COURSES<br /></button> -->
		<!-- <button class="btn btn-default my-circle-button col-md-6 col-md-offset-2 divider3" href="teacher-students.php?id=$id">MY<br/>STUDENTS<br /></button> -->

		</div>
		<br>



	</div>		


</body>
</html>