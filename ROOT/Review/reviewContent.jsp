<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.ReviewDAO" %> 
<%@ page import= "dto.ReviewDTO" %> 
<%
String selectNo = request.getParameter("selectNo");
String vpage = request.getParameter("vpage");
ReviewDAO dao = new ReviewDAO();
ReviewDTO dto = dao.selectNo(selectNo);

String no =Integer.toString(dto.getR_no()); 
String title = dto.getR_title();
String content = dto.getR_content();
String rating = Integer.toString(dto.getR_rating());
String uid = dto.getR_uid();
String date = dto.getR_date();
date = date.substring(0,10);


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>리뷰 작성 페이지</title>
</head>
<body>
    <div class="board_wrap">
        <div class="board_title"  style="margin-top:250px;"">
            <strong>리뷰 내용</strong>
            <p>리뷰 내용 입니다.</p>
        </div>
        <form method="post">
        <div class="borad_write_wrap">
            <div class="board_write">
                 <div class="title">
                     <dl>
                         <dt>제목</dt>
                         <dd><%=title%></dd>
                     </dl>
                 </div>
                 <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%=uid%></dd>
                    </dl>
                    <dl>
                        <dt>평점</dt>
                        <dd><%=rating%></dd>
                    </dl>
                 </div>
                 <div class="cont">
                    <textarea placeholder="내용 없음." name ="content" disabled><%=content%></textarea>
                 </div>
            </div>
            <div class="bt_wrap">
                <!-- <input type="submit" class="on" value="삭제" onclick="javascript: form.action='reviewDelete.jsp';"> -->
                <!-- <a href="reviewWrite.jsp" class="on">등록</a> -->
                <a href="javascript:window.history.go(-1);" style="width:80px;">뒤로가기</a>                
            </div>
        </div>
    </form>
    </div>
</body>
</html>