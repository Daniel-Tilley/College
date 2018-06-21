<!DOCTYPE HTML>
<?php
	session_start();
?>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetMain.css">
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetForm.css">
		<title>Sign Up</title>
		<a name="Top"></a>
	</head>

	<body>
		<div>
			<h1 align = "center">Welcome to The Library</h1>
		</div>
		
		<?php 
			include ("Welcome.php");
			include ('Header.php');
			include('db.php');
		?>
		
		<div>
			<h3 align = "center" style = "border-bottom: dotted 1px white;">Create an Account With Us</h3>
		</div>
		
		<div>
			<form method = "post" align="center" class = "LibForm">
				User Name:<br>
				<input type = "text" name = "user_name" maxlength = "30" >
				<br>
				Password: (Must be 6 characters long)<br>
				<input type = "password" name = "password" maxlength = "6" >
				<br>
				Confirm Password: (Must be 6 characters long)<br>
				<input type = "password" name = "confirm_password" minlenght maxlength = "6">
				<br>
				First Name:<br>
				<input type = "text" name = "first_name" maxlength = "30">
				<br>
				Surname:<br>
				<input type = "text" name = "last_name" maxlength = "30">
				<br>
				Address Line 1:<br>
				<input type = "text" name = "address_line1" maxlength = "30">
				<br>
				Address Line 2:<br>
				<input type = "text" name = "address_line2" maxlength = "30">
				<br>
				City:<br>
				<input type = "text" name = "city" maxlength = "30">
				<br>
				Telephone: (Max 10 digits)<br>
				<input type = "number" name = "telephone" max = "9999999999">
				<br>
				Mobile: (Must be 10 digits)<br>
				<input type = "number" name = "mobile" max = "9999999999"> 
				<br><br>
				
				<input type = "submit" value = "Submit" name = "submit" class = "button"/>
				<input type = "reset" value = "Reset" name = "reset" class = "button"/>
			</form>
		</div>
		
		<?php
			//flag to check for errors
			$GLOBALS['FLAG'] = 0;
			
			//function to display an error
			function display_error($Error)
			{
				echo "<p class = 'error' align = 'center'><b>Error: </b>".$Error."</p>";
				$GLOBALS['FLAG'] = 1;
			}//end display_error
			
			//function to check input from user
			function check_input($input, $Error)
			{
				$input = AttackBlock($input);
				
				if(strlen($input) == 0)
				{
					display_error($Error);
				}//end if
				
				return $input;
			}//end check_input
			
			//checks if form has been submitted by user
			if (isset($_POST['submit']))
			{
				//assign form details to variables and call check funcion
				$user_name = check_input($_POST['user_name'],"User Name is Blank");
				$password = check_input($_POST['password'],"Password id Blank");
				$confirm_password = check_input($_POST['confirm_password'],"Confirm Password is Blank");
				$first_name = check_input($_POST['first_name'],"First Name is Blank");
				$last_name = check_input($_POST['last_name'],"Last Name is Blank");
				$address_line1 = check_input($_POST['address_line1'],"Address Line One is Blank");
				$address_line2 = AttackBlock($_POST['address_line2']);
				$city = check_input($_POST['city'],"City is Blank");
				$telephone = check_input($_POST['telephone'],"Telephone is Blank");
				$mobile = check_input($_POST['mobile'],"Mobile is Blank");
				
				//check lenght of variables
				if(strlen($password) != 6)
				{
					$error = "Password is not the right Lenght";
					display_error($error);
				}//end if 
					
				if(strlen($confirm_password) != 6)
				{
					$error = "Confirm Password is not the right lenght";
					display_error($error);
				}//end if

				//check if telephone is a number
				if (is_numeric($telephone))
				{
					$telephone = (string)$telephone;
					
					//checks lenght of telephone
					if (strlen($telephone) > 10)
					{
						$error = "Telephone is not the right lenght";
						display_error($error);
					}//end if 
					
					$telephone = (int)$telephone;
				}//end if 
				
				else
				{
					$error = "Telephone is not a number";
					display_error($error);
				}//end else
				
				//check if mobile is a number
				if (is_numeric($mobile))
				{
					$mobile = (string)$mobile;
					
					//checks lenght of mobile
					if (strlen($mobile) != 10)
					{
						$error = "Mobile is not the right lenght";
						display_error($error);
					}//end if 
					
					$mobile = (int)$mobile;
				}//end if
				
				else
				{
					$error = "Mobile is not a number";
					display_error($error);
				}//end else
				
				if($GLOBALS['FLAG'] == 0)
				{
					if ($password == $confirm_password)
					{
						//assign sql statement into sql variable and also checks for special chars and changes if there are any
						$sql = "
						INSERT INTO users SET
						UserName    	= '". mysql_real_escape_string($user_name) ."',
						Pass    		= '". mysql_real_escape_string($password) ."',
						FirstName 		= '". mysql_real_escape_string($first_name) ."',
						Surname   		= '". mysql_real_escape_string($last_name) ."',
						Address1		= '". mysql_real_escape_string($address_line1) ."',
						Address2	   	= '". mysql_real_escape_string($address_line2) ."',
						City		   	= '". mysql_real_escape_string($city) ."',
						Telephone		= '". mysql_real_escape_string($telephone) ."',
						Mobile	    	= '". mysql_real_escape_string($mobile) ."'
						;";
					
						$result = $db->query($sql);
						
						//check if the statement can be run
						if($result)
						{
							//run sql query
							mysql_query($sql);
							
							//display sucess message
							echo 
							("
							<SCRIPT LANGUAGE='JavaScript'>
								window.alert('Succesfully Created Account')
								window.location.href='Login.php';
							</SCRIPT>
							");
						}//end if $result
						
						else
						{
							$error = $db->error;
							
							//check for existing user name
							if($error == "Duplicate entry '".$user_name."' for key 'PRIMARY'")
							{
								$error = "UserName already taken, please try a differnt UserName";
							}//end if 
							
							display_error($error);
						}//end else
					}//end $password == $confirm_password
					
					else
					{
						$error = "Passwords do not match";
						display_error($error);
					}//end else
				}//end if
			}//end if isset
		?>
		<hr>
	</body>
	
	<?php 
		include ('Footer.php');
		
		//kill the page if errors remain
		if($GLOBALS['FLAG'] == 1)
		{
			die;
		}//end if
	?>
</html>