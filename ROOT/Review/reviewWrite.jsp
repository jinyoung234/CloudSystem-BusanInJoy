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
    String uid =(String)session.getAttribute("sessionId");
    String fid = request.getParameter("fid");

    ReviewDAO dao = new ReviewDAO();

    if(dao.insert(title, content, Integer.parseInt(rating), uid, fid)) {
        if(Integer.parseInt(rating)>=1 && Integer.parseInt(rating)<=5)  out.print("<script>alert('리뷰가 등록되었습니다.');</script>");
        else out.print("<script>alert('평점은 1~5점까지 입력 가능합니다. 다시 시도해주세요.');</script>");
    }   
    else out.print("<script>alert('리뷰 등록에 실패하였습니다. 다시 시도해주세요.');</script>");
 %>
<%
    out.println("<script>location.href='javascript:window.history.go(-2);'</script>");
    out.println("<script>location.href='javascript:location.reload();'</script>");

%>

