<%-- 
    Document   : mainpg
    Created on : Aug 26, 2017, 5:04:02 PM
    Author     : HCL
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

	<script>
	document.getElementById("demo").innerHTML = "ABC";
	<%int a = 0;
			try {
				ResultSet rs = null;
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "HarryPotter",
						"oracle123");
				if (con != null)
					System.out.println("Data is successfully retrieved!");
				else
					System.out.println("no connection");
				String sql = "select TIME from Timer";
				// PreparedStatement ps = con.prepareStatement(sql);
				//   ps.executeUpdate();
				Statement stmt = null;
				stmt = con.createStatement();

				rs = stmt.executeQuery(sql);
				// In this part u extract time from database
				while (rs.next()) {
					a = rs.getInt(1);
					System.out.println(rs.getInt(1)); //+"  "+rs.getString(2)+"  "+rs.getString(3));  
				}
				//step5 close the connection object  
				con.close();

			} catch (Exception e1) {
				out.println(e1);
			}%>
		// here ur using the time left in the database for the user
		var distance1 =	<%=a%>;

		//distance=distance;
		// Update the count down every 1 second
		var x = setInterval(
				function() {

					// Get todays date and time
					// var now = new Date().getTime();

					// Find the distance between now an the count down date
					/// var distance = countDownDate - now;

					// Time calculations for days, hours, minutes and seconds
					var days = Math.floor(distance1 / (1000 * 60 * 60 * 24));
					var hours = Math.floor((distance1 % (1000 * 60 * 60 * 24))
							/ (1000 * 60 * 60));
					var minutes = Math.floor((distance1 % (1000 * 60 * 60))
							/ (1000 * 60));
					var seconds = Math.floor((distance1 % (1000 * 60)) / 1000);

					// Output the result in an element with id="demo"
					document.getElementById("demo").innerHTML = days + "d "
							+ hours + "h " + minutes + "m " + seconds + "s ";
					distance1 = distance1 - 1000;
					// If the count down is over, write some text 
					if (distance1 % 60000 === 0) {
						var x1 = updateTime(function() {
	<%ResultSet rs = null;
			int a1 = 0;
			try {
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "HarryPotter",
						"oracle123");
				if (con != null)
					System.out.println("Data is successfully updated!");
				else
					System.out.println("no connection");
				String sql1 = "select time from Timer";
				// PreparedStatement ps = con.prepareStatement(sql);
				//   ps.executeUpdate();
				Statement stmt1 = null;
				stmt1 = con.createStatement();

				rs = stmt1.executeQuery(sql1);
System.out.print("hi");
				while (rs.next()) {
					a1 = rs.getInt(1);
					//System.out.println(rs.getInt(1)); //+"  "+rs.getString(2)+"  "+rs.getString(3));  
				}

				String sql = "Update Timer set time=?"; // Here u could set for which team time update krna hai like where teamname=...
				// here i have done subtraction not exact values. You guys would have exact values because of sessions
				// as i have not created sessions
				a1 = a1 - 60000;
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, a1);
				ps.executeUpdate();
				System.out.print("hi");

				//step5 close the connection object  
				con.close();

			} catch (Exception e1) {
				out.println(e1);
			}%>
		});
					}
				}, 1000);
	</script>
</head>
<body>

<h1 id="demo">A</h1>
</body>
</html>
