<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="conn_oracle.jsp"%>
<HTML>
<HEAD>
<SCRIPT language="javascript">
	function check() {
		with (document.msgwrite) {
			if (subject.value.length == 0) {
				alert("제목을 입력해 주세요!!");
				subject.focus();
				return false;
			}
			if (name.value.length == 0) {
				alert("이름을 입력해 주세요!!");
				name.focus();
				return false;
			}
			if (password.value.length == 0) {
				alert("비밀번호를 입력해 주세요!!");
				password.focus();
				return false;
			}
			if (content.value.length == 0) {
				alert("내용을 입력해주세요!!");
				content.focus();
				return false;
			}
			document.msgwrite.submit();
		}
	}
</SCRIPT>
<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>

<%
String sql=null;		
Statement stmt=null;
ResultSet rs=null;

//DB 에서 값을 가져와서 저장하는 변수

String sub=null;		//테이블에서 제목을 저장하는 변수
String cont=null;		//태아블의 글 내용을 저자아하는 변수 : content
int step=0;				//freeboaed 테이블의 step 컬럼값을 저장
int mid=0;				//freeboaed 테이블의 mid 컬럼값을 저장
int rnum=0;				//freeboaed 테이블의 rnum 컬럼값을 저장

int id = Integer.parseInt(request.getParameter("id"));
sql= "select * from freeboard where id ="+id;
stmt=conn.createStatement();
rs=stmt.executeQuery(sql);

if(!(rs.next())){
	out.println("해당 내용이 없습니다.");
}else {
	//rs 의 값이 존재할 때
	cont=">"+rs.getString("content");//DB의 내용글을 가져와서 글앞에 ">" 출력
	sub=rs.getString("subject");
	step=rs.getInt("step");
	mid=rs.getInt("materid");
	rnum=rs.getInt("replaynum");
	
	
	//DB의 값이 변수에 잘 저장되엇는지 확인 
	out.println(subject+"<p/>");
	out.println(cont+"<p/>");
	out.println(step+"<p/>");
	out.println(mid+"<p/>");
	out.println(rnum+"<p/>");

%>
	<P>
	<FORM name="msgwrite" method=POST action="freeboard_upddb.jsp">
		<table width="600" cellspacing="0" cellpadding="2" align="center">
			<tr>
				<td colspan="2" bgcolor="#1F4F8F" height="1"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#DFEDFF" height="20" class="notice">&nbsp;&nbsp;<font
					size="2">글 수정하기</font></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#1F4F8F" height="1"></td>
			</tr>
			<tr>
				<td width="124" height="30" align="center" bgcolor="#f4f4f4">이
					름</td>
				<td width="494" style="padding: 0 0 0 10"><input type=text
					name=name value="" class="input_style1"></td>
			</tr>
			<tr>
				<td width="124" align="center" bgcolor="#f4f4f4">E-mail</td>
				<td width="494" style="padding: 0 0 0 10" height="25"><input
					type=text name=email value="" class="input_style1"></td>
			</tr>
			<tr>
				<td width="124" align="center" bgcolor="#f4f4f4">제 목</td>
				<td width="494" style="padding: 0 0 0 10" height="25"><input
					type=text name=subject size="60" value="" class="input_style2">
				</td>
			</tr>
			<tr>
				<td width="124" height="162" align="center" valign="top"
					bgcolor="#f4f4f4" style="padding-top: 7;">내 용</td>
				<td width="494" valign="top" style="padding: 5 0 5 10"><textarea
						name=content cols="65" rows="10" class="textarea_style1"> </textarea>
				</td>
			</tr>
			<tr>
				<td width="124" align="center" bgcolor="#f4f4f4">암 호</td>
				<td width="494" style="padding: 0 0 0 10" height="25"><input
					type='password' name='password' class="input_style1"><br>(정확한
					비밀번호를 입력해야만 수정이 됩니다.)</td>
			</tr>
			<tr>
				<td colspan="2" height="1" class='button'></td>
			</tr>
			<tr>
				<td colspan="2" height="1" bgcolor="#1F4F8F"></td>
			</tr>
			<tr>
				<td colspan="2" height="10"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="64%">&nbsp;</td>
							<td width="12%"><a href="#" onClick="check();"><img
									src="image/ok.gif" border="0"></a></td>
							<td width="12%"><a href="#" onClick="history.go(-1)"><img
									src="image/cancle.gif" border="0"></td>
							<td width="12%"><A href="freeboard_list03.jsp"> <img
									src="image/list.jpg" border=0></a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</FORM>
<%
}
%>

</BODY>
</HTML>