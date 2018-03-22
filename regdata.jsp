<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ include file="register.jsp" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >

<title>REG DATA</title>
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
	 ResultSet rs=null;
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
  String teamname = request.getParameter("user_name");
  session=request.getSession();
  session.setAttribute("teamname",teamname);
  String email = request.getParameter("user_mail");
  String areacode = request.getParameter("user_area");
  String phone = request.getParameter("user_phone");
  String mem1 = request.getParameter("user_mem1");
  String mem1_last = request.getParameter("mem1_last");
  String mem2 = request.getParameter("user_mem2");
  String mem2_last = request.getParameter("mem2_last");
  String cllg = request.getParameter("user_cllg");
  Statement stat = con.createStatement();
  Statement stat1 = con.createStatement();
  Statement stat2 = con.createStatement();
  

  stat.executeUpdate("insert into REGISTER(TEAM_NAME,EMAIL_ID,AREACODE,CONTACT_NO,MEM1_FIRSTNAME,MEM1_LASTNAME,MEM2_FIRSTNAME,MEM2_LASTNAME,COLLEGE) values('"+teamname+"','"+email+"','"+areacode+"','"+phone+"','"+mem1+"','"+mem1_last+"','"+mem2+"','"+mem2_last+"','"+cllg+"')");
  rs=stat1.executeQuery("select * from TEAM");
  int count=0;
 while(rs.next())
 {
	 count++;
 }
 
 if(count==0)
 {count=1;
  stat1.executeUpdate("insert into TEAM values('"+teamname+"',1,0,0,0,0,0,0,null)");
 }
 else
 {
	 count++;
	  stat1.executeUpdate("insert into TEAM values('"+teamname+"','"+count+"',0,0,0,0,0,0,null)");

 }
 stat2.executeQuery("insert into STORE values('"+teamname+"','"+count+"','0',2700)");
  RequestDispatcher rd =request.getRequestDispatcher("/mainpage.jsp");
  rd.forward(request,response);
  stat.close();
  stat1.close();
  %>
  
  <%
 // out.println("Data is successfully inserted!");
 %>

<% }catch(java.sql.SQLIntegrityConstraintViolationException e)
{
    %>
    <script>
    alert("Please enter unique team name!!!");
    </script>
    
    <%
}%>


</body>


</html>