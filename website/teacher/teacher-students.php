
<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="../homepage.css">
<head>
	<title>R.A. Inc. </title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<style type="text/css">
		body{
			background-color: #F0FFFF;
		}
	</style>
	<?php $id = $_GET['id']; ?>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Radwa and Alaa</a>
			</div>
			
			<ul class="nav navbar-nav">
				<li><a href="../index.php">Home</a></li>
				<li><a href="../view-schools.php">View Schools</a></li>
				<?php echo "<li><a href='teacher.php?id=$id'>My Homepage</a></li>";?>
			</ul>
			
			<form id = "search-bar"  method = "post" class="navbar-form navbar-right" action = "../search-schools.php">
				<div class="form-group">
					<input  type="text" class="form-control" placeholder="Search schools by name, address or type" name="school">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>

		</div>
	</nav>

	<?php 
	
	include '../connection-values.php'; 
	 // mysqli_close($conn);
	$stmt = mysqli_stmt_init($conn);
	if(!mysqli_stmt_prepare($stmt, 'CALL teacher_grades(?)'))
	{
		print "Failed to prepare statement\n";
	}
	else
	{
		
		mysqli_stmt_bind_param($stmt, "i", $id);
		mysqli_stmt_execute($stmt);
		$result = mysqli_stmt_get_result($stmt);

		echo "<div class='container'>";
		echo	"<h2>My Students</h2>";
		$grades;
		$count = 0;
		while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
		{
			$grades[$count] = $row[0];
			$count = $count + 1;
		}
		mysqli_stmt_close($stmt);

		foreach ($grades as $grade) 
		{
			$stmt2 = mysqli_stmt_init($conn);
			if(!mysqli_stmt_prepare($stmt2, 'CALL teacher_view_students_in_grade(?,?)'))
			{
				print "Failed to prepare statement\n";
			}
			else
			{
				echo	"<table class='table table-hover'>";
				echo	"<thead>";
				echo	"<tr>";
				echo	"<th>Name</th>";
				echo	"<th>ID</th>";
				echo	"<th>Gender</th>";
				echo	"<th>Age</th>";
				echo	"<th>Report</th>";

				echo			"</tr>";
				echo		"</thead>";

				mysqli_stmt_bind_param($stmt2, "ii", $id,$grade);
				mysqli_stmt_execute($stmt2);
				$result2 = mysqli_stmt_get_result($stmt2);
				
				echo "<br>";
				echo	"<h4>Students on grade $grade</h4>";
				echo		"<tbody>";
				

				while ($row = mysqli_fetch_array($result2, MYSQLI_NUM))
				{
					$count = 0;
					$ssn;
					echo "<tr>";

					foreach ($row as $r)
					{
						if($count == 0)
						{
							$ssn = $r;
						}
						else if($count == 1)
						{
							$student_name = $r;
							echo "<td>$r</td>";
						}
						else
						{
							echo "<td>$r</td>";
						}
						$count = $count + 1;
					}
					echo "<td><li><a href='write-report.php?ssn=$ssn&id=$id&student_name=$student_name'>Write Report</a></li></td>";
					echo "</tr>";	
				}
				echo		"</tbody>";
				echo	"</table>";

				mysqli_stmt_close($stmt2);

			}


		}
		echo "</div>";
	}

	

	?>

</body>
</html>
