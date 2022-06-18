<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.SearchDAO" %>
<%@ page import="dto.SearchDTO" %>
<%@ page import="java.util.*" %>


    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="/SignIn/assets/img/favicon.ico">
        <title>BusanInJoy!</title>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="/SubPage/css/subbSearch.css" rel="stylesheet">
    </head>

    <body>
        <!-- DAO, DTO 객체 들어갈 쿼리 스트링 -->
        <% SearchDAO dao=new SearchDAO(); 
           String search = request.getParameter("search"); %>
        <%  if(search.equals("") || search.equals(" "))
            {%>
               <script>
               alert("검색결과가 없습니다. 다시 검색해주세요.");
               location.href="/SubPage/Market.jsp";
               </script><%
        }%>           
        <% List<SearchDTO> searchlist = null;
           searchlist = dao.searchContent(search);
           String u1 = "기장시장";
           String u2 = "민락회타운";
           String u3 = "해운대시장";
           String u4 = "남항시장 / 봉래시장";
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

                <section class="Ex_image">
                    <div class="img">
                        <span style="font-size:50px; color:black;">Search</span>
                    </div>
                </section>

                <div class="path-section">
                    <div class="icon-img"><img src="/ContentPage/MarketContent/home.png" style="width:25px; height:25px" />
                    </div>
                    <div class="icon-img"><img src="/ContentPage/MarketContent/arrow-right.png" style="width:30px; height:25px" />
                    </div>
                    <div class="path-text">
                        <h6 style="font-size : 15px;"><a style="text-decoration: none; color:black;" href="Market.jsp">Market</a></h6>
                    </div>
                    <div class="icon-img"><img src="/ContentPage/MarketContent/arrow-right.png" style="width:30px; height:25px" />
                    </div>
                    <div class="path-text">
                        <h6 style="font-size : 15px;">검색결과</h6>
                    </div>
                </div>

                <section class="sub_nav">
                    <div>
                    </div>
                    <div class="sub_nav_right">
                        <form class="nav_form" action="Market.jsp">
                            <button class="sub_nav_btn">뒤로가기</button>
                        </form>
                    </div>
                </section>

                <pre>
                    <section class="main_2">
            <div class="bg-white">
                <div style="display:flex; justify-content: center; margin-top: 50px;">
                    <% if(!(searchlist.isEmpty())) { %>
                    <div class="row">                 
                        <div  class="col-lg-3 col-md-6">         
                            <div style=" width: 400px; height: 130px; display : flex; align-items: center; margin-right: 5px;" class="card">
                                <img src= <% out.print(searchlist.get(0).getF_image()); %> class="card-img-top" alt="...">
                                <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 5rem; height: 10rem;" class="card-body">
                                    <p style="font-size : 20px; "class="card-title"><b><% out.print(searchlist.get(0).getF_name()); %></b></p>
                                    <p style="font-size : 14px;"> <% out.print(searchlist.get(0).getF_subName()); %> </p>
                                    <p>조회수 : <% out.print(searchlist.get(0).getF_count()); %> 리뷰수 : <% out.print(searchlist.get(0).getF_reviewcount()); %> </p>
                                    <% if((searchlist.get(0).getF_name()).equals(u1)) { %>
                                        <a href="/ContentPage/MarketContent/MarketContent1.jsp#tab1" class="btn btn-light">이동하기</a>
                                    <% } else if((searchlist.get(0).getF_name()).equals(u2)) { %>
                                        <a href="/ContentPage/MarketContent/MarketContent2.jsp#tab1" class="btn btn-light">이동하기</a>
                                    <% } else if((searchlist.get(0).getF_name()).equals(u3)) { %>
                                        <a href="/ContentPage/MarketContent/MarketContent3.jsp#tab1" class="btn btn-light">이동하기</a>
                                    <% } else if((searchlist.get(0).getF_name()).equals(u4)) { %>
                                        <a href="/ContentPage/MarketContent/MarketContent4.jsp#tab1" class="btn btn-light">이동하기</a>
                                    <% } else if((searchlist.get(0).getF_name()).equals("")) {
                                        out.print("출력 x");
                                    } 
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } else { %>
                    <% out.print("검색결과가 없습니다.");%>
                    <% } %>
                        </div>
                     </div>
                </div>
            </div>
                    </section>
                </pre>
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
                <section>
                    <footer class="footer text-center fixed-bottom text-white bg-dark">
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
                                    <a href="#!"><img src="door.jpg"
                                            width="50" height="50"></a>
                                    <a href="#!"><img src="deu.png"
                                            width="50" height="50"></a>
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
    </body>
    </body>

    </html>








