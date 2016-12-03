include 'connection-values.php'; 
	$username = $password = $usertype = $loginError  = ""; 
	if($_SERVER["REQUEST_METHOD"] == "POST") {
		if(!empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['usertype'])) {
			$username = $_POST['username']; 
			$password = $_POST['password']; 
			$usertype = $_POST['usertype'];  
			$userID; 
			if($usertype == "parent") {
				$call = $conn->prepare('CALL search_parent(?, ?)');
				$call->bind_param(ss, $username, $password); 
				if($call->execute()) {
					echo "You have successfully logged in."; 
					$result = $call->get_result(); 
					$row = $result->fetch_array(MYSQLI_BOTH);
					echo $row['id'];  
					header("Location: parent/parent.php"); 
				} else {
					echo $call->error; 
				}
			}



		}
		else 
		{
			$loginError = "Please fill all required fields";
		}

	}