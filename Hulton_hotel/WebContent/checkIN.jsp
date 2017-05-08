<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Confirmation</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String user = request.getParameter("userid");
String country = request.getParameter("country");
String check_in = request.getParameter("check-in");
String check_out = request.getParameter("check-out");
String room_type = request.getParameter("room_type");

try{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/hulton", "root", "group14");
	Statement st=con.createStatement();
	ResultSet rs;
	String query_string = "insert into reservation(userid, cnumber,checkIn,checkOut, totalaAmt, roomType) values (NULL,'"+user+"','"+ null +"',STR_TO_DATE('"+check_in+"','%d-%m-%Y'),STR_TO_DATE('"+check_out+"','%d-%m-%Y'),'"+"','"+null+room_type+"')";
	String q_string = "insert into reservation values ('" + user + "','"+ null + "','" +"', STR_TO_DATE('"+check_in+"','%d-%m-%Y'),'" + "'," + "', STR_TO_DATE('"+check_out+"','%d-%m-%Y'),'"+ "',"+ null + "','" + room_type + ")";
	int i= st.executeUpdate(q_string); 
	if (i > 0){
		out.println("Hello "+user+", your booking is done successfully");
	}
	else{
		out.println("Hello "+user+", your booking could not be completed. Sorry for the inconvenience");
		}
	}
catch(Exception e){
	e.printStackTrace();
	out.println("error");
}
%>
<a href = "index.html"> Home</a><br>
<a href = "cust.html"> Customer Page</a><br>
</body>
</html>