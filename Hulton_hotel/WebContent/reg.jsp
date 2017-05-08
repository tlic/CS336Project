<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reg jsp</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String user= request.getParameter("userid");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

try{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/hulton", "root", "group14");
	Statement st=con.createStatement();
	ResultSet rs;
	int i=st.executeUpdate("insert into customer values ('"+user+"','"+pwd+"','"+name+"','"+addr+"','"+phone+"','"+email+"')"); 
	if(i > 0){
		out.println("registered.");
		out.println("Hello " + user);
	}else{
		out.println("error");
	}
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
<a href = "index.html"> Home</a>
<a href = "cust.html"> Customer Page</a>

</body>
</html>