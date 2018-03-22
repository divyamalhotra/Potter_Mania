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
			Question 4
		</title>
		<link href="copy2.css" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Henny Penny' rel='stylesheet'>
		<link href='https://fonts.googleapis.com/css?family=Emilys Candy' rel='stylesheet'>
	<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">


		<div><h2 align="center">POTTERMANIA - LEVEL 4</h2>
		
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
  ps1=con.prepareStatement("update STORE set levelid='L04' where teamname='"+str+"'");
	
	
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
			Harry has to destroy the next horcrux, Tom Riddle's Diary using the Basilisk fang.                         But the Basilisk fang is locked in a box. To open the box he needs a password                         which can open the lock. The password can be found only by
                        by finding the output of the following program.</p>
		<p align = "left">
	        	&nbsp;&nbsp;#include <bits/stdc++.h><br>
			&nbsp;&nbsp;using namespace std;<br>
 			
			&nbsp;&nbsp;#define maxn 1000005<br>
			&nbsp;&nbsp;#define INF 99999999<br>
 
			&nbsp;&nbsp;int smallest_prime[maxn];<br>
			&nbsp;&nbsp;int divisors[maxn];<br>
			&nbsp;&nbsp;int segmentTree[4 * maxn];<br>
 
			&nbsp;&nbsp;void findSmallestPrimeFactors()<br>
			&nbsp;&nbsp;{<br>
			    &nbsp;&nbsp;for (int i = 0 ; i &lt maxn ; i ++ )<br>
			        &nbsp;&nbsp;&nbsp;smallest_prime[i] = INF;<br>
			    &nbsp;&nbsp;for (long long i = 2; i &lt maxn; i++)<br>
			    &nbsp;&nbsp;{<br>
			        &nbsp;&nbsp;&nbsp;if (smallest_prime[i] == INF)<br>
			        &nbsp;&nbsp;&nbsp;{<br>
			            &nbsp;&nbsp;&nbsp;smallest_prime[i] = i;<br>
			            &nbsp;&nbsp;&nbsp;for (long long j = i * i; j &lt maxn; j += i)<br>
			                &nbsp;&nbsp;&nbsp;if (smallest_prime[j] > i)<br>
			                    &nbsp;&nbsp;&nbsp;smallest_prime[j] = i;<br>
			        &nbsp;&nbsp;&nbsp;}<br>
			    &nbsp;&nbsp;}<br>
			&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;void buildDivisorsArray()<br>
			&nbsp;&nbsp;{<br>
			    &nbsp;&nbsp;for (int i = 1; i &lt maxn; i++)<br>
			    &nbsp;&nbsp;{<br>
			        &nbsp;&nbsp;&nbsp;divisors[i] = 1;<br>
			        &nbsp;&nbsp;&nbsp;int n = i, p = smallest_prime[i], k = 0;<br>
 
			        &nbsp;&nbsp;&nbsp;while (n &gt 1)<br>
			        &nbsp;&nbsp;&nbsp;{<br>
			            &nbsp;&nbsp;&nbsp;n = n / p;<br>
			            &nbsp;&nbsp;&nbsp;k ++;<br>
	 
			            &nbsp;&nbsp;&nbsp;if (smallest_prime[n] != p)<br>
			            &nbsp;&nbsp;&nbsp;{<br>
			                &nbsp;&nbsp;&nbsp;divisors[i] = divisors[i] * (k + 1);<br>
			                &nbsp;&nbsp;&nbsp;k = 0;<br>
        			    &nbsp;&nbsp;&nbsp;}<br>
 
			            &nbsp;&nbsp;&nbsp;p = smallest_prime[n];<br>
			        &nbsp;&nbsp;&nbsp;}<br>
			    &nbsp;&nbsp;}<br>
			&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;void buildSegtmentTree(int node, int a, int b)<br>
			&nbsp;&nbsp;{<br>
			    &nbsp;&nbsp;&nbsp;if (a == b)<br>
			    &nbsp;&nbsp;&nbsp;{<br>
			        &nbsp;&nbsp;&nbsp;segmentTree[node] = divisors[a];<br>
			        &nbsp;&nbsp;&nbsp;return;<br>
			    &nbsp;&nbsp;&nbsp;}<br>
			    &nbsp;&nbsp;&nbsp;buildSegtmentTree(2 * node, a, (a + b) / 2);<br>
			    &nbsp;&nbsp;&nbsp;buildSegtmentTree(2 * node + 1, ((a + b) / 2) + 1, b);<br>
			    &nbsp;&nbsp;&nbsp;segmentTree[node] = max(segmentTree[2 * node],
                            segmentTree[2 *node + 1]);<br>
			&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;int query(int node, int a, int b, int l, int r)<br>
			&nbsp;&nbsp;{<br>		
			    &nbsp;&nbsp;&nbsp;if (l &gt b || a &gt r)<br>
			        &nbsp;&nbsp;&nbsp;return -1;<br>
			    &nbsp;&nbsp;&nbsp;if (a &gt= l && b &lt= r)<br>
			        &nbsp;&nbsp;&nbsp;return segmentTree[node];<br>
			  &nbsp;&nbsp;&nbsp;return max(query(2 * node, a, (a + b) / 2, l, r),
			               query(2 * node + 1, ((a + b) / 2) + 1, b,l,r));<br>
			&nbsp;&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;int main()<br>
			&nbsp;&nbsp;{<br>
			    &nbsp;&nbsp;&nbsp;findSmallestPrimeFactors();<br>
			    &nbsp;&nbsp;&nbsp;buildDivisorsArray();<br>
			    &nbsp;&nbsp;&nbsp;buildSegtmentTree(1, 1, maxn - 1);<br>
			    &nbsp;&nbsp;&nbsp;cout &lt&lt query(1, 1, maxn - 1, 1, 100) &lt&lt endl;<br>
			    &nbsp;&nbsp;&nbsp;return 0;<br>
			&nbsp;&nbsp;}<br>
		</p>

		</div>
		<p align="center">
		<form action="answers4.jsp">
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
<div style="width: 30%; float:left">
		
		
		</div>
		<br>
		
		
	</body>
</html>