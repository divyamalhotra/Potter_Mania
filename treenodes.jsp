<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.TimerTask"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
<link href="level1style.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Eater' rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Henny Penny' rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Jolly Lodger' rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Joti One' rel='stylesheet'>
    <title>Collapsible Tree Example</title>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
		
<div id="heading"><h1 align="center" style="font-family:Henny Penny;">POTTERMANIA - LEVEL 1</h1>
    
    
    <div id="header" >
      <h2 style="float: left; font-family:Henny Penny; margin-top=-15px">Team Name : <% int c=0;
      String str=(String)session.getAttribute("teamname");
  		Integer teamno=1;
try 
{
	
	Integer score=0;
	int count2=0;
	 ResultSet rs;
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
  Statement stat = con.createStatement();
  Statement stat1 = con.createStatement();
  PreparedStatement ps1;
  rs=stat.executeQuery("select * from TEAM where team_name='"+str+"' ");
  %>
  <% if(rs.next())
  {
	  
	  score=rs.getInt(3);
	  teamno=rs.getInt(2);
	  count2=rs.getInt(4);
  }
     out.print(str);
    
	 ResultSet rs1=stat1.executeQuery("select time from STORE where teamname='"+str+"'");
	
  %><% 
			if(rs1.next())
			 {
				 c=rs1.getInt(1);
				 //System.out.print(c);
		     }
  ps1=con.prepareStatement("update STORE set levelid='L01' where teamname='"+str+"'");
	
	
	 ps1.executeUpdate();
			%>
			
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Score:<% out.print(score);%></h2>

		<%rs.close();
			rs1.close();
			ps1.close();
			stat.close();
			stat1.close();
			con.close();
			%>
			<%}catch(ClassNotFoundException e)
			{
			    out.println(e.getLocalizedMessage());
			}%>
			
			
    </div>    
    </div>
  <br>
  <br><br><br>
  <hr><br>
<!-- load the d3.js library -->	
   <div id="ques"> 
    <div id="q1">
	<p id="q1" style="font-family:Jolly Lodger;"><br><br>One of the horcux, the Marvolo Gaunt ring has found a way to become invisible to save itself. But that invisibility will last only till you find the correct spell to make it visible. The spell is the answer of the following question. Find the spell to destroy the ring.</p>
	<p id="q1" style="font-family:Jolly Lodger;">From the given tree, create an AVL tree followed by deletion of cedric such that it is still AVL: </p>
  <p id="q1" style="font-family:Jolly Lodger;">cedric , edward , umbridge , luna , draco , albus , voldemort , ginny , bellatrix , fred , ron<br><br>
Solve according to the first letter of the name alphabetically.<br><br>
Write the Postorder of the resultant AVL tree:<br><br>
</p>
</div>
</div><br><br>
<div>
  <p align="center">
  <form action="answers1.jsp" >
    <textarea name="answer" cols="50" rows="2" style="font-size:25"></textarea>
    <br>
   <button type="submit"  value=" submit" style="font-size:15pt;color:black;
background-color:white;border:4px solid grey;padding-top: 4px;
  padding-left: 3px; margin:20px; padding-right: 7px;
  padding-bottom: 3px;border-radius: 10px;font-family: fantasy;
   ">SUBMIT</button>
   
</form>

<a href="instructions.html" target="_blank">
<button style="font-size:20pt;color:blue;
background-color:white;border:4px solid grey;padding-top: 4px;
  padding-left: 3px; margin-right:70px; padding-right: 7px; float:right; margin-top:-70px; margin-bottom:20px;
  padding-bottom: 3px;border-radius: 10px;font-family: Henny Penny;
   ">INSTRUCTIONS</button></a>
  
    </p>
</div>

  </body>
</html>