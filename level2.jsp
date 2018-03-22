<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html> 
	<head>
		<title>
			Question 2
		</title>
		<link href="copy.css" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Henny Penny' rel='stylesheet'>
		<link href='https://fonts.googleapis.com/css?family=Emilys Candy' rel='stylesheet'>
	<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">

		<div><h2 align="center">POTTERMANIA - LEVEL 2</h2>
		

		<div >
  		<h3 style="float: left">Team Name:<% int c=0;
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
  <%if(rs.next())
  {
	  
	  score=rs.getInt(3);
	  teamno=rs.getInt(2);
	  count2=rs.getInt(4);
  }
     out.print(str);
    
	 ResultSet rs1=stat1.executeQuery("select time from STORE where teamname='"+str+"'");
	
  %><% 
			 while(rs1.next())
			 {
				 c=rs1.getInt(1);
				// System.out.print(c);
		     }
  ps1=con.prepareStatement("update STORE set levelid='L02' where teamname='"+str+"'");
	
	
	 ps1.executeUpdate();
			%>
			
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Score:<% out.print(score);%></h3>

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

		<br><br><br>
		<hr>
		<div style="width: 30%; float:left">
		
		
		</div>
		<div style="width: 70%; float:right"><div id="ques">
		<p align="center">Harry, Ron and Hermione are searching for Helga Hufflepuff’s cup. In order to get a clue on how to destroy it they need to solve a riddle made by Voldemort.</p>
		<p align="center">{ {g,m}, {m,i}, {i,n}, {e,n}, {e,o}, {g,o} }
		<br><br>Voldemort gave you these vertices
		</p></div>
		
		<p align="center" id="out"><font size="5">Can you sort them to make a meaningful word 		<br>that can help Harry in destroying the cup?</font></p>
		<p align="center">
		<form action="answers2.jsp">
		<textarea name="answer" cols="80" rows="2"></textarea>
		<br>
		<button type="submit">Submit</button>
</form>
<a href="instructions.html" target="_blank">
<button style="padding-top: 4px;size:10pt;
  padding-left: 3px; margin-right:70px; padding-right: 7px; float:right; margin-top:-50px; margin-bottom:20px;background-color:orange;
  padding-bottom: 3px;font-family:Henny Penny;width:130px">Instructions</button>
   </a>
		</p>
        </div>
		<br>
		
		
		
	</body>
</html>