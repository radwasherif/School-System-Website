<!DOCTYPE html>

<html>
<head>
	<title>Radwa and Alaa's School Directory</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<?php 
	include 'connection-values.php'; 
	?>

	<?php
	$stmt = mysqli_stmt_init($conn);
	if(!mysqli_stmt_prepare($stmt, 'CALL view_school_by_level(?)'))
	{
		print "Failed to prepare statement\n";
	}
	else
	{
		mysqli_stmt_bind_param($stmt, "s", $level);

		$level_array = array('elementary','middle','high');
		foreach($level_array as $level)
		{
			mysqli_stmt_execute($stmt);
			$result = mysqli_stmt_get_result($stmt);
			<html>
			<div class="container">
				<h2>$level.Schools</h2>
				<p>The .table-hover class enables a hover state on table rows:</p>            
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Type</th>
							<th>details</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
						{
							<tr>
								foreach ($row as $r)
								{
									<td>$r</td>	       
								}
							</tr>
						}
						?>
					</tbody>
				</table>
			</div>
			</html>  
		}
	}
	mysqli_stmt_close($stmt);
	?>



</body>
</html>
