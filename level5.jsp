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
			Question 5
		</title>
		<link href="copy3.css" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Henny Penny' rel='stylesheet'>
		<link href='https://fonts.googleapis.com/css?family=Emilys Candy' rel='stylesheet'>
		
	<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">

		<div><h2 align="center">POTTERMANIA - LEVEL 5</h2>
		

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
	 // str=rs.getString(1);
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
  ps1=con.prepareStatement("update STORE set levelid='L05' where teamname='"+str+"'");
	
	
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
		Ron has taken the Gryffindor sword and now he is ready to destroy the locket. In order to be destroyed, the locket has to be opened. Harry has to speak a number in Parseltongue to open the locket. The number is same as the number of bugs in the given program.	
		</p>
		<p align = "left">
			&nbsp;&nbsp;#include<stdio.h><br>
			&nbsp;&nbsp;#include<stdlib.h><br>
 
			&nbsp;&nbsp;struct node<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;static int key = -1;<br>
    			&nbsp;&nbsp;&nbsp;struct node left, right;<br>
			&nbsp;&nbsp;};<br>
			&nbsp;&nbsp;struct node* newNode(int key)<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;struct node* node = malloc(sizeof(struct node));<br>
    			&nbsp;&nbsp;&nbsp;node-&gtkey   = key;<br>
    			&nbsp;&nbsp;&nbsp;node-&gtleft  = node-&gtright  = NULL;<br>
    			&nbsp;&nbsp;&nbsp;return (node);<br>
			&nbsp;&nbsp;}<br>
 			&nbsp;&nbsp;struct node *rightRotate(struct node *x)<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;struct node *y = x-&gt left;<br>
    			&nbsp;&nbsp;&nbsp;x-&gt left = y-&gt right;<br>
    			&nbsp;&nbsp;&nbsp;y-&gt right = x;<br>
    			&nbsp;&nbsp;&nbsp;return y;<br>
			&nbsp;&nbsp;}<br>
 			&nbsp;&nbsp;struct node *leftRotate(struct node x)<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;struct node *y = x-&gt right;<br>
    			&nbsp;&nbsp;&nbsp;x-&gt right = y-&gt left;<br>
    			&nbsp;&nbsp;&nbsp;y-&gt left = x;<br>
    			&nbsp;&nbsp;&nbsp;return y;<br>
			&nbsp;&nbsp;}<br>
 			&nbsp;&nbsp;struct node *splay(struct node *root, int key)<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;if (root = NULL || root-&gt key = key)<br>
        		&nbsp;&nbsp;&nbsp;return root;<br>
     			&nbsp;&nbsp;&nbsp;if (root-&gt key &gt key)<br>	
    			&nbsp;&nbsp;&nbsp;{<br>
        		&nbsp;&nbsp;&nbsp;if (root-&gt left == NULL)<br> 
			&nbsp;&nbsp;&nbsp;return root;<br>
         		&nbsp;&nbsp;&nbsp;if (root-&gt left-&gt key &gt key)<br>
        		&nbsp;&nbsp;&nbsp;{<br>
            		&nbsp;&nbsp;&nbsp;root-&gt left-&gt left = splay(root-&gt left-&gt left, key);<br>
            		&nbsp;&nbsp;&nbsp;root = rightRotate(root);<br>
        		&nbsp;&nbsp;&nbsp;}<br>
        		&nbsp;&nbsp;&nbsp;else if (root-&gt left-&gt key &lt key)<br> 
        		&nbsp;&nbsp;&nbsp;{<br>
                        &nbsp;&nbsp;&nbsp;root-&gt left-&gt right = splay(root-&gt left-&gt right, key);<br>
 			&nbsp;&nbsp;&nbsp;if (root-&gt left-&gt right != NULL)<br>
                	&nbsp;&nbsp;&nbsp;root-&gt left = leftRotate(root-&gt left);<br>
        		&nbsp;&nbsp;&nbsp;}<br>
        		&nbsp;&nbsp;&nbsp;return (root-&gt left == NULL)? root; rightRotate(root);<br>
    			&nbsp;&nbsp;&nbsp;}<br>
    			&nbsp;&nbsp;&nbsp;else <br>
    			&nbsp;&nbsp;&nbsp;{<br>
        		&nbsp;&nbsp;&nbsp;if (root-&gt right == NULL)<br> 
			&nbsp;&nbsp;&nbsp;return root;<br>
                	&nbsp;&nbsp;&nbsp;if (root-&gt right-&gt key &gt key) {<br>
            		&nbsp;&nbsp;&nbsp;root-&gt right-&gt left = splay(root-&gt right-&gt left, key);<br>
            		&nbsp;&nbsp;&nbsp;if (root-&gt right-&gt left != NULL)<br>
                	&nbsp;&nbsp;&nbsp;root-&gt right = rightRotate(root-&gt right);<br>
        		&nbsp;&nbsp;&nbsp;}<br>
        		&nbsp;&nbsp;&nbsp;else if (root-&gt right-&gt key &lt key)<br>
        		&nbsp;&nbsp;&nbsp;{<br>
            		&nbsp;&nbsp;&nbsp;root-&gt right-&gt right = splay(root-&gt right-&gt right, key);<br>
            		&nbsp;&nbsp;&nbsp;root = leftRotate(root);<br>
        		&nbsp;&nbsp;&nbsp;}<br>
        		&nbsp;&nbsp;&nbsp;return (root-&gt right == NULL)? root: leftRotate(root);<br>
 			&nbsp;&nbsp;&nbsp;   }<br>
  			&nbsp;&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;struct node *search(struct node *root, int key)<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;return splay(root, key);<br>
			&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;void preOrder(struct node *root)<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;if (root == NULL)<br>
    			&nbsp;&nbsp;&nbsp;{<br>
        		&nbsp;&nbsp;&nbsp;printf("%d ", *&*&root-&gt key);<br>
        		&nbsp;&nbsp;&nbsp;preOrder(root-&gt left);<br>
        		&nbsp;&nbsp;&nbsp;preOrder(root-&gt right);<br>
    			&nbsp;&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;}<br>
			&nbsp;&nbsp;int main(int argv, char* argc[])<br>
			&nbsp;&nbsp;{<br>
    			&nbsp;&nbsp;&nbsp;struct node root = newNode(100);<br>
    			&nbsp;&nbsp;&nbsp;root-&gt left = newNode(50);<br>
    			&nbsp;&nbsp;&nbsp;root-&gt right = newNode(200);<br>
    			&nbsp;&nbsp;&nbsp;root-&gt left-&gt left = newNode(40);<br>
    			&nbsp;&nbsp;&nbsp;root-&gt left-&gt left-&gt left = newNode(30);<br>
    			&nbsp;&nbsp;&nbsp;root-&gt left-&gt left-&gt left-&gt left = newNode(20);<br>
     			&nbsp;&nbsp;&nbsp;root = search(root, 20);<br>
    			&nbsp;&nbsp;&nbsp;printf("Preorder traversal of the modified Splay tree is \n");<br>
    			&nbsp;&nbsp;&nbsp;preOrder(root);<br>
			&nbsp;&nbsp;}<br>
		</p>

		</div>
		
		<p align="center" id="out"><font size="5">What is the total number of bugs in the program?</font></p>
		<p align="center">
		<form action="answers5.jsp">
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