<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.ReviewDAO" %>

        <%        

        ReviewDAO d = new ReviewDAO();
        String test = d.testDAO();
        out.print(test);
        %>
    <br>
        
  
