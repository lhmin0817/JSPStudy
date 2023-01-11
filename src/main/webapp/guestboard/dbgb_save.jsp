<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  사용할 클래스를 해당 패키지에서 import -->   
<%@ page import="java.sql.*, java.util.*" %>
<!-- 클라이언트에서 유니코드를 UTF-8로 처리(MCVC Mode1) -->
<!-- JSP에서 내장 객체 : IMport없이 사용가능 한 객체 
request 객체 : 클라이언트에서 넘겨주는 정보를 서버에서 받아서 처리
response 객체  : 서버에서 클라이언트에게 정보를 처리하는 객체
-->

<% request.setCharacterEncoding("UTF-8"); %>

<!-- DB를 접속하는 파일을 include 해서 사용 -->
<%@ include file="conn_oracle.jsp" %>

<!-- 폼에서 넘겨주는 변수와 값을 받아서 저장 : request.getParameter("변수명"); -->
<%
	String na=request.getParameter("name");
	String em=request.getParameter("email");
	String sub=request.getParameter("subject");
	String cont=request.getParameter("content");
	String ymd=(new java.util.Date()).toLocaleString();
%>
<!-- 폼에서 넘긴 변수를 출력 후 주석 처리 -->
<%--
	//out.println("na 변수의 담긴 값 :" +na+"<p/>");
	//out.println("em 변수의 담긴 값 :" +em+"<p/>");
	//out.println("sub 변수의 담긴 값 :" +sub+"<p/>");
	//out.println("cont 변수의 담긴 값 :" +cont+"<p/>");
	//out.println("ymd 변수 담긴 값 :"+ymd+"<p/>");
--%>
<%= "na변수의 담긴 값 :"+na+"<p/>"%>
<!-- 변수에 넘어오는 값을 SQL퀄리에 담아서 DB에 저장 -->



<%
	String sql=null;	//sql <== SQL쿼리를 담는 변수
	Statement stmt=null;	//SQL 쿼리를 DB에 적용하는 객체
	
	try{
	//Connection 객체의 conn.createStatement()메소드를 사용해서 stmt객체에 할당
	stmt=conn.createStatement();
	sql="INSERT into guestboard(name,email,inputdat, subject, content) values('"+na+"','"+em+"','"+ymd+"','"+sub+"','"+cont+"')";
	out.println(sql);
	
	//int cnt=0; //sql쿼리가 잘 처리도었는지 확인 변수
	//Statement 객체가 sql쿼리를 실행해서 DB에 저장
	//cnt=stmt.executeUpdate(sql);	//Statement 객체의 excuteUpdate(sql):inset, update, delete
	stmt.executeQuery(sql);			//Statement 객체의 excuteQuery(sql):select
										//Recordset  객체로 리턴을  시켜줌 : select 한 결과를 담은 객체
	//out.println(cnt);
	
	//Statment 객체나 PreparedSteatement 객체를 사용해서 Insert/Update/Delete 
				//저장할 경우 commit는 자동으로 처리됨
				
	//if(cnt>0){
	//	out.println("DB에 잘 insert되었습니다");
	//}else{
	//	out.println("DB에 저장을 실패했습니다.");
	//}
	}
	catch (Exception e){
		out.println("DataBase Insert 중 문제가 발생  되었습니다. <p/>");
		out.println("고객센터 : 02-1111-1111로 문의 바랍니다");
		e.printStackTrace();
	}finally{
		//사용한 객체를 close() Connection, Statement 객체 메모리에서 제거
		if(conn!=null){
			conn.close();
		}
		if(stmt !=null){
			stmt.close();
		}
	}
	//  dbgb_save.jsp : 폼에서  받은 값을 DB에 저장이 완료되면 출력 페이지로 이동
	
%>
<jsp:forward page="dbgb_show03.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기의 폼의 변수의 값을 받아서 DB에 저장 후 보기 페이지로 전달</title>
</head>
<body>
	
</body>
</html>