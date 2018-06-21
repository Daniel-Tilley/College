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
			if ((isset($_SESSION['logged']) && $_SESSION['logged'] != 0))
			{ 
		?>
		
	   <div>
			<form method="post">
				<fieldset><legend>Search By Title and/or Author</legend>
					Title:</br>
					<input type = "text" name = "title">
					</br>
					Author:</br>
					<input type = "text" name = "author">
					</br></br>
					<input type = "submit" name = "submit" class = "button">
				</fieldset><br />
			</form>
			
			<?php
					if (isset($_POST['submit']))
					{
						$title = AttackBlock($_POST['title']);
						$author = AttackBlock($_POST['author']);
						
						//set a search case for the switch statement
						if ($title != '' && $author != '')
						{
							$searchID = 1;
						}//end if 
						
						if ($title != '' && strlen($author) == 0)
						{
							$searchID = 2;
						}//end if 
						
						if (strlen($title) == 0 && $author != '')
						{
							$searchID = 3;
						}//end if 
						
						//switch statement to choose what to search for
						switch($searchID)
						{
							case 1: //Title and Author
							{
								$_SESSION['Tit_search1'] = $title;
								$_SESSION['Aut_search1'] = $author;
								header('Location: DisplayPageAut_Tit.php');
								break;
							}//end case 1
							
							case 2: //Title only
							{ 
								$_SESSION['Tit_search2'] = $title;
								header('Location: DisplayPageTit.php');
								break;
							}//end case 2
							
							case 3: //Author only
							{ 
								$_SESSION['Aut_search2'] = $author;
								header('Location: DisplayPageAut.php');
								break;
							}//end case 3
							
							default: //Neither
							{ 
								echo "<p class = 'error'>Title and Author blank, please try again</p>";
								break;
							}//end case 4
						}//end switch
					}//end if (isset($_POST['submit']))
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
			
		<hr>
		
		<?php 
			include ('Footer.php');
		?>
	</body>
</html>


