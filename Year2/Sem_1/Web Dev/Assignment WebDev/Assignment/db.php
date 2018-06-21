<?php
	//stop php from displaying errors
	ini_set('display_errors', '0');
	
	//define variables
	$host = "localhost";
	$user = "root";
	$pass = "";
	$database = "webdevlib";
	
	//create connection
	$db = mysqli_connect($host,$user,$pass,$database);
	
	//check connection
	if(mysqli_connect_errno($db))
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
		exit();
	}//end if
	
	//stops user from hacking db
	function AttackBlock($input)
	{
		$input = trim($input);
		$input = stripslashes($input);
		$input = htmlspecialchars($input);
		return $input;
	}//end Attack Block
?>