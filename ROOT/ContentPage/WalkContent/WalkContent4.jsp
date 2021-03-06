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
                        <title>BusanInJoy</title>
                        <link rel="stylesheet" href="style.css">
                        <meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">

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
                        List walkingList = new ArrayList();
                        FeedDAO feedDAO = new FeedDAO();
                        ReviewDAO reviewDAO = new ReviewDAO();
                        List<FeedDTO> feedList = feedDAO.selectAll();
                        
                        try {
                            URL url = new URL("http://apis.data.go.kr/6260000/WalkingService/getWalkingKr?serviceKey=wUEtd8BhDy7yesRSMeUkuPQAU63BIllURM2vJUlvKO3YihCA%2B6JGfQHNlxDaYd8rTifOGVq4Ve6IpmJ8mGoYeA%3D%3D&pageNo=1&%20numOfRows=1&resultType=json");
                            BufferedReader bf;
                    
                            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
                            result = bf.readLine();
                        
                            JSONParser jsonParser = new JSONParser();
                            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
                            JSONObject getWalkKr = (JSONObject)jsonObject.get("getWalkingKr");
                            JSONArray item  = (JSONArray)getWalkKr.get("item");
                            JSONObject items = (JSONObject)item.get(5);
                            
                            String Maintitle = (String)items.get("MAIN_TITLE");
                            walkingList.add(Maintitle);

                            String title = (String)items.get("TITLE");
                            walkingList.add(title);

                            String image = (String)items.get("MAIN_IMG_THUMB");
                            walkingList.add(image);

                            String information = (String)items.get("ITEMCNTNTS");
                            walkingList.add(information);

                            String address = (String)items.get("TRFC_INFO");
                            walkingList.add(address);

                            String useTime = (String)items.get("MIDDLE_SIZE_RM1");
                            walkingList.add(useTime);

                            FeedDAO f = new FeedDAO();
                            f.addInfo(16, Maintitle, title, image, 0, 0);

                        } catch (ParseException e){
                            e.printStackTrace();
                            out.print("??????");
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
                                            <a class="me-3 py-2 text-white text-decoration-none"><%= session.getAttribute("sessionId") %> ???, ???????????????. </a>
                                            <a class="me-3 py-2 text-white text-decoration-none" href="/UserAction/LogoutAction.jsp">????????????</a>
                                            <a class="me-3 py-2 text-white text-decoration-none" href="/Mypage/Mypage.jsp">???????????????</a>                                
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
                                                        <h2 class="text-uppercase mb-4"><a style="text-decoration: none; color:black;" href="WalkContent4.jsp"><% 
                                                            out.print(walkingList.get(0));
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
                                            <h6 style="font-size : 15px;"><a style="text-decoration: none; color:black;" href="/SubPage/Walk.jsp">Walk</a></h6>
                                        </div>
                                        <div class="icon-img"><img src="arrow-right.png"
                                                style="width:30px; height:25px" />
                                        </div>
                                        <div class="path-text">
                                            <h6 style="font-size : 15px;" class="text-uppercase mb-4"><a style="text-decoration: none; color:black;" href="WalkContent4.jsp"><% 
                                                out.print(walkingList.get(0));
                                                %></a></h6>
                                        </div>
                                    </div>

                                    <ul class="contentlist">
                                        <li>
                                            <div class="first-list">
                                                <div class="score">
                                                    <div>
                                                        <h5>??????</h5>
                                                    </div>
                                                    <div><img src="star.png" style="width:17px; height:17px" /></div>
                                                    <div>
                                                        <h5><%=reviewDAO.countRating(16)%></h5>
                                                    </div>
                                                </div>
                                                <div class="count">
                                                    <div>
                                                        <h5>??????</h5>
                                                    </div>
                                                    <div><img src="view-details.png" style="width:17px; height:17px" />
                                                    </div>
                                                    <div>
                                                        <h5><% out.print(feedList.get(15).getF_count()); %>
                                                            <% feedDAO.updateCount(16); %> 
                                                        </h5>
                                                    </div>
                                                </div>
                                                <div class="re">
                                                    <div>
                                                        <h5>??????</h5>
                                                    </div>
                                                    <div><img src="comment.png" style="width:17px; height:17px" /></div>
                                                    <div>
                                                        <h5><%=reviewDAO.countReview(16)%></h5>
                                                        <% feedDAO.updateReview(reviewDAO.countReview(16), 16); %>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li style="display: flex; width: 480px; justify-content:flex-end; margin-right: 30px;">
                                            <div style="margin-right:10px;" class="last-list">
                                                <div style="padding-top:15px;">
                                                    <a style="font-size:14px; text-decoration: none; color:black;" href="https://search.naver.com/search.naver?sm=tab_hty.top&where=view&query=%EB%B6%80%EC%82%B0+%EC%9B%90%EB%8F%84%EC%8B%AC%ED%88%AC%EC%96%B4&oquery=%EB%B6%80%EC%82%B0+%ED%94%BC%EB%9E%80%EC%88%98%EB%8F%84%EA%B8%B8&tqi=hphFysp0Jy0ssP0hbO0ssssssih-095197&mode=normal"><p style="text-align: center;">?????? ??????</p></a>
                                                </div>
                                            </div>
                                            <div class="last-list">
                                                <div style="padding-top: 15px;">
                                                    <a style="font-size:14px; text-decoration: none; color:black;" href="/SubPage/Walk.jsp"><p style="text-align: center;">???????????? ??????</p></a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>

                                    <!--tab-->
                                    <div class="tab-inner">
                                        <div class="tab-btn">
                                            <a href="#tab1">????????????</a>
                                            <a href="#tab2">??????</a>
                                            <a href="#tab3">????????????</a>
                                            <a href="#tab4">??????</a>
                                        </div>
                                        <div class="tab-content">
                                            <div id="tab1" class="tab">
                                            <section>
                                                <h1 class="mt-3"><b>
                                                    <% 
                                                    out.print(walkingList.get(0));
                                                    %>
                                                </b></h1>

                                                <h3 class="mt-3"><b>
                                                    <% 
                                                    out.print(walkingList.get(1));
                                                    %>
                                                </b></h3>
                                                
                                                <img class="mt-4" src=<% out.print(walkingList.get(2)); %>>
                                                <div style="width:1050px" class="mt-2">
                                                    <%
                                                     out.print(walkingList.get(3)); 
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
                                                    out.print(walkingList.get(0));
                                                    %>
                                                </b></h2>
                                                <br>
                                                <div id="map" style="width:1200px;height:550px;"></div>
                                                <script type="text/javascript"
                                                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=26747c65726da5e5602d24ad6195c707"></script>
                                                    <script>
                                                        var mapContainer = document.getElementById('map'), // ????????? ????????? div 
        mapOption = { 
            center: new kakao.maps.LatLng(35.11617,129.03847), // ????????? ????????????
            level: 3 // ????????? ?????? ??????
        };
    
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    // ????????? ????????? ??????????????? 
    var markerPosition  = new kakao.maps.LatLng(35.11617,129.03847); 
    
    // ????????? ???????????????
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    
    // ????????? ?????? ?????? ??????????????? ???????????????
    marker.setMap(map);
    var iwContent = '<div style="padding: 1em 2em; margin: 2em 0; font-weight: bold; 5px #000000; "><h4><b>?????? ????????? ??????</b></h4> <br> <h6><b>??????????????? ?????? ????????? ????????? 31</b></h6> </div>', // ?????????????????? ????????? ???????????? HTML ??????????????? document element??? ???????????????
        iwPosition = new kakao.maps.LatLng(35.11617,129.03847); //??????????????? ?????? ???????????????
    
    // ?????????????????? ???????????????
    var infowindow = new kakao.maps.InfoWindow({
        position : iwPosition, 
        content : iwContent 
    });
    infowindow.open(map, marker); 
                                                    </script>


                                                </p>
                                            </div>
                                            <div id="tab3" class="tab">
    
                                            </div>
                                            <div id="tab4" class="tab">
                                                <div class="board_wrap">
                                                    <div class="board_title">
                                                        <strong>?????? ??????</strong>
                                                        <p>??????????????? ?????? ???????????????.</p>
                                                    </div>
                                                    <div class="borad_list_wrap">
                                                        <div class="board_list">
                                                              <div class="top">
                                                                  <div class="num">??????</div>
                                                                  <div class="title">??????</div>
                                                                  <div class="writer">?????????</div>
                                                                  <div class="date">?????????</div>
                                                              </div>
                                                              <%
                                                             
                                                             
                                                              List<ReviewDTO> list = reviewDAO.selectAll(); // review ??????????????? ?????? ????????? dto????????? ?????????.
                                                             
                                                              String vpage = request.getParameter("vpage");
                                                              if(vpage==null) { // ????????? ???????????? 1?????????
                                                                  vpage= "1";
                                                              }
                                                              int v_page = Integer.parseInt(vpage); // ???????????? ????????? ????????? ?????? ??????
                                                              int startIdx = (v_page-1)*5; // ?????? ????????? ??? ??????
                                                              int endIdx =(v_page*5-1)>=list.size()?list.size():(v_page*5-1)+1; // ?????? ?????? ??? ??????
                                                              int pageNum=(int)Math.ceil((double)list.size()/5); // ???????????? ??? ???????????? 5?????? ??????????????? ??? ????????? ????????? ??????.
                                                              
                                                                String str=null;
                                                                int idx=0;
                                                    
                                                                for(int j=0;j<list.size(); j++){ // ????????? dto?????? ??? i?????? dto????????? content??????(?????? ??????)???
                                                                    String fid=list.get(j).getR_fid();
                                                                    if(fid.equals("16")) {
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
                                                                <div class="title"><a href="/Review/reviewContent.jsp?vpage=<%=vpage%>&selectNo=<%=no%>"><%=title%></a></div> // ????????? ????????? ????????? ?????????
                                                                <div class="writer"><%=uid%></div>
                                                                <div class="date"><%=date%></div>
                                                              </div>
                                                  
                                                               <%
                                                            } //if-end
                                                        } //for-end 
                                                              %>
                                                        </div>
                                                        <div class="bt_wrap">
                                                            <a href="/Review/reviewWriteForm.jsp?fid=16" class="on">????????????</a>
                                                            <!-- <a href="a">??????</a> -->
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
                                                        <h3 class="text-uppercase mb-4"><b>??????</b></h3>
                                                        <p class="lead mb-0">
                                                            ??????????????? ???????????? ????????? 176
                                                            <br />
                                                            ???????????????, ?????????
                                                        </p>
                                                    </div>
                                                    <!-- Footer Social Icons-->
                                                    <div class="col-lg-4 mb-5 mb-lg-0">
                                                        <h3 class="text-uppercase mb-4"><b>????????????</b></h3>
                                                        <a  href="#!"><img
                                                                src="door.jpg" width="50" height="50"></a>
                                                        <a href="#!"><img
                                                                src="deu.png" width="50" height="50"></a>
                                                    </div>
                                                    <!-- Footer About Text-->
                                                    <div class="col-lg-4">
                                                        <h3 class="text-uppercase mb-4"><b>Team ???????????????</b></h3>
                                                        <p class="lead mb-0">
                                                            ????????? | ????????? |
                                                            ????????? | ?????????
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













