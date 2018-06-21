<!DOCTYPE html>
<?php
	session_start();
?>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetMain.css">
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetForm.css">
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetTable.css">
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
				if ((isset($_SESSION['logged']) && $_SESSION['logged'] != 0))
				{ 
					//calculate the total number of rows in table 
					$total_quer = "SELECT * FROM Books WHERE (Reserved LIKE 'Y');";
					$total = $db->query($total_quer);
					$totalNum = mysqli_num_rows($total);
					
					//calculate max page number
					$max_page = ceil($totalNum/5);
					
					//check is page is set or not
					if (isset($_GET["page"])) 
					{ 
						$page  = $_GET["page"]; 
					}//end if
					
					else 
					{ 
						$page = 1; 
					}//end else
					
					//row to start from
					$start_from = ($page-1) * 5; 
					
					//get next results from database
					$quer = "SELECT ISBN, BookTitle, Author, Edition, BookYear FROM Books 
							 WHERE (Reserved LIKE 'Y') LIMIT ".$start_from.",5;";
							
					$result =$db->query($quer);
					
					//check if any results returned
					if($result->num_rows > 0)
					{
						//display results
						echo '<h3>Books</h3>';
						echo '
						<table>
							<tr>
								<td>ISBN</td>
								<td>Book Title</td>
								<td>Author</td>
								<td>Edition</td>
								<td>Year</td>
								<td>Un Reserve Your Books</td>
							</tr>
						';
						
						//while rows are returned
						while($row = $result->fetch_row())
						{
							echo "<tr>";
							echo '
							<td>'.$row[0].'</td>
							<td>'.$row[1].'</td>
							<td>'.$row[2].'</td>
							<td>'.$row[3].'</td>
							<td>'.$row[4].'</td>
							';
							
							//check if the user has reserved the book
							//Find the current ISBN
							$isbn = $row[0];
							
							//find current username from reserved table
							$quer1 = "SELECT UserName FROM Reserved WHERE ISBN = '$isbn';";
							$result1 = $db->query($quer1);
							
							//get user name
							while($user_check1 = $result1->fetch_row())
							{
								$Username = $user_check1[0];
							}//end while
							
							//checks id username is the same as logged in username and allows to unreserve book if they match
							if($Username == $_SESSION['CurrentUser'])
							{							
								echo '
								<td>
									<a href="UnReserve.php?URL_Information=' .$row[0] . '">
										<button class = "button1">Un reserve this book</button>
									</a>
									<br>
								</td>';
							}//end if
							
							else
							{
								echo "<td class = 'error'>Book Reserved by another User</td>";
							}//end else
							echo "</tr>";	
						}//end while
						echo '</table></br></br>';
						
						//calculate how many more pages to display
						for ($i = 1; $i<=$max_page; $i++) 
						{
							if($i == 1){
								echo "<span class = 'PageNumFirst'>";
							}//end if 
							else{
								echo "<span class = 'PageNum'>";
							}//end else
								
							echo "
								<a style = 'color: #F77D2C;' 
								href='ViewReserved.php?page=".$i."'>Page ".$i."</a> 
							</span>
							"; 
						}//end for
						echo '<span class = "PageNum"><a style = "color: #F77D2C;" href="FindBooks.php">Find a book</a></span>';
					}//end if $result->num_rows > 0
					
					else
					{
						echo "<p class = 'error'>There are no books currently reserved</p>";
						echo '<span class = "PageNumFirst"><a style = "color: #F77D2C;" href="FindBooks.php">Find a book</a></span>';
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