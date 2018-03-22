<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="harry.css" rel="stylesheet" type="text/css">
<title>Interruption Occur</title>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<form id="sub" action="" method="get">
<%
	
	 String str1=request.getParameter("name");
	 String str=(String)session.getAttribute("teamname");
	 try
	 {
	 if(str.equals(str1))
	 {
		 
	 
	    Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HarryPotter","oracle123");
        Statement stat = con.createStatement();
       // String str=request.getParameter("teamname");
        ResultSet rs=stat.executeQuery("select * from STORE where teamname='"+str1+"'");
        String level=new String();
       
        level="";
      if(rs.next())
        { 
        	 level=rs.getString(3);
        	 
        	 if(level.equals("L01"))
             {
             	%>
             	
             	 document.getElementById("sub").action ="treenodes.jsp";
         
             
         <%}
             else if(level.equals("L02"))
             {
             	%>
             	
         document.getElementById("sub").action ="level2.jsp";
         
             <%} 
             else if(level.equals("L03"))
             {
             	%>
             	
         document.getElementById("sub").action ="Level3.jsp";
         
             <%} 
             else if(level.equals("L04"))
             {
             	%>
             	
         document.getElementById("sub").action ="Level4.jsp";
                 <%} 
             else if(level.equals("L05"))
             {
             	%>
             	
         document.getElementById("sub").action ="Level5.jsp";
         
             <%} 
             else if(level.equals("L06"))
             {
             	%>
             	
         document.getElementById("sub").action ="Level6.jsp";
        
             <% } 
             else if(level.equals("L07"))
             {
             	%>
             	
         document.getElementById("sub").action ="Level7.jsp";
             <% }
             else if(level.equals("0"))
             {
            	 %>
            	 document.getElementById("sub").action="mainpage.jsp";
           <%  }
              else
        	 { %>
        	 document.getElementById("sub").action="register.jsp";
        	<% }
        	 }
	 }
	 else
	 {
	 	
	 }
             %>}
            
             
             <% 
         
         
        	 
        
        }catch(ClassNotFoundException e)
{
    out.println(e.getLocalizedMessage());
}
%>
<input value="submit">
	</form>
</body>
</html>