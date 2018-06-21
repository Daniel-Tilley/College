<?php
	//turn php errors off
	error_reporting(0);
	
	//header to be used accross all pages
	echo'
	<header>  
		<hr>
		<div class = "NavHorDiv">
			<ul class = "NavHor" align = "center">
				<li class = "NavHorLi"><a class = "NavHorA" href = "HomePage.php">HOME</a></li>
				<li class = "NavHorLi"><a class = "NavHorA" href = "FindBooks.php">BOOKS</a></li>
				<li class = "NavHorLi"><a class = "NavHorA" href = "ContactUs.php">Contact Us</a></li>
			</ul>
		</div>
		<hr>
					
		<div class = "Pics" align = "center">
			<img style="margin-right: 100px;" height="200px" width="300px" src="Pictures/lib1.jpg">
			<img style="margin-right: 100px;" height="200px" width="300px" src="Pictures/library.jpg">
			<img height="200px" width="300px" src="Pictures/lib2.jpg">
		</div>
		<hr>
	</header>';
?>
