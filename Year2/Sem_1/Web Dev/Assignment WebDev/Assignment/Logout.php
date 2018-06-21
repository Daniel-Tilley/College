<?php
	session_start();
	
	//checks if session can be terminated
	if(session_destroy())
	{	
		//sets login key back to 0
		$_SESSION['logged'] = 0;
		
		//returns user to homepage
		header ("Location: Homepage.php");
	}//end if
	
	else 
	{
		echo "Failed to logout";
	}//end else
	
	//close the database
	mysqli_close($db);
?>