<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<link href="ptm.css" rel="stylesheet" type="text/css"/>


<link href='https://fonts.googleapis.com/css?family=Creepster' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Eater' rel='stylesheet'>

<link href='https://fonts.googleapis.com/css?family=Hanalei Fill' rel='stylesheet'>
<title>Pottermania</title>

<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<SCRIPT language="JavaScript">

function goNewWin() {

//***Get what is below onto one line***

window.open("backbuttonnewpage.html",'TheNewpop','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1'); 
window.open ("https://viralpatel.net/blogs/",
		"mywindow","status=1,toolbar=0"); 
//***Get what is above onto one line*** 

self.close()

}

</SCRIPT> 

<audio  loop="loop" autoplay>
  <source src="sound.mp3" type="audio/mpeg">
Your browser does not support the audio element.
</audio>

<h1 style="color:#43464B; font-family:Creepster; font-size:102px; margin-top:-1%" align="center">POTTERMANIA</h1>
'
<table id="t1" style="font-size:28px">

<tr>

<td style="font-family:Eater;">Team Name :</td>
<% 
try 
{
	String str=(String)session.getAttribute("teamname");
 
	Integer score=0;
	 ResultSet rs;
	 int teamno=1;
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
  Statement stat = con.createStatement();
  
 
  rs=stat.executeQuery("select * from TEAM where team_name='"+str+"' ");
  %>
  <%if(rs.next())
  {
	 
	  score=rs.getInt(3);
	  teamno=rs.getInt(2);
  }
   %>
 


  <td><% out.print(str);%></td>
  </tr>

<tr>

<td style="font-family: Eater;">Score :</td>

<td><% out.print(score);%></td>

</tr>
<tr>

<td style="font-family: Eater;">Time left :</td>

<td id="demo"></td>

</tr>


</table>
<script type="text/javascript">
		var distance = 2700;
			
			var x = setInterval(function() {

		
  			var hours = Math.floor(distance/( 60 * 60));
 	 		var minutes = Math.floor((distance % ( 60 * 60)) / 60);
  			var seconds = Math.floor(distance %  60);
			// Display the result in the element with id="demo"
			if (distance < 0) {
    
    setTimeout(function(){
    	alert("Time Over... Redirecting to hackerearth contest");
    	window.location.href="level6.html";
    },2000);
  }
			else
				{
  			document.getElementById("demo").innerHTML = hours + " Hours "
			  + minutes + " Minutes " + seconds + " Seconds ";
				}
               distance=distance-1;
			// If the count down is finished, write some text 
			
			}, 1000);

			
		</script>
		


<%}catch(ClassNotFoundException e)
{
    out.println(e.getLocalizedMessage());
}%>


<form method="get" action="Interrupt.jsp" target="_blank">

<button style="font-family: Hanalei Fill" class="button2" id="b7" type="submit">RESUME GAME</button></form><br>

<form method="get" action="treenodes.jsp" target="_blank">

<button style="font-family: Hanalei Fill" class="button2" id="b8" type="submit">START</button></form><br>

<form method="get" action="instructions.html" target="_blank">

<button style="font-family: Hanalei Fill" class="button2" id="b9" type="submit">INSTRUCTIONS</button></form><br>

</body>

</html>