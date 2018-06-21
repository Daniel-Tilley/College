<?php
	//checks if user is logged in
	if(isset($_SESSION['CurrentUser']))
	{
		//display welcome message if user is logged in
		echo '<span class = "Welcome"> <b> Welcome '. $_SESSION["CurrentUser"] . "!</b>" . "</span>";
		echo'
		<span class = "Welcome">
			<form action = "logout.php" method = "post">
				<input id="button" type="submit" value="Logout" name="logout"/>
			</form>
		</span>';
	}//end if
	
	else 
	{
		//tells user to login if not already logged in
		echo'
		<span class = "Welcome">
			<a href="SignUp.php">
				<button>Sign Up</button>
			</a>
		</span>
		<span class = "Welcome">
			<a href="Login.php">
				<button>Login</button>
			</a>
		</span>';
	}//end else
?>

