<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.UserDAO" %> 
<%@ page import= "dto.UserDTO" %> 
<%

    Object ids=session.getAttribute("sessionId");
	String id = (String)ids;

	UserDAO dao = new UserDAO();

	boolean check = dao.deleteMember(id);
	
	if(check) {		
		session.invalidate();
%>
		<script>
			alert("회원 탈퇴가 정상처리되었습니다.");
			location.href='/Welcome.html';
		</script>
<%
	}else {
%>
		<script>
			alert("회원 탈퇴에 실패했습니다.");
			location.href='/Mypage/Mypage.jsp';
		</script>
<%
	}
%>