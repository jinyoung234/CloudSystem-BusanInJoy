<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.UserDAO" %> 
<%@ page import= "dto.UserDTO" %> 
<%
    request.setCharacterEncoding("utf-8");

            session.invalidate();
            response.sendRedirect("../Welcome.html");
            %>
