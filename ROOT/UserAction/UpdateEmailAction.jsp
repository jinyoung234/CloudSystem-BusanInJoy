<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.UserDAO" %> 
<%@ page import= "dto.UserDTO" %> 
<%

    Object ids=session.getAttribute("sessionId");
	String id = (String)ids;

	String email = request.getParameter("email");

	UserDAO dao = new UserDAO();


	if(dao.checkEmail(email))
	{%>
		<script>
			alert("회원 이메일이 중복됩니다. 다시 수정해주십시요.");
			location.href='/Update/UpdateEmail.jsp';
		</script><%
	}
	
	else if(dao.updateEmail(email, id)) {
%>
		<script>
			alert("회원 이메일이 수정되었습니다.");
			location.href='/Mypage/Mypage.jsp';
		</script>
<%
	}else {
%>
		<script>
			alert("회원 이메일 수정에 실패했습니다.");
			location.href='/Mypage/Mypage.jsp';
		</script>
<%
	}
%>