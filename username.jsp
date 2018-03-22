<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
	<%
try 
{
	 String str=(String)session.getAttribute("teamname");
	String username=request.getParameter("username");
	
	 ResultSet rs;
	 
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
  Statement stat = con.createStatement();
  
  
  
  PreparedStatement ps=con.prepareStatement("update TEAM set username='"+username+"' where team_name='"+str+"'");
  ps.executeUpdate();
 response.sendRedirect("https://www.hackerearth.com/challenge/college/pottermania/");

}catch(Exception e)
	{ 
	out.println(e.getLocalizedMessage());
	}
 %>

	