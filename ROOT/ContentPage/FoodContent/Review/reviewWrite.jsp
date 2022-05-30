<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.ReviewDAO" %> 
<%@ page import= "dto.ReviewDTO" %> 
<%

    request.setCharacterEncoding("utf-8");
    String title=request.getParameter("title");
    String content=request.getParameter("content");
    String rating=request.getParameter("rating");
    String uid = request.getParameter("uid");
    

    ReviewDAO dao = new ReviewDAO();
    
    if((title!="" || content!="" || uid!="") && dao.insert(title, content, Integer.parseInt(rating), uid)) 
        out.print("<script>alert('리뷰가 등록되었습니다.');</script>");
    else out.print("<script>alert('리뷰 등록에 실패하였습니다. 다시 시도해주세요.');</script>");
 %>
    <!-- String res = title + ","+ content + ","+ rating + "," + uid +  ".";
    out.print(res); -->
<%
    // response.sendRedirect("reviewList.jsp");
    out.println("<script>location.href='reviewList.jsp'</script>");
%>

