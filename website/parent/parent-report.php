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

$call = $conn->prepare('SELECT * FROM Parents WHERE id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$result = $call->get_result(); 
	$parent = $result->fetch_array(MYSQLI_BOTH);	

} else {
	echo $call->error; 
} 

//getting report reply 

if(!empty($_GET['child_ssn']) && !empty($_GET['teacher_id']) && !empty('report_date')) {
	$child_ssn = $_GET['child_ssn']; 
	$first_name = $_GET['first_name']; 
	$last_name = $_GET['last_name']; 
	$teacher_id = $_GET['teacher_id']; 
	$report_date = $_GET['report_date']; 
	$teacher_fname = $_GET['teacher_fname']; 
	$teacher_lname = $_GET['teacher_lname']; 
	if(!empty($_POST['reply'])) {
		$reply = $_POST['reply']; 
		$call = $conn->prepare('CALL parent_reply_report(?, ?, ?, ?, ?)'); 
		$call->bind_param('isiis', $id, $reply, $child_ssn, $teacher_id, $report_date); 
		if($call->execute()) {
				echo "<div class='panel panel-success'>";
				echo "<div class='panel-heading'><h2>Your reply has been sent.<h2></div>";
				echo "</div>";
			} else {
				echo $call->error;
			} 	
		
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
				<p> Here you can view all the reports written about your children by their teacher - <em>all in one place</em>! </p> 
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
					<li id="active-button" class="active"><a href="<?php echo 'parent-view-reports.php?id=' . $id; ?>">View Rerports</a></li>
					<li><a href="<?php echo 'parent-view-teachers.php?id=' . $id; ?>">View Teachers</a></li>
					<li><a href="<?php echo 'parent-view-schools.php?id=' . $id; ?>">View and Review Schools</a></li>
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
		
						if($call = $conn->prepare('SELECT R.comment FROM Reports R WHERE R.student_ssn = ? AND R.teacher_id = ? AND R.report_date = ?')) {
							// echo "YALAHWYYYY";
							$call->bind_param('iis', $child_ssn, $teacher_id, $report_date);	

							if($call->execute()) {

								$result = $call->get_result(); 
								while($record = $result->fetch_array(MYSQLI_BOTH)) {
									echo "
						<h1><span class='label label-default'>$first_name $last_name </span></h1>
						"; 
									echo "<p> <h2><em> $record[0] </em> </h2> </p>"; 
									echo "<h6> Post by $teacher_fname $teacher_lname on $report_date.</h6>";
									echo "
									<form method = 'post' action = 'parent-report.php?id=$id&child_ssn=$child_ssn&first_name=$first_name&last_name=$last_name&teacher_id=$teacher_id&teacher_fname=$teacher_fname&teacher_lname=$teacher_lname&report_date=$report_date'> 
									<div class='form-group'>
									  <label>Reply: </label>
									  <textarea class='form-control' rows='3' name = 'reply' required></textarea>
									</div>
									"; 
									echo "<button type = submit class = 'btn btn-success'> Reply </button>";
									echo "
									</form>
									<hr>";
								}
								$call->close(); 	
							} else {
								echo $call->error; 
							}

						} else {
						// echo "YA5TAAAAY\t";
						// echo $id . " " . $row[0];  
							echo $conn->error; 
						}
						echo "<br>"; 
				 

				?>
			</div>
		</div>
	</div>	
</body>
</html>