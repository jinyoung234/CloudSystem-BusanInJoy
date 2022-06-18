<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.UserDAO" %> 
<%@ page import= "dto.UserDTO" %> 
<%
    request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
            UserDAO dao = new UserDAO();
            
            int result = dao.login(id,pw);
            
            if (result == 1) {
                session.setAttribute("sessionId", id); %>
        <script>
            alert("로그인 성공");
            location.href="/main/main.jsp";
        </script> <%
            }
            
            else 
            %>
        <script>
            alert("로그인 실패");
            location.href="../Welcome.html";
        </script> <%%>