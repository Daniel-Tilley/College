<!DOCTYPE HTML>
<?php
	session_start();
?>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="StyleSheets/StyleSheetMain.css">
		<title>Welcome to the library</title>
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
		
		<!-- opening hours table on homepage -->
		<div align = "center">
			<h3 style = "border-bottom: dotted 1px white; width: 10%">Opening Hours</h3>
			<table class = "tableall">
				<tr>
					<th colspan = "2" class = "tableall"><th>
				</tr>
				
				<tr>
					<td class = "tablealltd">Monday:</td>
					<td class = "tablealltd" align = "center">10:00 - 1:00 & 2:00 - 5:00</td>
				</tr>
				
				<tr>
					<td class = "tablealltd">Tuesday:</td>
					<td class = "tablealltd" align = "center">10:00 - 1:00 & 2:00 - 5:00</td>
				</tr>
				
				<tr>
					<td class = "tablealltd">Wednesday:</td>
					<td class = "tablealltd" align = "center">10:00 - 1:00 & 2:00 - 5:00</td>
				</tr>
				
				<tr>
					<td class = "tablealltd">Thursday:</td>
					<td class = "tablealltd" align = "center">10:00 - 1:00 & 2:00 - 5:00</td>
				</tr>
				
				<tr>
					<td class = "tablealltd">Friday:</td>
					<td class = "tablealltd" align = "center">10:00 - 1:00 & 2:00 - 5:00</td>
				</tr>
				
				<tr>
					<td class = "tablealltd">Saturday:</td>
					<td class = "tablealltd" align = "center">10:00 - 1:00</td>
				</tr>
				
				<tr>
					<td class = "tablealltd">Sunday:</td>
					<td class = "tablealltd" align = "center">Closed</td>
				</tr>
			</table>
		</div>
		<hr>
	</body>
	
	<?php 
		include ('Footer.php');
	?>
</html>