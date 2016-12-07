<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="parent.css">
<head>
	<title>Parent - View Reports</title>
</head>
<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include "../connection-values.php";
$id = $_GET['id']; 
$school_id = $_GET['school_id']; 
$school_name = $_GET['school_name']; 

$call = $conn->prepare('SELECT * FROM Parents WHERE id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$result = $call->get_result(); 
	$parent = $result->fetch_array(MYSQLI_BOTH);	

} else {
	echo $call->error; 
} 

//getting review


if(!empty($_POST['review'])) {
	$review = $_POST['review']; 
	$call = $conn->prepare('CALL parent_review_school(?, ?, ?)'); 
	$call->bind_param('iis', $id, $school_id, $review);

	if($call->execute()) {
		echo "<div class='panel panel-success'>";
		echo "<div class='panel-heading'><h2>Your review has been posted.<h2></div>";
		echo "</div>";
	} else {
		echo "<div class='panel panel-success'>";
			// echo "<div class='panel-heading'><h2>You have successfully signed up.<h2></div>";
		echo "<div class='panel-body'> <h4> You have already reviewed this school. <h4></div>";
		echo "</div>";
		echo $call->error;
	} 	

}


?>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Radwa and Alaa</a>
			</div>
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="../index.php">Home</a></li>
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
				<p> View your children's schools and write reviews about their performance.</p> 
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
					<li><a href="<?php echo 'parent-view-teachers.php?id=' . $id; ?>">View Teachers</a></li>
					<li  id="active-button" class="active"><a href="<?php echo 'parent-view-schools.php?id=' . $id; ?>">View and Review Schools</a></li>
					<li><a href="<?php echo 'parent-reviews.php?id=' . $id; ?>">All Your Reviews</a></li>
				</ul><br>
				<!-- <div class="input-group">
					<input type="text" class="form-control" placeholder="Search Blog..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div> -->
			</div>

			<div class="col-md-9">
				<?php    
				echo "<h1> $school_name</h1>";
				
				echo "

				<form method = 'post' action = 'parent-write-review.php?id=$id&school_id=$school_id&school_name=$school_name'> 
					<div class='form-group'>
						<label> <b> Write a Review: </b> </label>
						<textarea class='form-control' rows='3' name = 'review' required></textarea>
					</div>
					"; 
					echo "<button type = submit class = 'btn btn-success'> Post </button>";
					echo "
				</form>
				<hr>";


				?>
			</div>
		</div>
	</div>	
</body>
</html>