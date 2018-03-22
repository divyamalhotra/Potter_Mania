<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" content="text/html; charset=ISO-8859-1" >
<title>Registeration Form</title>
<link href="style_register.css" rel="stylesheet" type="text/css">
<link href="hm.html" rel="stylesheet"  type="text/html">

<link href='https://fonts.googleapis.com/css?family=Henny Penny' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Princess Sofia' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Aldrich' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Butcherman' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Metal Mania' rel='stylesheet'>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<audio autoplay>

  <source src="sound.mp3" type="audio/mpeg">

Your browser does not support the audio element.

</audio>
<h1 id="select"> IGDTUW</h1>
<h3 > <font color="white">PotterMania  Registration form</font>
</h3>
<form action="regdata.jsp">

	<div> 
		<label for="tname"><h4><font size="5">Team Name * </font></h4></label>
	    <input size=40 type="text" name="user_name" id="tname" placeholder="name" required>
	    <label for="tname" style="min-height: 13px;"><br />Enter your unique team name</label>
	</div>
	<div> 
		<label for="ename"><h4><font size="5">E-mail * </font></h4></label>
	    <input size=40 type="email" name="user_mail" id="ename" placeholder="email" required>
	    <label for="ename" style="min-height: 13px;"><br />example@example.com</label>
	</div>
	<div > 
		<label for="cname"><h4><font size="5">Contact No * </font></h4></label>
	    <input size=5 type="number" name="user_area" id="cname" max="99" min="10" required > &nbsp;-&nbsp;
	    <input  name="user_phone" size="20"  max="9999999999" MIN ="1000000000" type="number" required>
	    <label for="cname" style="min-height: 13px;">
	    <br />Area Code&nbsp;&nbsp;&nbsp;Phone Number</label>
	</div>
	<div > 
		<label for="mname"><h4><font size="5">Team Member 1 Name * </font></h4></label>
	    <input size=15 type="text" name="user_mem1" id="mname" required> &nbsp;-&nbsp;
	    <input  name="mem1_last" size="20">
	    <label for="cname" style="min-height: 13px;">
	    <br />First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name</label>
	</div>
	<div > 
		<label for="mname"><h4><font size="5">Team Member 2 Name * </font></h4></label>
	    <input size=15 type="text" name="user_mem2" id="mname" required> &nbsp;-&nbsp;
	    <input  name="mem2_last" size="20">
	    <label for="cname" style="min-height: 13px;">
	    <br />First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name</label>
	</div>
	
	
	<div > 
		<label for="mname"><h4><font size="5">Any Team Member College Name * </font></h4></label>
	    <input size=30 type="text" name="user_cllg" id="mname" required> 
	</div>
	<div class="button">
     	<input type="submit"  value=" submit" style="font-size:15pt;color:black;
background-color:white;border:4px solid grey;padding-top: 4px;
  padding-left: 3px; margin:20px; padding-right: 7px;
  padding-bottom: 3px;border-radius: 10px;font-family: Princess Sofia;
   ">
     </div>
     
</form>
</body>
</html>