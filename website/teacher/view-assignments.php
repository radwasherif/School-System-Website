
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
	<?php
$id = $_GET['id'];
$code = $_GET['code'];
?>
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
	if(!mysqli_stmt_prepare($stmt, 'CALL teacher_assignments(?,?)'))
	{
		print "Failed to prepare statement\n";
	}
	else
	{
		
		mysqli_stmt_bind_param($stmt, "ii", $id,$code);
		mysqli_stmt_execute($stmt);
		$result = mysqli_stmt_get_result($stmt);

		echo "<div class='container'>";
		 // echo	"<h1>Course: </h1>";
		$grades ;
		$due_dates;
		$contents ;
		$count = 0;
		while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
		{
			$assignments[$count] = $row[0];
			$due_dates[$count] = $row[1];
			$contents[$count] = $row[2];
			$count = $count + 1;
		}
		mysqli_stmt_close($stmt);
		$count2 = 0;
		foreach ($assignments as $assignment) 
		{
			
			$stmt2 = mysqli_stmt_init($conn);
			if(!mysqli_stmt_prepare($stmt2, 'CALL teacher_view_solutions(?,?,?)'))
			{
				print "Failed to prepare statement\n";
			}
			else
			{
				echo	"<table class='table table-hover'>";
				echo	"<thead>";
				echo	"<tr>";
				echo	"<th>ID</th>";
				echo	"<th>Name</th>";
				echo	"<th>Soltion</th>";
				echo	"<th>Grade</th>";
				// echo	"<th>Report</th>";

				echo			"</tr>";
				echo		"</thead>";

				mysqli_stmt_bind_param($stmt2, "iii", $id,$assignment,$code);
				mysqli_stmt_execute($stmt2);
				$result2 = mysqli_stmt_get_result($stmt2);
				
				echo "<br>";
				echo	"<h2>Assignment $assignment</h2> <h3> Due Date: $due_dates[$count2]</h3>";
				echo "<h4>Content: $contents[$count2]</h4>";
				echo		"<tbody>";
				

				while ($row = mysqli_fetch_array($result2, MYSQLI_NUM))
				{
					$count = 0;
					$student_name;
					$student_id;
					$solution;
					echo "<tr>";

					foreach ($row as $r)
					{
						if($count == 0)
						{
							$student_name = $r;
						}
						else if($count == 1)
						{
							$student_id = $r;
							
						}
						else
						{
							$solution = $r;
							
						}
						$count = $count + 1;
					}
					echo "<td>$student_id</td>";
					echo "<td>$student_name</td>";
					echo "<td>$solution</td>";
					// echo "<td><li><a href='grade-assignment.php?ssn=$ssn&id=$id&student_name=$student_name'>Write Report</a></li></td>";
					// action= \"htmlspecialchars($_SERVER["PHP_SELF\"])?id=$id&code=$code&assignmentnumber=$assignment&student_id=$student_id&grade=$grade\">
					// <textarea class='form-control' rows='1' name = 'grade'></textarea><button type='submit' class='btn btn-default'>SUBMIT</button></td>";
					// echo "<td><li><a href='write-report.php?ssn=$ssn&id=$id&student_name=$student_name'>Write Report</a></li></td>";
					echo "</tr>";	
				}
				echo		"</tbody>";
				echo	"</table>";

				mysqli_stmt_close($stmt2);

			}

			$count2 = $count2 + 1;
		}
		echo "</div>";
	}

	

	?>

</body>
</html>











