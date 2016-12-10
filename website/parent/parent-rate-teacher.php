<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="parent.css">
<head>
	<title>Parent - View Teachers</title>
</head>
<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include "../connection-values.php";
$id = $_GET['id']; 
$teacher_id = $_GET['teacher_id']; 
// echo $id . " " . $teacher_id; 
$call = $conn->prepare('SELECT * FROM Parents WHERE id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$result = $call->get_result(); 
	$parent = $result->fetch_array(MYSQLI_BOTH);	
} else {
	echo $call->error; 
} 
if(!empty($_POST['rating'])) {
	$teacher_rating = $_POST['rating']; 
	$call = $conn-> prepare('CALL parent_rate_teacher(?, ?, ?)');
	$call->bind_param('iii', $id, $teacher_id, $teacher_rating);
	if($call->execute()) {
		echo "<div class='panel panel-success'>";
			echo "<div class='panel-heading'><h2>Your have successfully rated this teacher. <h2></div>";
			echo "</div>";
	}  else {
		
		echo $call->error; 
		echo "<div class='panel panel-success'>";
			// echo "<div class='panel-heading'><h2>You have successfully signed up.<h2></div>";
			echo "<div class='panel-body'> <h4> You have already rated this teacher. You can rate a teacher only once per semester. <h4></div>";
			echo "</div>";
	}
}

//getting teacher's info for later user  
$call->prepare('SELECT E.*, T.exp_years, T.start_date FROM Employees E INNER JOIN Teachers T ON T.id = E.id WHERE E.id = ?'); 
$call->bind_param('i', $teacher_id); 
if($call->execute()) {
	// echo "CALLED"; 
	$result = $call->get_result(); 
	$teacher = $result->fetch_array(MYSQLI_BOTH);	
	$call->close(); 	
} else {
	echo $call->error; 
}
$current_rating = 0; 
if($ratecall = $conn->prepare('CALL view_rating_teacher(?)')) {
	$ratecall->bind_param('i', $teacher_id); 
	if($ratecall->execute()) {
		// echo "CALLED"; 
		$rating = $ratecall->get_result(); 
		if($row = $rating->fetch_array(MYSQLI_BOTH)) {
			$current_rating = $row[1]; 
			// echo $current_rating; 
		}
		$ratecall->close(); 
	} else {
		echo "CALL error 2"; 
		echo $ratecall->error; 
	}
} else {
	echo "FAILED TO PREPARE"; 
	$conn->error;  
}
?>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Radwa and Alaa</a>
			</div>
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="../index.php">Log Out</a></li>
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
				<p> Here you can view your children's educators and rate them. </p> 
			</div>	
		</div>

		
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 sidenav">
				<h4>All You Need In One Place </h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="<?php echo 'parent.php?id=' . $id; ?>">Apply for your Children</a></li>
					<li><a href="<?php echo 'parent-accepted.php?id=' . $id; ?>">View Accepted Applications</a></li>
					<li><a href="<?php echo 'parent-view-reports.php?id=' . $id; ?>">View Reports</a></li>
					<li id="active-button" class="active"><a href="<?php echo 'parent-view-teachers.php?id=' . $id; ?>">View Teachers</a></li>
					<li><a href="<?php echo 'parent-view-schools.php?id=' . $id; ?>">View and Review Schools</a></li>
					<li><a href="<?php echo 'parent-reviews.php?id=' . $id; ?>">All Your Reviews</a></li>
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

			<div class="col-md-9">
				<?php
										echo "<h2> <span class='label label-default'> Teacher's Info</span> </h2> <hr> "; 		
										
											 	echo "
					<div>
						
						<table class = 'table'> 
				
							<thead>
								<tr>
									<th>Teacher Name</th>
									<th>Birthdate </th>
									<th> Teaching since </th>
									<th> Email </th> 
									<th> Average rating </th>
								</tr>
							</thead>
							<tbody> 
								"; 
											echo "<tr> <td> $teacher[2] $teacher[4] </td>"; 	
										
										
										echo " <td> $teacher[10]</td>";
										echo "<td> $teacher[14]</td>";
										echo "<td> $teacher[7] </td>";
										
											echo "<td> <span class='badge'> $current_rating </span> </td> "; 

								echo "</tr>
									</tbody>
									</table>
									</div>
								";

				?>
				<form class = "form-inline" method = "post" action = "parent-rate-teacher.php?id=<?php echo $id; ?>&teacher_id=<?php echo $teacher_id;?>">
					<div class="form-group">
					<button type = "submit" class="btn btn-success"> Rate Teacher </button> <br>
					<br>
						<?php 
						for($i = 1; $i <= 10; $i++) {
						
						echo "<label class='radio-inline'><input type='radio' name='rating' value = $i > <label class = 'bagde'> $i   </label> </label>"; 

						}
						?>
					</div>
					
				</form>
			</div>
		</div>
	</div>	
		</body>
		</html>