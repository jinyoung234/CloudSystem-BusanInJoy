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

                    <body>
                        <% 
                        String key = "";
                        String result = "";
                        List festivalList = new ArrayList();
                        FeedDAO feedDAO = new FeedDAO();
                        ReviewDAO reviewDAO = new ReviewDAO();
                        List<FeedDTO> feedList = feedDAO.selectAll();
                        
                            try {
                                URL url = new URL("http://apis.data.go.kr/6260000/FestivalService/getFestivalKr?serviceKey=wUEtd8BhDy7yesRSMeUkuPQAU63BIllURM2vJUlvKO3YihCA%2B6JGfQHNlxDaYd8rTifOGVq4Ve6IpmJ8mGoYeA%3D%3D&pageNo=1&%20numOfRows=1&resultType=json");
                                BufferedReader bf;
                            
                                bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
                                result = bf.readLine();
                            
                                JSONParser jsonParser = new JSONParser();
                                JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
                                JSONObject getTourism = (JSONObject)jsonObject.get("getFestivalKr");
                                JSONArray item  = (JSONArray)getTourism.get("item");
                                JSONObject items = (JSONObject)item.get(2);                         
                                
                                String Maintitle = (String)items.get("MAIN_PLACE");
                                festivalList.add(Maintitle);

                                String title = (String)items.get("TITLE");
                                festivalList.add(title);

                                String image = (String)items.get("MAIN_IMG_THUMB");
                                festivalList.add(image);

                                String information = (String)items.get("ITEMCNTNTS");
                                festivalList.add(information);

                                String useTime = (String)items.get("USAGE_DAY_WEEK_AND_TIME");
                                festivalList.add(useTime);

                                String trfcInfo = (String)items.get("TRFC_INFO");
                                festivalList.add(trfcInfo);

                                String address = (String)items.get("ADDR1");
                                festivalList.add(address);

                                String tel = (String)items.get("CNTCT_TEL");
                                festivalList.add(tel);

                                String thisUrl = (String)items.get("HOMEPAGE_URL");
                                festivalList.add(thisUrl);

                                FeedDAO f = new FeedDAO();
                                f.addInfo(2, Maintitle, title, image, 0, 0);

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
                                                        <h2 class="text-uppercase mb-4"><a style="text-decoration: none; color:black;" href="FestivalContent2.jsp"><% 
                                                            out.print(festivalList.get(0));
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
                                            <h6 style="font-size : 15px;"><a style="text-decoration: none; color:black;" href="/SubPage/Festival.jsp">Festival</a></h6>
                                        </div>
                                        <div class="icon-img"><img src="arrow-right.png"
                                                style="width:30px; height:25px" />
                                        </div>
                                        <div class="path-text">
                                            <h6 style="font-size : 15px;" class="text-uppercase mb-4"><a style="text-decoration: none; color:black;" href="FestivalContent2.jsp"><% 
                                                out.print(festivalList.get(0));
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
                                                        <h5><%=reviewDAO.countRating(2)%></h5>
                                                    </div>
                                                </div>
                                                <div class="count">
                                                    <div>
                                                        <h5>조회</h5>
                                                    </div>
                                                    <div><img src="view-details.png" style="width:17px; height:17px" />
                                                    </div>
                                                    <div>
                                                        <h5><% out.print(feedList.get(1).getF_count()); %>
                                                            <% feedDAO.updateCount(2); %></h5>
                                                    </div>
                                                </div>
                                                <div class="re">
                                                    <div>
                                                        <h5>리뷰</h5>
                                                    </div>
                                                    <div><img src="comment.png" style="width:17px; height:17px" /></div>
                                                    <div>
                                                        <h5><%=reviewDAO.countReview(2)%></h5>
                                                        <% feedDAO.updateReview(reviewDAO.countReview(2), 2); %>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li style="display: flex; width: 480px; justify-content:flex-end; margin-right: 30px;">
                                            <div style="margin-right:10px;" class="last-list">
                                                <div style="padding-top:15px;">
                                                    <a style="font-size:14px; text-decoration: none; color:black;" href="http://www.gjfac.org/gjfac/main.php"><p style="text-align: center;">예약하기</p></a>
                                                </div>
                                            </div>
                                            <div class="last-list">
                                                <div style="padding-top:15px;">
                                                    <a style="font-size:14px; text-decoration: none; color:black;" href="/SubPage/Festival.jsp"><p style="text-align: center;">카테고리 이동</p></a>
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
                                                    <% 
                                                    out.print(festivalList.get(0));
                                                    %>
                                                </h1>
                                                <h3 class="mt-3">
                                                    <% 
                                                    out.print(festivalList.get(1));
                                                    %>
                                                </h3>
                                                
                                                <img class="mt-4" src=<% out.print(festivalList.get(2)); %>>
                                                
                                                <div style="width:1050px; height: 100px; margin-bottom: 50px;" class="mt-2">
                                                    <% 
                                                     out.print(festivalList.get(3)); 
                                                     %>
                                                </div>
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
                                                <h2 class="mt-3"><b>
                                                    <% 
                                                    out.print(festivalList.get(0));
                                                    %>
                                                </b></h2>
                                                <br>
                                                <h2 class="mt-2"><b>
                                                    <% 
                                                     out.print("주소"); 
                                                     %>
                                                    </b></h2>
                                                
                                                <h4 class="mt-2">
                                                    <% 
                                                     out.print(festivalList.get(6)); 
                                                     %>
                                                </h4>
                                                <p>
                                                <div id="map" style="width:1200px;height:550px;"></div>
                                                <script type="text/javascript"
                                                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=26747c65726da5e5602d24ad6195c707"></script>
                                                <script>
                                                    var container = document.getElementById('map');
                                                    var options = {
                                                        center: new kakao.maps.LatLng(35.23809, 129.08815),
                                                        level: 3
                                                    };
                                                   

                                                    var map = new kakao.maps.Map(container, options);

                                                    var markerPosition  = new kakao.maps.LatLng(35.23809, 129.08815); 

                                                    var marker = new kakao.maps.Marker({
                                                        position: markerPosition
                                                    });
                                                    marker.setMap(map);
                                                    var iwContent = '<div style="padding: 1em 2em; margin: 2em 0; font-weight: bold; 5px #000000; "><h4><b>부산 금정산성축제</b></h4> <br> <h6><b>부산광역시 금정구 장전온천천로 144</b></h6> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                                    iwPosition = new kakao.maps.LatLng(35.22585, 129.00346); //인포윈도우 표시 위치입니다
    
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
                                                <h2 class="mt-2"><b>
                                                    <%
                                                     out.print("이용안내"); 
                                                     %>
                                                    </b></h2>
                                                <h4 class="mt-2">
                                                    <%
                                                     out.print(festivalList.get(4)); 
                                                     %>
                                                </h4>
                                                <br>
                                                <div style="width:1050px;">
                                                <h2 class="mt-2"><b>
                                                    <% 
                                                     out.print("교통정보"); 
                                                     %>
                                                    </b></h2>
                                                <h4 class="mt-2">
                                                    <% 
                                                     out.print(festivalList.get(5)); 
                                                     %>
                                                </h4>
                                                </div>
                                                <br>
                                                <h2 class="mt-2"><b>
                                                    <% 
                                                     out.print("전화번호"); 
                                                     %> 
                                                    </b></h2>
                                                <h4 class="mt-2">
                                                    <% 
                                                     out.print(festivalList.get(7)); 
                                                     %> 
                                                </h4>
                                            </div>
                                            <div id="tab4" class="tab">
                                                <div class="board_wrap">
                                                    <div class="board_title">
                                                        <strong>리뷰 목록</strong>
                                                        <p>금정산성축제 리뷰 목록입니다.</p>
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
                                                              int idx=0;
                                                                for(int j=0;j<list.size(); j++) { // 받아온 dto객체 중 i번째 dto객체의 content속성(리뷰 내용)값
                                                                    String fid=list.get(j).getR_fid();
                                                                    if(fid.equals("2")) {
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
                                                            }
                                                        } //for-end 
                                                              %>
                                                        </div>
                                                        <div class="bt_wrap">
                                                            <a href="/Review/reviewWriteForm.jsp?fid=2" class="on">리뷰작성</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    </pre>
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
                                                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><img
                                                                src="door.jpg" width="50" height="50"></a>
                                                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><img
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





















