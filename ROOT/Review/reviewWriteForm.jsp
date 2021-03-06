<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.ReviewDAO" %> 
<%@ page import= "dto.ReviewDTO" %> 

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
    <%

    String fid = request.getParameter("fid");
%>
    <div class="board_wrap">
        <div class="board_title" style="margin-top:250px;">
            <strong>리뷰 작성</strong>
            <p>리뷰 작성 페이지입니다.</p>
        </div>
        <form method="post">
        <div class="borad_write_wrap">
            <div class="board_write">
                 <div class="title">
                     <dl>
                         <dt>제목</dt>
                         <dd><input type="text" placeholder="제목 입력" name="title"  required></dd>
                     </dl>
                 </div>
                 <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%=(String)session.getAttribute("sessionId")%></dd>
                    </dl>
                    <dl>
                        <dt>평점</dt>
                        <dd><input type="number" min="1" max="5" value="5" name="rating"  required></dd>
                    </dl>
                 </div>
                 <div class="cont">
                    <textarea placeholder="내용 입력" name ="content"  required></textarea>
                 </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" class="on" value="등록" onclick="javascript: form.action='reviewWrite.jsp?fid=<%=fid%>';">
                <a href="javascript:window.history.back();" style="width:80px;">취소</a>                
            </div>
        </div>
    </form>
    </div>
</body>
</html>