<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <!--
    	jqva.sql.* 패키지 하위ㅇ의 모든 클래스를 import
    		Connection 객체			: DataBase (Oracle, MSSQL, MySQL)
    		Statement 객체			: CRUD를 사용해서 Select, Insert, UPDATE, Delete, 
    		PreparedStatement 객체	: Statement 객체의 업그레이드 버전, 성능개선, 구문 간략
    		ResultSet 객체			: DB에서 Select 한 결과를 저장하는 객체
      -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oracle DB Connection</title>
</head>
<body>
	<%
	//변수 초기화 		//JSP 블락내에서 주석
	Connection conn=null;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	Boolean connect=false;		//접속이 잘 되었는지 확인하는 변수
	
	try{
	Class.forName(driver);//오라클 드라이버를 로드함
	conn=DriverManager.getConnection(url,"C##HR","1234");
	
	connect=true;
	conn.close();
	}catch(Exception e){
		connect=false;
		e.printStackTrace();
	}
	//조건을 사용해서 잘 연결되면 잘 연결되었다고 확인 메시지 출력
	if(connect==true){
		out.println("오라클 DB에 잘 연결 되었습니다.");
	}else{
		out.println("오라클 DB에 연결을 실패했습니다.");
	}
	%>
</body>
</html>