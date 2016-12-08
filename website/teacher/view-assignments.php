
<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="teacher.css">
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
			background-color: #2BBBAD;
		}
	</style>
	<?php
	include '../connection-values.php'; 
$id = $_GET['id'];
$code = $_GET['code'];
$student_id = $_GET['student_id'];
$assignment = $_GET['assignment'];

if($_SERVER["REQUEST_METHOD"] == "POST") 
	{
		$grade = $_POST['grade'];
		

		$call = $conn->prepare('CALL teacher_grade_solutions(?, ?, ?, ?, ?)'); 
		
		$call->bind_param('iiiii', $id, $student_id, $assignment, $code, $grade); 
		if($call->execute()){
			echo "<br>";
			echo "<br>";
			echo "<div class='panel panel-success'>";
			echo "<div class='panel-heading'><h2>You have successfully graded this solution.<h2></div>";

			echo "</div>";
		} else {
			// echo "<div class='panel panel-danger'>";
			// echo "<div class='panel-heading'><h2>You have already wrote a report about this student on the same day.<h2></div>";

			// echo "</div>";
			echo $call->error; 
			echo "balabizo";
			echo "balabizo";
			echo "balabizo";
			echo "balabizo";
		}

	}	

// if($_SERVER["REQUEST_METHOD"] == "POST") 
// 	{
// 		$grade = $_POST['grade'];
// 		$comment = $_POST['comment'];
// 		$course_code = $_POST['code'];

// 		$call = $conn->prepare('CALL teacher_write_report(?, ?, ?, ?)'); 
		
// 		$call->bind_param('iiss', $id, $ssn, $date, $comment); 
// 		if($call->execute()){
		
// 			echo "<div class='panel panel-success'>";
// 			echo "<div class='panel-heading'><h2>You have successfully posted the report.<h2></div>";

// 			echo "</div>";
// 		} else {
// 			echo "<div class='panel panel-danger'>";
// 			echo "<div class='panel-heading'><h2>You have already wrote a report about this student on the same day.<h2></div>";

// 			echo "</div>";
// 			// echo $call->error; 
// 		}

// 	}	


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

	<?php 
	
	
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

		// echo "<div class='container'>";
		 // echo	"<h1>Course: </h1>";
		$grades ;
		$due_dates;
		$post_dates;
		$contents ;
		$count = 0;
		while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
		{
			$assignments[$count] = $row[0];
			$due_dates[$count] = $row[1];
			$contents[$count] = $row[2];
			$post_dates[$count] = $row[3];
			$count = $count + 1;
		}
		mysqli_stmt_close($stmt);
		if($count != 0)
		{
		$count2 = 0;
		foreach ($assignments as $assignment) 
		{
			echo "<div class = 'container-custom container-fluid'>";
			echo	"<div class='row'>";
			echo	"<div id = 'welcome-panel' class='col-md-7 col-md-offset-1 jumbotron'>";
			// echo "<br>";
			echo	"<h2>Assignment $assignment</h2> <h3> Post Date: $post_dates[$count2]</h3>";
			echo "<h3>Due Date: $due_dates[$count2]</h3>";
			echo "<h4>Content: $contents[$count2]</h4>";
			echo "<h3>Students Who Solved The Assignment</h3>";
			// echo "<h3> Question $q_id: <span style='font-style:italic;'>“$contents[$count2]”</h3></span>";
			// echo  "<h6><span style='font-style:normal;'>$names[$count2]</span></h6>";
			
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
				
				// echo "<br>";
				// echo	"<h2>Assignment $assignment</h2> <h3> Due Date: $due_dates[$count2]</h3>";
				// echo "<h4>Content: $contents[$count2]</h4>";
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

					echo "<td><form method='post' action=".htmlspecialchars($_SERVER["PHP_SELF"])."?id=$id&code=$code&student_id=$student_id&assignment=$assignment\">";
					echo "<div class='form-group'>";
					echo				"<textarea class='form-control' rows='1' required name = 'grade'></textarea>";
					echo			"</div>";
					echo "<button type='submit' class='btn btn-success'>SUBMIT</button>";	
					echo "</form></td>";			
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
			echo "</div>";
			echo "</div>";
			echo "</div>";
			$count2 = $count2 + 1;
		}
	}
	else
{
	echo "<div class = 'container-custom container-fluid'>";
			echo	"<div class='row'>";
			echo	"<div id = 'welcome-panel' class='col-md-7 col-md-offset-1 jumbotron'>";
			// echo "<br>";
			echo	"<h2>NO ASSIGNMENTS HAVE BEEN POSTED YET</h2>";
			echo "</div>";
			echo "</div>";
			echo "</div>";
}
		
	}

	

	?>

</body>
</html>











