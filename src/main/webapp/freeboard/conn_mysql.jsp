<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MySQL DB Connection</title>
</head>
<body>
	<%
		//변수 초기화
		Connection conn=null;
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mydb";
		Boolean connect=false;
		
		try{
			Class.forName(driver);//오라클 드라이버를 로드함
			conn=DriverManager.getConnection(url,"root","1234");

			}catch(Exception e){
				e.printStackTrace();
			}
	%>
</body>
</html>