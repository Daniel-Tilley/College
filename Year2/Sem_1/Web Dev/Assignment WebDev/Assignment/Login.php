<!DOCTYPE HTML>
<?php
	session_start();
?>

<html>
	<head>
		<title>Library Login</title>
		<link rel = "stylesheet" href = "StyleSheets/StyleSheetMain.css">
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetForm.css">
	</head> 
	
	<body>
		<div>
			<h1 align = "center">Welcome to The Library</h1>
		</div>
		
		<?php 
			include ("welcome.php");
			include ('header.php');
			include ('db.php');
		?>
		
		<div align = "center">
			<form method = "post" class = "LibForm">
				<h2>Login To Your Account:</h2>
				Username:</br>
				<input type = "text" name= "username">
				</br>
				Password:</br>
				<input type = "password" name = "password">
				</br></br>
				<input type = "submit" value = "Login" name = "submit" class = "button"/>	
			</form>
			
			<?php	
				//define error Message
				define("<p class = 'error'>ERROR", "There was a problem logging in, Please try again</p>");
				
				//displays user name if already logged in
				if(isset($_SESSION['CurrentUser']))
				{
					echo "Welcome " . $_SESSION['CurrentUser'];
				}//end if
				
				else
				{
					//check if a session is already active
					if($_SESSION['logged']!= 1)
					{
						//check if the user has pressed the submit button
						if (isset($_POST['submit']))
						{ 
							//get username and password from form
							$username = AttackBlock($_POST['username']);
							$password = AttackBlock($_POST['password']);
							$sql = "SELECT * FROM users WHERE UserName = '$username' AND Pass = '$password';";
							
							$result = $db->query($sql);
							
							//check if query can be run
							if ($result) 
							{
								//check if database returns any users 
								if ($result->num_rows > 0) 
								{ 
									$_SESSION['logged'] = 1;
									$_SESSION['CurrentUser'] = $username;
									header('Location: HomePage.php');
								}//end if $result->num_rows > 0
								
								else 
								{	
									echo "<p class = 'error'>"."Incorrect Username / Password</p>";
									$_SESSION['logged'] = 0;
								}//end else
							}//end if $db->query($sql) === TRUE
						
							else  
							{
								echo "<p class = 'error'>Error, There was a problem logging in</p>";
							}//end else						
						}//end if isset($_POST['submit'])		
					}//end if $_SESSION['logged']!= 1
				}//end else	
			?>
		</div>
		
		<hr>
		<?php 
			include('footer.php');
		?> 
	</body>
</html>