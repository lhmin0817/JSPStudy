<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<%@ include file="conn_oracle.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>


<%
String na = request.getParameter("name");
String em = request.getParameter("email");
String sub = request.getParameter("subject");
String cont = request.getParameter("content");
String pw = request.getParameter("password");

int id = 1; 

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat myformat = new SimpleDateFormat("yy-mm-d h:m a");
String ymd = myformat.format(yymmdd);



String sql = null;
Statement stmt = null;
ResultSet rs = null;

try {

	stmt = conn.createStatement();
	sql = "select max(id) from freeboard";
	rs = stmt.executeQuery(sql);



	if (!(rs.next())) {
		id = 1;
	} else { 
		id = rs.getInt(1) + 1;
	}

	sql = "insert into freeboard (id, name, password, email, subject, content, inputdate,masterid, readcount, replaynum, step)";
	sql = sql + " values(" + id + ",'" + na + "','" + pw + "','" + em + "','" + sub + "','" + cont + "','" + ymd + "'," + id + ","
	+ "0 ,0 ,0)";

	stmt.executeUpdate(sql);
	
} catch (Exception e) {
	out.println("오류 발생 <p/>");
	out.println("고객센터 이용 문의 바람 <p/>");
	//e.printStackTrace();
	
} finally {
	if (conn != null)
		conn.close();
	if (stmt != null)
		conn.close();
	if (rs != null)
		conn.close();
}

%>

<jsp:forward page="freeboard_list03.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>