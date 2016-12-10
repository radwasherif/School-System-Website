
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
	$answered_q_id = $_GET['q_id'];

	if($_SERVER["REQUEST_METHOD"] == "POST") 
		{
			$answer= $_POST['answer'];
					$call2 = $conn->prepare('CALL teacher_answer_questions(?, ?, ?, ?)'); 
					$call2->bind_param('iiis', $id, $code, $answered_q_id, $answer); 
					if($call2->execute()){
						
						echo "<br>";
						echo "<br>";
						echo "<div class='panel panel-success'>";
						echo "<div class='panel-heading'><h2>Your answer was submitted successfully.<h2></div>";

						echo "</div>";
					} else {
					// echo "<br>";
					// echo "<br>";
					// echo "<div class='panel panel-danger'>";
					// echo "<div class='panel-heading'><h2>The answer you've submitted was empty.<h2></div>";
					// echo "<div class='panel-body'> <h4>Please enter a valid answer. <h4></div>";
					// echo "</div>";	
					 echo "balabizooo";	
					 // echo "balabizooo";
					 // echo "balabizooo";
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
	if(!mysqli_stmt_prepare($stmt, 'CALL teacher_view_questions(?,?)'))
	{
		print "Failed to prepare statement\n";
	}
	else
	{
		
		mysqli_stmt_bind_param($stmt, "ii", $id,$code);
		mysqli_stmt_execute($stmt);
		$result = mysqli_stmt_get_result($stmt);

		$question_ids;
		$contents;
		$names;
		$count = 0;
		while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
		{
			$question_ids[$count] = $row[0];
			$contents[$count] = $row[1];
			$names[$count] = $row[2];
			$count = $count + 1;
		}
		mysqli_stmt_close($stmt);
		
		$count2 = 0;
		if($count != 0)
		{
		foreach($question_ids as $q_id)
		{
			echo "<div class = 'container-custom container-fluid'>";
			echo	"<div class='row'>";
			echo	"<div id = 'welcome-panel' class='col-md-7 col-md-offset-1 jumbotron'>";

			echo "<h3> Question $q_id: <span style='font-style:italic;'>“$contents[$count2]”</h3></span>";
			echo  "<h6><span style='font-style:normal;'>$names[$count2]</span></h6>";


			if($call = $conn->query("SELECT A.answer_sub_id, A.answer, CONCAT_WS ('',E.first_name ,' ',E.last_name)AS teacher_name FROM Answers A INNER JOIN Employees E ON A.teacher_id = E.id WHERE A.q_id = $q_id AND A.course_code = $code")) {
								// echo "WEEEE!!"; 
				while($row = $call->fetch_array(MYSQLI_BOTH))
				{
					echo "<div class = 'container-custom2 container-fluid'>";
					echo "<span style='font-style:italic;'>Answer $row[0]: </span> $row[1] <h6 style='font-style:italic;'>--$row[2]</h6>";
					echo "</div>"; 	
					echo "<br>";
				} 	
			} else {
				echo $call->error; 
			}

			echo "<form method='post' action=".htmlspecialchars($_SERVER["PHP_SELF"])."?id=$id&code=$code&q_id=$q_id>";
			echo "<div class='form-group'>";
			echo				"<label>Write Answer: </label>";
			echo				"<textarea class='form-control' rows='2' required name = 'answer'></textarea>";
			echo			"</div>";
			echo "<button type='submit' class='btn btn-success'>ANSWER</button>";	
			echo "</form>";			


			echo		"</div>";	
			echo 	"</div>";

			echo "</div>";

			$count2++;
		}
	}
	else
	{
		echo "<div class = 'container-custom container-fluid'>";
			echo	"<div class='row'>";
			echo	"<div id = 'welcome-panel' class='col-md-7 col-md-offset-1 jumbotron'>";

			echo "<h3>NO QUESTIONS HAVE BEEN ASKED YET</h3>";
			echo		"</div>";	
			echo 	"</div>";

			echo "</div>";
	}

	}	

	?>	



</body>
</html>