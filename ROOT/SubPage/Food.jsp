<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.FeedDAO" %>
<%@ page import="dto.FeedDTO" %>
<%@ page import="java.util.*" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="/SignIn/assets/img/favicon.ico">
        <title>Busan injoy</title>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://kit.fontawesome.com/bdc5894e42.js" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="/SubPage/css/sub.css" rel="stylesheet">

        
    </head>

    <body>
        <!-- DAO, DTO 객체 들어갈 쿼리 스트링 -->
        <% FeedDAO dao=new FeedDAO(); List<FeedDTO> list = dao.selectAll(); %>

            <section>
                <nav class="navbar navbar-expand-xxl navbar-dark fixed-top bg-dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="/main/main.jsp">
                            <h1>BusanInJoy!</h1>
                        </a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
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
                        <span style="font-size:50px; color:black;">Food</span>
                    </div>
                </section>

                <div class="path-section">
                    <div class="icon-img"><img src="/ContentPage/MarketContent/home.png" style="width:25px; height:25px" />
                    </div>
                    <div class="icon-img"><img src="/ContentPage/MarketContent/arrow-right.png" style="width:30px; height:25px" />
                    </div>
                    <div class="path-text">
                        <h6 style="font-size : 15px;"><a style="text-decoration: none; color:black;" href="Food.jsp">Food</a></h6>
                    </div>
                    <div class="icon-img"><img src="/ContentPage/MarketContent/arrow-right.png" style="width:30px; height:25px" />
                    </div>
                </div>

                <section class="sub_nav">
                    <div>
                    </div>
                    <div class="nav_search sub_nav_right">
                        <table>
                            <thead>
                                <form class="nav_form" action="FoodSearch.jsp" method="get">
                                    <tr>
                                        <td colspan="3"><input class="nav_input" type="text" name="search"></td>
                                        <td colspan="2"><button class="sub_nav_btn" type="submit"
                                                name="search">검색</button></td>
                                    </tr>
                                </form>
                                
                            </thead>
                        </table>
                    </div>
                </section>

                <pre>
                    <section class="main_2">
            <div class="bg-white">
                <div style="display:flex; justify-content: center; margin-top: 50px;">
                    <div class="row">
                                                
                        <div  class="col-lg-3 col-md-6">         
                               
                            <div style=" width: 400px; height: 130px; display : flex; align-items: center; margin-right: 5px;" class="card">
                                <img src= <% out.print(list.get(4).getF_image()); %> class="card-img-top" alt="...">
                                <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 5rem; height: 10rem;" class="card-body">
                                    <p style="font-size : 20px; "class="card-title"><b><% out.print(list.get(4).getF_name()); %></b></p>
                                    <p style="font-size : 14px;"> <% out.print(list.get(4).getF_subName()); %> </p>
                                    <p>조회수 : <% out.print(list.get(4).getF_count()); %> 리뷰수 : <% out.print(list.get(4).getF_reviewcount()); %> </p>
                                    <a href="/ContentPage/FoodContent/FoodContent1.jsp" class="btn btn-light">이동하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">         
                               
                            <div style=" width: 400px; height: 130px; display : flex; align-items: center; margin-right: 5px;" class="card" style="width: 300px; height: 100px;">
                                <img src= <% out.print(list.get(5).getF_image()); %> class="card-img-top" alt="...">
                                <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 5rem; height: 10rem;" class="card-body">
                                    <p style="font-size : 20px;" class="card-title"><b><% out.print(list.get(5).getF_name()); %></b></p>
                                    <p style="font-size : 14px;"> <% out.print(list.get(5).getF_subName()); %> </p>
                                    <p>조회수 : <% out.print(list.get(5).getF_count()); %> 리뷰수 : <% out.print(list.get(5).getF_reviewcount()); %> </p>
                                    <a href="/ContentPage/FoodContent/FoodContent2.jsp" class="btn btn-light">이동하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">         
                               
                            <div style=" width: 400px; height: 130px; display : flex; align-items: center; margin-right: 5px;" class="card">
                                <img src= <% out.print(list.get(6).getF_image()); %> class="card-img-top" alt="...">
                                <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 5rem; height: 10rem;" class="card-body">
                                    <p style="font-size : 20px;" class="card-title"><b><% out.print(list.get(6).getF_name()); %></b></p>
                                    <p style="font-size : 14px;"> <% out.print(list.get(6).getF_subName()); %> </p>
                                    <p>조회수 : <% out.print(list.get(6).getF_count()); %> 리뷰수 : <% out.print(list.get(6).getF_reviewcount()); %> </p>
                                    <a href="/ContentPage/FoodContent/FoodContent3.jsp" class="btn btn-light">이동하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">         
                               
                            <div style=" width: 400px; height: 130px; display : flex; align-items: center; margin-right: 5px;" class="card">
                                <img src= <% out.print(list.get(7).getF_image()); %> class="card-img-top" alt="...">
                                <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 5rem; height: 10rem;" class="card-body">
                                    <p style="font-size : 20px;" class="card-title"><b><% out.print(list.get(7).getF_name()); %></b></p>
                                    <p style="font-size : 14px;"> <% out.print(list.get(7).getF_subName()); %> </p>
                                    <p>조회수 : <% out.print(list.get(7).getF_count()); %> 리뷰수 : <% out.print(list.get(7).getF_reviewcount()); %> </p>
                                    <a href="/ContentPage/FoodContent/FoodContent4.jsp" class="btn btn-light">이동하기</a>
                                </div>
                            </div>
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
                                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><img src="door.jpg"
                                            width="50" height="50"></a>
                                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><img src="deu.png"
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
                <script src="js/main.js"></script>

                <!-- 슬라이드 수정본 -->
                <script src="assets/js/jquery-1.11.0.min.js"></script>
                <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
                <script src="assets/js/bootstrap.bundle.min.js"></script>
                <script src="assets/js/templatemo.js"></script>
                <script src="assets/js/custom.js"></script>
                <!-- 슬라이드 수정본 -->
    </body>
    </body>

    </html>




