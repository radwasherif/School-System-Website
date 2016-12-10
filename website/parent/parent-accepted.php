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

//enrolling a child from previous call of enroll 
if(!empty($_GET['enroll_id']) && !empty($_GET['child_ssn'])) {
	$child_ssn = $_GET['child_ssn']; 
	$enroll_id = $_GET['enroll_id']; 
	$school_id; 
	// echo $enroll_id . " " . $child_ssn;
	$call = $conn->prepare('SELECT S.school_id FROM Students S WHERE S.ssn = ?'); 
	$call->bind_param('i', $child_ssn); 
	if($call->execute()) {
		$result = $call->get_result(); 
		if($row = $result->fetch_array(MYSQLI_BOTH)) {
			$school_id = $row[0]; 
			echo $school_id;
		}
	} else {
		echo $call->error;
	}
	if($school_id === NULL) {
		$call = $conn->prepare('CALL parent_enroll_child(?, ?, ?)');
		$call->bind_param('iii', $id, $child_ssn, $enroll_id);
		if($call->execute()) {
			echo "<div class='panel panel-success'>";
			echo "<div class='panel-heading'><h2>Your have successfully enrolled your child.<h2></div>";
			echo "</div>";
		} else {
			echo $call->error;
		} 	
	} else {
		echo "<div class='panel panel-success'>";
			// echo "<div class='panel-heading'><h2>You have successfully signed up.<h2></div>";
			echo "<div class='panel-body'> <h4> This child is already enrolled in a school. <h4></div>";
			echo "</div>";
	}
	
}
//getting parent's name for welcome sign
$call = $conn->prepare('SELECT * FROM Parents WHERE id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$result = $call->get_result(); 
	$parent = $result->fetch_array(MYSQLI_BOTH);	
} else {
	echo $call->error; 
} 

//getting child's info for later user  
$call->prepare('SELECT POS.child_ssn, S.first_name, S.last_name, S.school_id FROM Parent_Of_Student POS INNER JOIN Students S ON S.ssn = POS.child_ssn WHERE POS.parent_id = ?'); 
$call->bind_param('i', $id); 
if($call->execute()) {
	$children = $call->get_result(); 
	$call->close(); 	
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
				<p> Here you can view the schools who have accepted your children and enroll them in one of them. </p> 
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
					<li><a href="<?php echo 'parent-view-reports.php?id=' . $id; ?>">View Reports</a></li>
					<li><a href="<?php echo 'parent-view-teachers.php?id=' . $id; ?>">View Teachers</a></li>
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
			<div class="col-md-7">
				<?php
					while($row = $children->fetch_array(MYSQLI_BOTH)) {
						// echo $row[0];
						echo "
						<div>
						
						<table class = 'table'> 
						<h1> $row[1]  $row[2] </h1>
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
						if($call = $conn->prepare('CALL parent_view_accepted(?, ?)')) {
							$call->bind_param('ii', $id, $row[0]);	
						 
						 
						if($call->execute()) {
							// echo "CALLED PROCEDURE"; 
						$result = $call->get_result(); 
						while($record = $result->fetch_array(MYSQLI_BOTH)) {
							echo 
							"<tr> 
        							<td>$record[0]</td>
        							<td>$record[1]</td>
        							<td>$record[2]</td>
        							<td> <a href = 'parent-accepted.php?id=$id&child_ssn=$row[0]&enroll_id=$record[3]&school_id=$row[3]' class = 'btn btn-success' > Enroll </a>
      						</tr>"; 
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
				}
					echo "</table>
						</div> 
					"; 
				?>
			</div>
		</div>
	</div>
</body>
</html>