<!DOCTYPE html>
<?php
	session_start();
?>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetMain.css">
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetForm.css">
		<title>Find Books</title>
		<a name = "Top"></a>
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
		
		<div align = "center">
			<?php  
				//checks if user is logged in
				if ((isset($_SESSION['logged']) && $_SESSION['logged'] != 0))
				{ 
					//checks if the user is valid or not
					if(isset($_SESSION['CurrentUser']))
					{
						echo '
						These are the available options to search for a book
						</br></br>
						<a href="SearchAut_Tit.php"><button class = "button">Search by Author or Title</button></a>
						<a href="SearchCat.php"><button class = "button">Search by Category</button></a>
						<a href="ViewReserved.php"><button class = "button">View All Reserved Books</button></a>
						';
					}//end inner if
				}//end if 
				
				else 
				{
					echo'
					<div align = "center">
						<p class = "error">You can\'t search for a book without being logged in.</p>
						<a href="Login.php"><button class = "button">Login</button></a>
						<a href="SignUp.php"><button class = "button">Sign Up</button></a>
					</div>
					';
				}//end else
			?>
		</div>
		
		<hr>
		
		<?php 
			include ('Footer.php');
		?>
	</body>
</html>