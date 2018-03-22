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
			Question 3
		</title>
		<link href="copy1.css" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Henny Penny' rel='stylesheet'>
		<link href='https://fonts.googleapis.com/css?family=Emilys Candy' rel='stylesheet'>
	<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">


		<div><h2 align="center">POTTERMANIA - LEVEL 3</h2>
		

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
  <% while(rs.next())
  {
	 
	  score=rs.getInt(3);
	  teamno=rs.getInt(2);
	  count2=rs.getInt(4);
  }
     out.print(str);
    
	 ResultSet rs1=stat1.executeQuery("select time from STORE where teamname='"+str+"' ");
	
  %><% 
			 if(rs1.next())
			 {
				 c=rs1.getInt(1);
				// System.out.print(c);
		     }
  ps1=con.prepareStatement("update STORE set levelid='L03' where teamname='"+str+"'");
	
	
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
		<div style="width: 70%; float:left"><div id="ques">
		<p align="center">
			Harry is on his mission to kill Voldemort and Hogwarts battle has started. Harry trusts his best friends Ron and Hermione to kill Nagini. Nagini is climbing the stairs and so are Ron and Hermione. The have a BASILISK but they need to identify how many stairs more they will have to climb such that they will hit Nagini. The following code generates a number for a correct input which is the number of stairs needed to be climbed by Ron and Hermione. Help them find the number of steps.</p>
		<p align = "left">
	        //assuming all files are included and there are no compilation errors. Rest assume the necessary. <br><br>
#define MAXN 1000<br>
struct Node {<br>
      int start, end;<br>
      int length;<br>
      int insertEdg[26];<br>
      int suffixEdg;<br>
&nbsp;&nbsp;};<br>
Node root1, root2;<br>
Node tree[MAXN];<br>
int currNode;<br>
string s;<br>
int ptr;<br>
void insert(int idx) {<br>
     int tmp = currNode;<br>
     while (true)  {<br>
          int curLength = tree[tmp].length;<br>
      	   if (idx - curLength >= 1 and s[idx] == s[idx-curLength-1])<br>		
                break;<br>
          tmp = tree[tmp].suffixEdg;<br>
       &nbsp;&nbsp;}<br>
    if(tree[tmp].insertEdg[s[idx]-'a'] != 0)  {<br>
          currNode = tree[tmp].insertEdg[s[idx]-'a'];<br>
       	return;<br>
       &nbsp;&nbsp;}<br>
    ptr++;<br>
    tree[tmp].insertEdg[s[idx]-'a'] = ptr;<br>
    tree[ptr].length = tree[tmp].length + 2;<br>
    tree[ptr].end = idx;<br>
    tree[ptr].start = idx - tree[ptr].length + 1;<br>
    tmp = tree[tmp].suffixEdg;<br>
    currNode = ptr;<br>
    if (tree[currNode].length == 1)  {<br>
         tree[currNode].suffixEdg = 2;<br>
       	return;<br>
        &nbsp;&nbsp;}<br>
   while (true)	{<br>
       int curLength = tree[tmp].length;<br>
       if (idx-curLength >= 1 and s[idx] == s[idx-curLength-1])<br>
                break;<br>
       tmp = tree[tmp].suffixEdg;<br>
     &nbsp;&nbsp;}<br>
   tree[currNode].suffixEdg = tree[tmp].insertEdg[s[idx]-'a'];<br>
 &nbsp;&nbsp;}<br>
 int main()  {<br>
   root1.length = -1;<br>
   root1.suffixEdg = 1;<br>
   root2.length = 0;<br>
   root2.suffixEdg = 1;<br>
   tree[1] = root1;<br>
   tree[2] = root2;<br>
   ptr = 2;<br>
   currNode = 1;<br>
   s = "BASILISK";<br>
   int l = s.length();<br>
   for (int i=0; i&ltl; i++)<br>
        insert(i);<br>
   int c=0;<br>
   for (int i=3; i<=ptr; i++)<br>  	
        c++;<br>	
   cout&lt&ltc&lt&ltendl;<br>return 0;<br>  &nbsp;&nbsp;}<br></p>

		</div>
		<p align="center">
		<form action="answers3.jsp">
		<textarea name="answer" cols="80" rows="2"></textarea>
		<br>
		<button type="submit">Submit</button></form>
<a href="instructions.html" target="_blank">
<button style="padding-top: 4px;size:10pt;
  padding-left: 3px; margin-left:70px; padding-right: 7px; float:right; margin-top:-50px; margin-bottom:20px;background-color:orange;
  padding-bottom: 3px;font-family:Henny Penny;width:130px">Instructions</button>
   </a
		</p>
        </div>
<div style="width: 30%; float:left">
		
		
		</div>
		<br>
		
		
		
	</body>
</html>