<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.UserDAO" %> 
<%@ page import= "dto.UserDTO" %> 
<%

    Object ids=session.getAttribute("sessionId");
	String id = (String)ids;

	String name = request.getParameter("name");

	UserDAO dao = new UserDAO();

	boolean check = dao.updateName(name, id);
	
	if(check) {
%>
		<script>
			alert("회원 이름이 수정되었습니다.");
			location.href='/Mypage/Mypage.jsp';
		</script>
<%
	}else {
%>
		<script>
			alert("회원 이름 수정에 실패했습니다.");
			location.href='/Mypage/Mypage.jsp';
		</script>
<%
	}
%>