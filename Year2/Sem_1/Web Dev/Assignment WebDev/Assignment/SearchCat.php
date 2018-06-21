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
			<form method = "post">
			<fieldset>
				<legend>Search By Category</legend>
				</br>
				
				<?php
					//displays the category names to a user in a drop down list from database
					$result = $db->query("select * from category;"); 
					echo '<select name = "cat">';
					
					//while database still returns categories, add options to select list
					while($row = $result->fetch_row())
					{
						echo '<option>' . $row[1] . '</option>';
					}//end while
					echo "</select>";
				?>
				
				</br></br>
				<input type = "submit" value = "Search" class = "button"><br />
			</fieldset>
			</br>
			
			<?php
					//asigns a catID to each value to be used for checking later
					switch(strtolower($_POST['cat']))
					{
						case "health": 
						{
							$catID = 1; 
							break;
						}//end case health
						case "business": 
						{
							$catID = 2;
							break;
						}//end case business
						case "biography": 
						{
							$catID = 3; 
							break;
						}//end case biography
						case "technology": 
						{
							$catID = 4; 
							break;
						}//end case technology
						case "travel": 
						{
							$catID = 5; 
							break;
						}//end case travel
						case "self help": 
						{
							$catID = 6; 
							break;
						}//end self help
						case "cookery": 
						{
							$catID = 7; 
							break;
						}//end case cookery
						case "fiction": 
						{
							$catID = 8; 
							break;
						}//end case fiction
					}//end switch statement
					
					//checks if a category has been selected
					if(isset($_POST['cat']) && $_POST['cat']!='')
					{
						$_SESSION['CatID_Next_Page'] = $catID;
					
						//redirect user to display page
						header('Location: DisplayPageCat.php');
					}//end if
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