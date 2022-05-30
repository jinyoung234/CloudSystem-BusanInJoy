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
    <title>리뷰 목록 페이지</title>
</head>
<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>리뷰 목록</strong>
            <p>전체 리뷰 목록입니다.</p>
        </div>
        <div class="borad_list_wrap">
            <div class="board_list">
                  <div class="top">
                      <div class="num">번호</div>
                      <div class="title">제목</div>
                      <div class="writer">글쓴이</div>
                      <div class="date">작성일</div>
                  </div>
                  <%
                  ReviewDAO reviewDAO = new ReviewDAO();
                  List<ReviewDTO> list = reviewDAO.selectAll(); // review 테이블에서 모든 튜플을 dto객체로 받아옴.
                  String contentNum=request.getParameter("contentNum");
                  String vpage = request.getParameter("vpage");
          
                  if(vpage==null) { // 디폴트 페이지는 1페이지
                      vpage= "1";
                  }
                  int v_page = Integer.parseInt(vpage); // 사용자가 클릭한 페이지 값을 받음
                  int startIdx = (v_page-1)*5; // 출력 시작할 행 번호
                  int endIdx =(v_page*5-1)>=list.size()?list.size():(v_page*5-1)+1; // 출력 끝낼 행 번호
                  int pageNum=(int)Math.ceil((double)list.size()/5); // 리뷰글을 한 페이지에 5개씩 출력해줄때 총 필요한 페이지 개수.
                  
                    String str=null;
        
                    for(int i=startIdx;i<endIdx; i++) { // 받아온 dto객체 중 i번째 dto객체의 content속성(리뷰 내용)값
   
                        String no =Integer.toString(list.get(i).getR_no()); 
                        String title = list.get(i).getR_title();
                        String content = list.get(i).getR_content();
                        String rating = Integer.toString(list.get(i).getR_rating());
                        String uid = list.get(i).getR_uid();
                        String date = list.get(i).getR_date();
                        date = date.substring(0,10);
                        String fId=list.get(i).getR_fid();
                   %>
                   <div>
                    <div class="num"><%=list.size()-i%></div>
                    <div class="title"><a href="reviewContent.jsp?vpage=<%=vpage%>&selectNo=<%=no%>"><%=title%></a></div> // 선택한 게시글 번호를 넘겨줌
                    <div class="writer"><%=uid%></div>
                    <div class="date"><%=date%></div>
                  </div>
    
                   <%
                    } //for-end 
                  %>
            </div>
            <div class="board_page">
                <% // 페이징 처리
                
                for(int i=1;i<=pageNum;i++) {
                    if(i==v_page) out.print("<a href='reviewList.jsp?vpage=" + i +"' class=\"num on\">"+i+"</a>");
                    else out.print("<a href='reviewList.jsp?vpage=" + i +"' class=\"num\">"+i+"</a>"); // 선택한 페이지 값을 자기자신 페이지로 값 전달
                }
                
                
                %>
             <!--   <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
             
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>-->
            </div>
            <div class="bt_wrap">
                <a href="reviewWrite.html" class="on">리뷰 작성</a>
                <a href="/ContentPage/MarketContent/MarketContent<%=contentNum%>.jsp#tab4" class="on">뒤로가기</a>

                <!-- <a href="a">작성</a> -->
            </div>
        </div>
    </div>
</body>
</html>