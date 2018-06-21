<!DOCTYPE html>
<?php
	session_start();
?>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetMain.css">
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetForm.css">
		<title>Reserve Books</title>
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
				if ((isset($_SESSION['logged']) && $_SESSION['logged'] != 0))
				{ 
					//get all necessary values
					$isbn = AttackBlock($_GET['URL_Information']);
					$date = date("-D-M-Y");
					$user = $_SESSION['CurrentUser']; 
					
					//select book info from database
					$sql = "SELECT reserved FROM books WHERE ISBN = '$isbn';"; 
					$result = $db->query($sql); 
					$row = mysqli_fetch_row($result);
					
					//check if book is not already reserved
					if ( $row[0] != 'Y') 
					{ 
						//set the books reserved status to yes
						$quer1 = "UPDATE books SET reserved = 'Y' WHERE ISBN = '$isbn';"; 
						$db->query($quer1);
						
						//get the book name and author
						$quer2 = "SELECT BookTitle, Author FROM Books WHERE ISBN = '$isbn';";
						$result = $db->query($quer2);
						
						while($row = $result->fetch_row())
						{
							$book = $row[0];
							$author = $row[1];
						}//end while
						
						//display sucess message
						echo "<p>". $_SESSION['CurrentUser']." has sucessfully reserved \"".$book."\" by \"".$author."\"</p>";
						
						//update the reserved table to show who has reverved what 
						$quer3 = "INSERT INTO reserved VALUES ('$isbn','$user','$date');"; 
						$db->query($quer3);
						
						//send the usr back to previous page
						echo "
						<button onclick='goBack()' class = 'button'>Go Back</button>

						<script>
						function goBack() 
						{
							window.history.back();
						}
						</script>
						";
					}//end if 
					
					//if book has already been reserved, display error and send the user back a page
					else 
					{
						echo "<p class = 'error'>This book has already been reserved and is unavailible at the moment</p>";
						echo "
						<button onclick='goBack()' class = 'button'>Go Back</button>

						<script>
						function goBack() 
						{
							window.history.back();
						}
						</script>
						";
					}//end else
				}//end if ((isset($_SESSION['logged']) && $_SESSION['logged'] != 0))
					
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