<!DOCTYPE html>
<?php
	session_start();
?>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetMain.css">
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetForm.css">
		<title>Contact Us</title>
		<a name = "Top"></a>
		<!--Message to be displayed when user clicks submit on form-->
		<script>
			function DisplayMessage()
			{
				window.alert('Thank you for leaving a message, a member of staff will contact you shortly');
			}
		</script>
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
		
		<div class = "ContactInfo" align = "center">
			<h3 align = "center" style = "border-bottom: dotted 1px white;">Contact Us</h3>
			
			<p>There are many way to contact us. You can contact us by using the form below, 
			or alternatively you can contact us by:</br></br>
			Phone: 01 123 4567</br>
			E-mail: Info@library.ie</br></br>
			The Library,</br> 
			Fake Street,</br>
			Dublin 1
			</p>
		</div>
		
		<hr>
		
		<div>
			<form method="post" align="center" class = "LibForm">
				
				<h3>Please enter your details:</h3>
				First Name:</br>
				<input type="text" name="firstname"/>
				</br>
				Last Name:</br>
				<input type="text" name="lastName"/>
				</br>
				Email Address:</br>
				<input type="email" name="address"/>
				</br>
				Phone Number:</br>
				<input type="number" name="phonenumber"/>
				</br>
				Message:</br>
				<textarea name="contact text area" rows="5" cols="52"></textarea>
				</br>
				
				<input type = "submit" value = "Submit" name = "submit" class = "button" onclick="DisplayMessage()"/>
				<input type = "reset" value = "Reset" name = "reset" class = "button"/>
	
			</form>
		</div>
		
		<hr>
		
		<?php 
			include ('Footer.php');
		?>
	</body>
</html>