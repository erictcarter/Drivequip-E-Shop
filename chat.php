<?php 
session_start();

if(isset($_POST['submit']))
{
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("drivequip", $con);
		$message=$_POST['message'];
		$sender=$_POST['sender'];
		mysql_query("INSERT INTO chatting(message, sender)VALUES('$message', '$sender')");
}

?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Chat Forum</title>
<script language="javascript" src="jquery-1.2.6.min.js"></script>
<script language="javascript" src="jquery.timers-1.0.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
   var j = jQuery.noConflict();
	j(document).ready(function()
	{
		j(".refresh").everyTime(1000,function(i){
			j.ajax({
			  url: "refresh.php",
			  cache: false,
			  success: function(html){
				j(".refresh").html(html);
			  }
			})
		})
		
	});
	j(document).ready(function() {
			j('#post_button').click(function() {
				$text = $('#post_text').val();
				j.ajax({
					type: "POST",
					cache: false,
					url: "save.php",
					data: "text="+$text,
					success: function(data) {
						alert('data has been stored to database');
					}
				});
			});
		});
   j('.refresh').css({color:"green"});
});
</script>

<style type="text/css">
	#hd {
		<img id="background" src="images/hexagon2.jpg" />
		background-image: url(images/hexagon2.jpg);
		height:100px;
		margin-bottom: 10px;
	}
</style>
<link rel = "stylesheet" href ="css/chat.css" type = "text/css">
</head>
<nav>
	<div id = "hd">
	<h3 align = "center" style="color:white;">Chat Forum For Everybody</h3>

	<h2 style="color:white;"><i>Share Ideas, Skills and Knowledge</i></h2>
    </div>
</nav>
<body>
<form method="POST" name="" action="">
	<div id = "texts">
<label>Chat name here</label><br>
<input name="sender" type="text" id="texta" value="<?php echo $sender ?>" required pattern = "^[A-Za-z0-9]+"/><br>
   <label>Type your message</label><br>
<textarea rows = "10" cols = "30" name="message" type="text" id="textb" required />
</textarea>
<input name="submit" type="submit" value="Send" id="post_button" required />
</div>
<center>
<div class="refresh">
	<h3>Chats  ||  Online Individuals</h3>
<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("drivequip", $con);

$result = mysql_query("SELECT * FROM chatting ORDER BY id DESC");


while($row = mysql_fetch_array($result))
  {
  echo '<div class = "msg"><p>'.'<span >'.$row['sender'].'</span><br>'. '&nbsp;&nbsp;' . $row['message'].'</p></div>';
  }

mysql_close($con);
?>

</div><br><br><br><br><br>
</center>
</form>

</body>
