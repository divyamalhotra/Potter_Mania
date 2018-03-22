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
<title>test</title>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<%
String str=(String)session.getAttribute("teamname");
try
{
	
	
	String ans=request.getParameter("answer");
	//out.print(ans);
	Connection con;
	Class.forName("oracle.jdbc.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HARRYPOTTER","oracle123"); 
    Statement statement = con.createStatement();
   // PreparedStatement stat=con.prepareStatement("update TEAM set ans1='"+ans+"' where team_name=?");
   // PreparedStatement ps1=con.prepareStatement("select * from TEAM");
    ResultSet rs=statement.executeQuery("select team_name,score,count4 from TEAM where team_name='"+str+"'");
    //ResultSet rs1=stat.executeQuery();
   // ResultSet rs2=ps1.executeQuery();
   /* while(rs.next())
    {
    	stat.setString(2,rs.getString(1));
    }
   
    stat.executeUpdate();*/
   
if((ans.equalsIgnoreCase("12")&&rs.next())||(ans.equalsIgnoreCase("12")&&!rs.next()))
{
	

//out.println(teamname);
int score=rs.getInt("score");
int count4=rs.getInt("count4");
PreparedStatement ps=con.prepareStatement("update TEAM set score=? where team_name='"+str+"'");
//out.println(score);
if(count4==0){
	score=score+100;}
	else if(count4==1)
	{ score+=50;}
	else 
	{ score+=25;}	
request.setAttribute("score",score);

ps.setInt(1, score);

int i=ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("congrats4.jsp");
rd.forward(request, response);
}

else
{ 
if(rs.next()||!rs.next())
	{
	int count4=rs.getInt("count4");
	//String teamname=rs.getNString("team_name");
	PreparedStatement ps1=con.prepareStatement("update TEAM set count4=? where team_name='"+str+"'");
	++count4;
	request.setAttribute("count4",count4);
  	ps1.setInt(1, count4);
  	int j=ps1.executeUpdate();
	if(rs.getInt("count4")>1)
	
		{RequestDispatcher rd=request.getRequestDispatcher("notry4.html");

		rd.forward(request, response);
		}
	
else
{
RequestDispatcher rd=request.getRequestDispatcher("tryagain4.html");

rd.forward(request, response);
}
	rs.close();
	ps1.close();
}
con.close();
Thread.sleep(1000);
}
}catch(Exception e)
{
	 out.println(e.getLocalizedMessage());
}

%>


</body>
</html>