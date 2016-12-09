
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
	<?php $id = $_GET['id'];?>
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
	if(!mysqli_stmt_prepare($stmt, 'CALL teacher_view_courses(?)'))
	{
		print "Failed to prepare statement\n";
	}
	else
	{  
		mysqli_stmt_bind_param($stmt, "i", $id);
		mysqli_stmt_execute($stmt);
		echo $stmt->error; 
		$result = mysqli_stmt_get_result($stmt);

		echo "<div class='container'>";
		echo	"<h2>My Courses</h2>";
		echo	"<table class='table table-hover'>";
		echo		"<thead>";
		echo			"<tr>";
		echo			"<th>Course Name</th>";
		echo				"<th>Level</th>";
		echo				"<th>Grade</th>";
		echo			"</tr>";
		echo		"</thead>";
		echo		"<tbody>";

		while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
		{  
			echo "<tr>";
			$count = 0;
			$code;
			foreach ($row as $r)
			{
				if($count == 0)
				{
					$code = $r;
				}
				else if($count == 1)
				{
					echo "<td><li><a href='course-info.php?code=$code&id=$id'>$r</a></li></td>";
				}
				else
				{
					echo "<td>$r</td>";
				}
				$count = $count + 1;
			}
			echo "</tr>";
		}

		echo		"</tbody>";
		echo	"</table>";
		echo "</div>"; 
		mysqli_stmt_close($stmt);
	}
		?>

	</body>
	</html>
