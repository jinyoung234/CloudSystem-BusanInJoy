<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="dao.UserDAO" %>
        <%@ page import="dto.UserDTO" %>
            <% request.setCharacterEncoding("utf-8"); %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>회원가입</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                        crossorigin="anonymous">
                    <link href="/SignUp/css/SignUp1.css" rel="stylesheet" />


                </head>

                <body>
                    <header>
                        <nav class="navbar navbar-expand-xxl navbar-dark fixed-top bg-dark">
                            <div class="container-fluid">
                                <a class="navbar-brand" href="../Welcome.html">
                                    <h1><b>BusanInJoy!</b></h1>
                                </a>
                            </div>
                        </nav>
                    </header>
                    <section>

                    </section>

                    <section class="section_form page-section portfolio bg-white text-white text-center" id="portfolio">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        
                        <section>
                            <div class="text-center text-dark">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-4 mb-5 mb-lg-0">
                                            <h2 class="text-uppercase mb-4"><b>회원가입</b></h2>
                                            <hr>
                                            <p class="lead mb-0">
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <br>

                        <form action="/UserAction/SignUpActon.jsp" method="post">
                            <div class="form">
                                <div class="form-left">
                                    <h3 class="h3">아이디</h3>
                                    <p class="p">(아이디는 6자리이상, 8자리이하 입력해주세요)</p>
                                </div>
                                <div class="form-right">
                                    <input type="text" name="id" minlength="6" maxlength="8" placeholder="" required>
                                </div>
                            </div>
                            <div class="form">
                                <div class="form-left">
                                    <h3 class="h3">비밀번호</h3>
                                    <p class="p">(비밀번호는 10자리이상 16자리이하로 입력해주세요)</p>
                                </div>
                                <div class="form-right">
                                    <input type="password" name="pw" minlength="10" maxlength="16" placeholder="" required>
                                </div>
                            </div>
                            <div class="form">
                                <div class="form-left">
                                    <h3 class="h3">이름</h3>
                                    <p class="p">(영문명 3자리이상 16자리이하로 입력해주세요)</p>
                                </div>
                                <div class="form-right">
                                    <input type="text" name="name" minlength="3" maxlength="16" placeholder="" required>
                                </div>
                            </div>
                            <div class="form">
                                <div class="form-left">
                                    <h3 class="h3">나이</h3>
                                </div>
                                <div class="form-right">
                                    <input type="number" name="age" min="0" max="100" placeholder="" required>
                                </div>
                            </div>
                            <div class="form">
                                <div class="form-left">
                                    <h3 class="h3">E-mail</h3>
                                </div>
                                <div class="form-right">
                                    <input type="email" name="email" placeholder="" required>
                                </div>
                            </div>
                            <div>
                                <input class="submit" type="submit" value="회원가입하기">
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

                        </form>

                    </section>
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
                                        <a  href="#!"><img src="deu.png"
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

                </html>