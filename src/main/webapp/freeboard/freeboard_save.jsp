<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 필요한 라이브러리 Import -->
<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<!-- DB Include -->
<%@ include file="conn_oracle.jsp"%>
<!-- form에서 넘오오는 값의 한글 처리 -->
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- form에서 넘어오는 데이터는 모두 String 으로 넘어온다. 
	 Integer.perseInt()
-->

<!-- Form에서 넘어오은 변수의 값을 받아서 새로운 변수에 할당 -->
<%
String na = request.getParameter("name");
String em = request.getParameter("email");
String sub = request.getParameter("subject");
String cont = request.getParameter("content");
String pw = request.getParameter("password");

int id = 1; //id에 처음 값을 할당할 때 기본값으로 1을 할당
//다음부터는 테이블의 id컬럼에서 Max 값을 가져와서 +1해서 처리

//날짜 처리
java.util.Date yymmdd = new java.util.Date();
//out.println(yymmdd); //Thu Jan 12 11:17:45 KST 2023
SimpleDateFormat myformat = new SimpleDateFormat("yy-mm-d h:m a");
String ymd = myformat.format(yymmdd);
//out.println(ymd); //23-17-12 11:17 오전

//DB에 값을 처리할 변수 선언 : Connention(conn) <= Incude 되어 있음
String sql = null;
Statement stmt = null;
ResultSet rs = null; //id 컬럼의 최대값을 select

try {

	//DB에서 값을 처리
	stmt = conn.createStatement();
	sql = "select max(id) from freeboard";//id : Primary Key
	//sql="select max(id) as id from freeboard";
	rs = stmt.executeQuery(sql);

	//rs.next();
	//out.println(rs.getInt(0)+"<p/>");
	//out.println(rs.getInt(1)+"<p/>");
	//if(true) return;

	//테이블의 id 컬럼의 값을 적용 : 최대 값을 가져와서 +1
	if (!(rs.next())) { // table의 값이 존재하지 않은 경우
		id = 1;
	} else { //table의 값이 존재하는 경우
		id = rs.getInt(1) + 1;
	}
	//Stamtment 객체는 변수값을 처리하는 것이 복잡하다 PareparedStatement 를 사용한다.
	//폼에서 념겨받은 갑을 DB에 insert 하는 쿼리 : 주의 (: masterid :id 컬럼에 들어오는 값으로 처리해야함)
	sql = "insert into freeboard (id, name, password, email, subject, content, inputdate,masterid, readcount, replaynum, step)";
	sql = sql + " values(" + id + ",'" + na + "','" + pw + "','" + em + "','" + sub + "','" + cont + "','" + ymd + "'," + id + ","
	+ "0 ,0 ,0)";
	


	//out.println(sql);
	//if (true)
		//return; //프로그램을 중지 시킴. 디버깅할 때 사용
	stmt.executeUpdate(sql);//DB저장 완료 commit을 자동으로 처리
	


} catch (Exception e) {
	out.println("오류 발생 <p/>");
	out.println("고객센터 이용 문의 바람 <p/>");
	e.printStackTrace();
} finally {
	if (conn != null)
		conn.close();
	if (stmt != null)
		conn.close();
	if (rs != null)
		conn.close();
}
//Try catch 블락으로 프로그램이 종료 되지 않도록 처리 후 객체 제거
%>
<%
// 페이지 이동 : response.sendRedirect : 클라이언트에서 페이지를 재요청 (URL 주소가 변경됨)
//			 forward : 서버에서 페이지로 이동 (URL 주소가 변경되지 않음)
//response.sendRedirect("freeboard_list.jsp");
%>

 
<jsp:forward page="freeboard_list.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>