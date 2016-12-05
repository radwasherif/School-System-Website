<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../bootstrap.css">
<link rel="stylesheet" type="text/css" href="parent.css">
<head>
	<title>Parent - Accepted Applications</title>
</head>
<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include "../connection-values.php";
$id = $_GET['id']; 
// echo $id; 
$call = $conn->prepare('SELECT * FROM Parents WHERE id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$result = $call->get_result(); 
	$parent = $result->fetch_array(MYSQLI_BOTH);	
} else {
	echo $call->error; 
} 
$call->prepare('SELECT POS.child_ssn, S.first_name, S.last_name FROM Parent_Of_Student POS INNER JOIN Students S ON S.ssn = POS.child_ssn WHERE POS.parent_id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$children = $call->get_result(); 
	// while($row = $children->fetch_array(MYSQLI_BOTH)) {
	// 	echo $row[0] . " " . $row[1] . " " . $row[2]; 
	// }	
} else {
	echo $call->error; 
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
				<p> Here you can view the schools who have accepted your children and enroll them in one one of them. </p> 
			</div>	
		</div>

		
	</div>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>All You Need In One Place </h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="<?php echo 'parent.php?id=' . $id; ?>">Apply for your Children</a></li>
					<!--     <li><a href="#section2">Friends</a></li> -->
					<li id="active-button" class="active"><a href="<?php echo 'parent-accepted.php?id=' . $id; ?>">View Accepted Applications</a></li>
					<li><a href="#section3">Photos</a></li>
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
			<div class="col-md-7">
				<?php
					while($row = $children->fetch_array(MYSQLI_BOTH)) {
						echo "<h1>" . $row[1] . " " . $row[2] . "</h1>
						<table class = 'table'> 
								<thead>
								<tr>
        							<th>School Name</th>
        							<th>School Type</th>
        							<th>Fees</th>
        							<th>Enroll </th>
      							</tr>
      							</thead>
      							<tbody> 
						"; 
						if($call2 = $conn->prepare('CALL parent_view_accepted(?, ?)')) {
							$call2->bind_param('ii', $id, $row[0]);	
						 
						 
						if($call2->execute()) {
						$result = $call2->get_result(); 
						while($record = $result->fetch_array(MYSQLI_BOTH)) {
							echo 
							"<tr>
        							<td>$record[0]</td>
        							<td>$record[1]</td>
        							<td>$record[2]</td>
        							<td> <a href='#' class = 'btn btn-success'> Enroll </a>
      						</tr>"; 
							}	
						} else {
							echo $call->error; 
						}
						
					}
				}
					echo "</table>"; 
				?>
			</div>
		</div>
	</div>
</body>
</html>