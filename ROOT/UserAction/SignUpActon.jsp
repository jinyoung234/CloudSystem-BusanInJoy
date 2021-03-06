<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.UserDAO" %> 
<%@ page import= "dto.UserDTO" %> 
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String email = request.getParameter("email");
    //회원 이미지 업로드 구현x

    UserDAO dao = new UserDAO();
    
    if (dao.checkID(id)) {
        %>
        <script>
            alert("중복된 ID 입니다. 다시 회원가입해주십시요.");
            location.href="/SignUp/SignUp.jsp";
        </script> <%
    }
    else if (dao.checkEmail(email)) {
        %>
        <script>
            alert("중복된 이메일 입니다. 다시 회원가입해주십시요.");
            location.href="/SignUp/SignUp.jsp";
        </script> <%
    }
    else if (dao.signUp(id, pw, name, age, email)) {
        %>
        <script>
            alert("회원가입에 성공하였습니다. 로그인 해주십시요.");
            location.href="../Welcome.html";
        </script> <%
    }
    else {
        %>
        <script>
            alert("회원가입 도중 오류가 발생하였습니다.");
            location.href="/SignUp/SignUp.jsp";
        </script> <%
    }
%>
