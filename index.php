<!DOCTYPE>
<?php 
session_start();
error_reporting(0);
include("functions/functions.php");

?>
<html>
	<head>
		<title>::Drivequip SKF E-Shop::</title>
		
		
	<link rel="stylesheet" href="styles/style.css" media="all" /> 
	</head>
	
<body>
	
	<!--Main Container starts here-->
	<div class="main_wrapper">
	
		<!--Header starts here-->
		<div class="header_wrapper">
		
			<a href="index.php"><img id="logo" src="images/drivequip_logo.jpg" /> </a>
			<img id="banner" src="images/ad_banner.gif" />
		</div>
		<!--Header ends here-->
		
		<!--Navigation Bar starts-->
		<div class="menubar">
			
			<ul id="menu">
				<li><a href="index.php">Home</a></li>
				<li><a href="all_products.php">All Products</a></li>
				<li><a href="customer/my_account.php">My Account</a></li>
				<li><a href="customer_register.php">Sign Up</a></li>
				<li><a href="cart.php">Shopping Cart</a></li>
				<li><a href="script_chat_simple_2/chat.php">Contact Us</a></li>
			
			</ul>
			
			<div id="form">
				<form method="get" action="results.php" enctype="multipart/form-data">
					<input type="text" name="user_query" placeholder="Search a Product"/ > 
					<input type="submit" name="search" value="Search" />
				</form>
			
			</div>
			
		</div>
		<!--Navigation Bar ends-->
	
		<!--Content wrapper starts-->
		<div class="content_wrapper">
		
			<div id="sidebar">
			
				<div id="sidebar_title">Categories</div>
				
				<ul id="cats">
				
				<?php getCats(); ?>
				
				<ul>
					
				<div id="sidebar_title">Brands</div>
				
				<ul id="cats">
					
					<?php getBrands(); ?>
				
				<ul>
			
			
			</div>
		
			<div id="content_area">
			
			<?php cart(); ?>
			
			<div id="shopping_cart"> 
					
					<span style="float:right; font-size:17px; padding:5px; line-height:40px;">
					
					<?php 
					if(isset($_SESSION['customer_email'])){
					echo "<b>Welcome:</b>" . $_SESSION['customer_email'] . "<b style='color:yellow;'>Your</b>" ;
					}
					else {
					echo "<b>Welcome Guest:</b>";
					}
					?>
					
					<b style="color:yellow">Shopping Cart -</b> Total Items: <?php total_items();?> Total Price: <?php total_price(); ?> <a href="cart.php" style="color:yellow">Go to Cart</a>
					
					
					<?php 
					if(!isset($_SESSION['customer_email'])){
					
					echo "<a href='checkout.php' style='color:orange;'>Login</a>";
					
					}
					else {
					echo "<a href='logout.php' style='color:orange;'>Logout</a>";
					}
					
					
					
					?>
					
					
					
					</span>
			</div>
			
				<div id="products_box">
				
				<?php 

                    if (!$_SESSION['customer_email']){
				     
                  }else if($_SESSION['customer_email']){
                  	 getPro();
                  	 getCatPro();
                  	 getBrandPro();
                  }
				?>
				<?php //getCatPro(); ?>
				<?php //getBrandPro(); ?>
				
				</div>
			
			</div>
		</div>
		<!--Content wrapper ends-->
		
		
		
		<div id="footer">
		
		<h2 style="text-align:center; padding-top:30px;">&copy; 2017 by www.HexagonTechnologies.com</h2>
		
		</div>
		
<footer>
 <div id = "footer" style = "background-color: darkblue; height:120px;margin-top: 0px; ">
    <div style="float:left;width:300px;margin-left: 20px;">
     <p><h2 style="color:darkblue;padding-bottom: 5px; background-color: white;">About Drivequip</h2> Specialist stokist of SKF Bearings for all classes</p>
   </div>
         <div style="float:right; padding-left:30px; margin-right: 50px;" >
          <p ><h2 style="color:darkblue;padding-bottom: 2px; background-color: white;">Contact US</h2 > <br> Contact: +263 773 132592/0719 132592 <br> Email:  drivequip@gmail.com <br> Facebook: DrivequipSKF</p>
         </div> 
          <h4 align="center">Copyright @ 2017 www.drivequipskf.com. All right reserved</h4> 
 </div>
</footer>
	
	
	
	
	
	
	</div> 
<!--Main Container ends here-->


</body>
</html>