<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.ReviewDAO" %> 
<%@ page import= "dto.ReviewDTO" %> 
<%
// 1. 사용자 입력 받기 (작성한 리뷰)
request.setCharacterEncoding("utf-8");

String title=request.getParameter("title"); // 리뷰 제목
String content=request.getParameter("content"); // 리뷰 내용
String rating=request.getParameter("rating"); // 평점
String uid = request.getParameter("uid"); // 작성자 아이디

String input = uid + "," + title + ","+ content + ","+ rating+ ".";
out.print(input + "<br>");

// 2. 사용자 입력 저장하기 (리뷰 테이블에 저장하기)
ReviewDAO dao = new ReviewDAO();
int result=0;
if(dao.insert(title, content, Integer.parseInt(rating), uid))
    out.print("디비 저장 완료.<br>");
else out.print("디비 저장 실패.<br>");
%>


<!-- <% 

    List<ReviewDTO> res = dao.selectAll(); // review 테이블에서 모든 튜플을 dto객체로 받아옴.
    String str =Integer.toString(res.get(0).getR_no()); // 받아온 dto객체 중 0번째 dto객체의 content속성(리뷰 내용)값
    str += "/ " + res.get(0).getR_title();
    str += "/ " + res.get(0).getR_content();
    str += "/ " + res.get(0).getR_rating();
    str += "/ " + res.get(0).getR_uid();
    out.print(str);

    %> -->