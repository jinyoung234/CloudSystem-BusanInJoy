 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.ReviewDAO" %> 
<%@ page import= "dto.ReviewDTO" %> 
<%@ page import= "dao.FeedDAO" %> 
<%@ page import= "dto.FeedDTO" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>

                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>BusanInJoy!</title>
                        <link rel="stylesheet" href="style.css">
                        <meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
                        <meta name="description" content="">

                        <!-- Core theme CSS (includes Bootstrap)-->
                        <link href="css/content.css" rel="stylesheet" />
                        <link href="/Review/css/style.css" rel="stylesheet" />

                        <!-- -->
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                            crossorigin="anonymous">



                        <style>
                            .tab_type1 {
                                width: 100%;
                                height: 50%;
                                display: flex;
                                justify-content: center;
                            }

                            .tab_content {
                                width: 100%;
                                height: 90%;
                            }
                        </style>



                    </head>

                    <body id="page-top">
                        <% 
                        String key = "";
                        String result = "";
                        List foodList = new ArrayList();
                        FeedDAO feedDAO = new FeedDAO();
                        ReviewDAO reviewDAO = new ReviewDAO();
                        List<FeedDTO> feedList = feedDAO.selectAll();
                        
                        try {
                            URL url = new URL("http://apis.data.go.kr/6260000/FoodService/getFoodKr?serviceKey=wUEtd8BhDy7yesRSMeUkuPQAU63BIllURM2vJUlvKO3YihCA%2B6JGfQHNlxDaYd8rTifOGVq4Ve6IpmJ8mGoYeA%3D%3D&pageNo=1&%20numOfRows=1&resultType=json");
                            BufferedReader bf;
                    
                            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
                            result = bf.readLine();
                        
                            JSONParser jsonParser = new JSONParser();
                            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
                            JSONObject getFoodingKr = (JSONObject)jsonObject.get("getFoodKr");
                            JSONArray item  = (JSONArray)getFoodingKr.get("item");
                            JSONObject items = (JSONObject)item.get(1);
                            
                            String Maintitle = (String)items.get("MAIN_TITLE");
                            foodList.add(Maintitle);

                            String image = (String)items.get("MAIN_IMG_THUMB");
                            foodList.add(image);

                            String information = (String)items.get("ITEMCNTNTS");
                            foodList.add(information);

                            String menu = (String)items.get("RPRSNTV_MENU");
                            foodList.add(menu);

                            String address = (String)items.get("ADDR1");
                            foodList.add(address);

                            String useTime = (String)items.get("USAGE_DAY_WEEK_AND_TIME");
                            foodList.add(useTime);

                            FeedDAO f = new FeedDAO();
                            f.addInfo(6, Maintitle, menu, image, 0, 0);

                        } catch (ParseException e){
                            e.printStackTrace();
                            out.print("에러");
                        }
                    %>  
                        <section>
                            <nav class="navbar navbar-expand-xxl navbar-dark fixed-top bg-dark">
                                <div class="container-fluid">
                                    <a class="navbar-brand" href="/main/main.jsp">
                                        <h1><b>BusanInJoy!</b></h1>
                                    </a>
                                    <div class="collapse navbar-collapse" id="navbarCollapse">

                                        <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
                                            <a class="me-3 py-2 text-white text-decoration-none"><%= session.getAttribute("sessionId") %> 님, 환영합니다. </a>
                                            <a class="me-3 py-2 text-white text-decoration-none" href="/UserAction/LogoutAction.jsp">로그아웃</a>
                                            <a class="me-3 py-2 text-white text-decoration-none" href="/Mypage/Mypage.jsp">마이페이지</a>                                
                                        </nav>

                                    </div>
                                </div>
                        </section>

                                    <pre>


                                    
                                    </pre>

                                    <section>
                                        <div class="text-center text-dark">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-4 mb-5 mb-lg-0">
                                                        <h2 class="text-uppercase mb-4"><a style="text-decoration: none; color:black;" href="FoodContent2.jsp"><% 
                                                            out.print(foodList.get(0));
                                                            %></a></h2>
                                                        <hr>
                                                        <p class="lead mb-0">
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>



                                    <div class="path-section">
                                        <div class="icon-img"><img src="home.png" style="width:25px; height:25px" />
                                        </div>
                                        <div class="icon-img"><img src="arrow-right.png"
                                                style="width:30px; height:25px" />
                                        </div>
                                        <div class="path-text">
                                            <h6 style="font-size : 15px;"><a style="text-decoration: none; color:black;" href="/SubPage/Food.jsp">Food</a></h6>
                                        </div>
                                        <div class="icon-img"><img src="arrow-right.png"
                                                style="width:30px; height:25px" />
                                        </div>
                                        <div class="path-text">
                                            <h6 style="font-size : 15px;" class="text-uppercase mb-4"><a style="text-decoration: none; color:black;" href="FoodContent2.jsp"><% 
                                                out.print(foodList.get(0));
                                                %></a></h6>
                                        </div>
                                    </div>

                                    <ul class="contentlist">
                                        <li>
                                            <div class="first-list">
                                                <div class="score">
                                                    <div>
                                                        <h5>평점</h5>
                                                    </div>
                                                    <div><img src="star.png" style="width:17px; height:17px" /></div>
                                                    <div>
                                                        <h5><%=reviewDAO.countRating(6)%></h5>
                                                    </div>
                                                </div>
                                                <div class="count">
                                                    <div>
                                                        <h5>조회</h5>
                                                    </div>
                                                    <div><img src="view-details.png" style="width:17px; height:17px" />
                                                    </div>
                                                    <div>
                                                        <h5><% out.print(feedList.get(5).getF_count()); %>
                                                            <% feedDAO.updateCount(6); %></h5>
                                                    </div>
                                                </div>
                                                <div class="re">
                                                    <div>
                                                        <h5>리뷰</h5>
                                                    </div>
                                                    <div><img src="comment.png" style="width:17px; height:17px" /></div>
                                                    <div>
                                                        <h5><%=reviewDAO.countReview(6)%></h5>
                                                        <% feedDAO.updateReview(reviewDAO.countReview(6), 6); %>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li style="display: flex; width: 480px; justify-content:flex-end; margin-right: 30px;">
                                            <div style="margin-right:10px;" class="last-list">
                                                <div style="padding-top:15px;">
                                                    <a style="font-size:14px; text-decoration: none; color:black;" href="https://search.naver.com/search.naver?sm=tab_hty.top&where=view&query=%EB%A7%8C%ED%98%B8%EA%B0%88%EB%AF%B8+%EC%83%A4%EB%B8%8C%EC%83%A4%EB%B8%8C&oquery=%EB%A7%8C%EB%93%9C%EB%A6%AC%EA%B3%A4%EB%93%9C%EB%A0%88%EB%B0%A5&tqi=hphD%2Fsp0YiRssaBQVEwsssssszd-493290&mode=normal"><p style="text-align: center;">추가 정보</p></a>
                                                </div>
                                            </div>
                                            <div class="last-list">
                                                <div style="padding-top:15px;">
                                                    <a style="font-size:14px; text-decoration: none; color:black;" href="/SubPage/Food.jsp"><p style="text-align: center;">카테고리 이동</p></a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>

                                    <!--tab-->
                                    <div class="tab-inner">
                                        <div class="tab-btn">
                                            <a href="#tab1">상세정보</a>
                                            <a href="#tab2">지도</a>
                                            <a href="#tab3">이용안내</a>
                                            <a href="#tab4">리뷰</a>
                                        </div>
                                        <div class="tab-content">
                                            <div id="tab1" class="tab">
                                                  
                                         <section>
                                                <h1 class="mt-3">
                                                    <b><%
                                                    out.print(foodList.get(0));
                                                    %></b>
                                                </h1>
                                                
                                                <img class="mt-4" src=<% out.print(foodList.get(1)); %>>
                                                <div style="width:1050px;" class="mt-2">
                                                    <%
                                                     out.print(foodList.get(2)); 
                                                     %>
                                                </div>
                                                <p class="mt-2">
                                                    <h2><b><%
                                                     out.println("대표메뉴"); 
                                                     %></b></h2>
                                                     <%
                                                     out.println(foodList.get(3));
                                                     %>
                                                </p>
                                                
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
          
                                         </section>    
                                            </div>
                                            <div id="tab2" class="tab">
                                                <p class="mt-2">
                                                    <h2><b><%
                                                        out.println("위치"); 
                                                        %></b></h2>
                                                        <h4>
                                                            <%
                                                        out.println(foodList.get(4));
                                                        %>
                                                        </h4>
                                                        
                                                </p>
                                                <p>
                                                    <div id="map" style="width:1200px;height:550px;"></div>
                                                    <script type="text/javascript"
                                                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=26747c65726da5e5602d24ad6195c707"></script>
                                                    <script>
                                                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(35.101425, 128.92914), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(35.101425, 128.92914); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    var iwContent = '<div style="padding: 1em 2em; margin: 2em 0; font-weight: bold; 5px #000000; "><h4><b>만호갈미 샤브샤브 </b></h4> <br> <h6><b>부산광역시 강서구 르노삼성대로 602</b></h6> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(35.101425, 128.92914); //인포윈도우 표시 위치입니다
    
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position : iwPosition, 
        content : iwContent 
    });
    infowindow.open(map, marker); 
                                                    </script>


                                                </p>
                                            </div>
                                            <div id="tab3" class="tab">
                                                <p class="mt-2">
                                                    <h3><b><%
                                                        out.println("영업시간"); 
                                                        %></b></h3>
                                                       
                                                       <h4>
                                                        <%
                                                        out.println(foodList.get(5));
                                                        %>
                                                       </h4> 
                                                    </p>
                                            </div>
                                            <div id="tab4" class="tab">
                                                <div class="board_wrap">
                                                    <div class="board_title">
                                                        <strong>리뷰 목록</strong>
                                                        <p>만호갈미 샤브샤브 리뷰 목록입니다.</p>
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
                                                             
                                  
                                                              List<ReviewDTO> list = reviewDAO.selectAll(); // review 테이블에서 모든 튜플을 dto객체로 받아옴.
                                                             
                                                              String vpage = request.getParameter("vpage");
                                                              if(vpage==null) { // 디폴트 페이지는 1페이지
                                                                  vpage= "1";
                                                              }
                                                              int v_page = Integer.parseInt(vpage); // 사용자가 클릭한 페이지 값을 받음
                                                              int startIdx = (v_page-1)*5; // 출력 시작할 행 번호
                                                              int endIdx =(v_page*5-1)>=list.size()?list.size():(v_page*5-1)+1; // 출력 끝낼 행 번호
                                                              int pageNum=(int)Math.ceil((double)list.size()/5); // 리뷰글을 한 페이지에 5개씩 출력해줄때 총 필요한 페이지 개수.
                                                              
                                                                String str=null;
                                                                int idx=0;
                                                    
                                                                for(int j=0;j<list.size(); j++) { // 받아온 dto객체 중 i번째 dto객체의 content속성(리뷰 내용)값
                                                                    String fid=list.get(j).getR_fid();
                                                                    if(fid.equals("6")) {
                                                                        idx++;
                                                                        String no =Integer.toString(list.get(j).getR_no()); 
                                                                        String title = list.get(j).getR_title();
                                                                        String content = list.get(j).getR_content();
                                                                        String rating = Integer.toString(list.get(j).getR_rating());
                                                                        String uid = list.get(j).getR_uid();
                                                                        String date = list.get(j).getR_date();
                                                                        date = date.substring(0,10);
                                                                    
                                                                  
                                                               %>
                                                               <div>
                                                                <div class="num"><%=idx%></div>
                                                                <div class="title"><a href="/Review/reviewContent.jsp?selectNo=<%=no%>"><%=title%></a></div> // 선택한 게시글 번호를 넘겨줌
                                                                <div class="writer"><%=uid%></div>
                                                                <div class="date"><%=date%></div>
                                                              </div>
                                                  
                                                               <%
                                                            } //if-end
                                                        } //for-end 
                                                              %>
                                                        </div>
                                                        <div class="bt_wrap">
                                                            <a href="/Review/reviewWriteForm.jsp?fid=6" class="on">리뷰작성</a>
                                                            <!-- <a href="a">작성</a> -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    </section>

                                    <style>
                                        .tab-inner{
                                            width:1800px;
                                            margin: 50px auto;
                                            text-align: center;
                                           
                                        }
                                        
                                        .tab-btn a{
                                            background-color: black;
                                            color:white;
                                            display: inline-block;
                                            width: 300px;
                                            text-align: center;
                                            padding: 10px;
                                            margin-right: -2px;
                                            font-weight: 500;
                                            text-transform: uppercase;
                                            text-align: center;
                                            font-size: large;
                                            text-decoration: none;
                                            
                                        }
                                        .tab-content{
                                            position: relative;
                                            text-align: left;
                                            margin-left: 300px;
                                        }
                                        .tab{
                                            position:absolute;
                                            top: 0;
                                            left: 0;
                                            opacity: 0;
                                            transition: 0.5s;
                                        }
                                        .tab h2{
                                            text-transform: uppercase;
                                        }
                                        .tab p{
                                            text-transform: uppercase;
                                            width: 100%;
                                        }
                                        .tab:target{
                                            opacity: 1;
                                        }
                                        </style>

                                    <section>
                                        <footer class="footer text-center text-white bg-dark fixed-bottom">
                                            <div class="container">
                                                <div class="row">
                                                    <!-- Footer Location-->
                                                    <div class="col-lg-4 mb-5 mb-lg-0">
                                                        <h3 class="text-uppercase mb-4"><b>위치</b></h3>
                                                        <p class="lead mb-0">
                                                            부산광역시 부산진구 엄광로 176
                                                            <br />
                                                            동의대학교, 정보관
                                                        </p>
                                                    </div>
                                                    <!-- Footer Social Icons-->
                                                    <div class="col-lg-4 mb-5 mb-lg-0">
                                                        <h3 class="text-uppercase mb-4"><b>바로가기</b></h3>
                                                        <a  href="#!"><img
                                                                src="door.jpg" width="50" height="50"></a>
                                                        <a  href="#!"><img
                                                                src="deu.png" width="50" height="50"></a>
                                                    </div>
                                                    <!-- Footer About Text-->
                                                    <div class="col-lg-4">
                                                        <h3 class="text-uppercase mb-4"><b>Team 버스태워조</b></h3>
                                                        <p class="lead mb-0">
                                                            이주혁 | 양은지 |
                                                            신채은 | 손진영
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </footer>
                                    </section>
                                    <script
                                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                                        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                                        crossorigin="anonymous"></script>

                    </body>

                    </html>











