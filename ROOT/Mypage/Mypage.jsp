<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="dao.UserDAO" %>
        <%@ page import="dao.MyDAO" %>
            <%@ page import="dto.UserDTO" %>
                <% request.setCharacterEncoding("utf-8"); %>
                    <!doctype html>
                    <html>

                    <head>
                        <meta charset="utf-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <title>BusanInJoy!</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                            crossorigin="anonymous">
                        <link href="/SignUp/css/SignUp1.css" rel="stylesheet" />

                        <style>
                            .box {
                                width: 200px;
                                height: 200px;
                                border-radius: 70%;
                                overflow: hidden;
                            }

                            .profile {
                                width: 100%;
                                height: 100%;
                                object-fit: cover;
                            }
                        </style>
                    </head>

                    <body>
                        <section>
                            <nav class="navbar navbar-expand-xxl navbar-dark fixed-top bg-dark">
                                <div class="container-fluid">
                                    <a class="navbar-brand" href="/main/main.jsp">
                                        <h1><b>BusanInJoy!</b></h1>
                                    </a>
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>
                                    <div class="collapse navbar-collapse" id="navbarCollapse">
                                        <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
                                            <a class="me-3 py-2 text-white text-decoration-none">
                                                <%= session.getAttribute("sessionId") %> 님, 환영합니다.
                                            </a>
                                            <a class="me-3 py-2 text-white text-decoration-none"
                                                href="/UserAction/LogoutAction.jsp">로그아웃</a>
                                            <a class="me-3 py-2 text-white text-decoration-none"
                                                href="/Mypage/Mypage.jsp">마이페이지</a>
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
                                            <h2 class="text-uppercase mb-4"><b>마이페이지</b></h2>
                                            <hr>
                                            <p class="lead mb-0">
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>


                        <section class="bg-white text-black text-center">
                            <table border-collapse="2" style="margin-left: auto; margin-right: auto;">
                                <thead>
                                    <% Object ids=session.getAttribute("sessionId"); String ID=(String)ids; MyDAO
                                        dao=new MyDAO(); dao.getInfo(ID); String name=dao.name; String email=dao.email;
                                        String age=dao.age; %>
                                        <tr>
                                            <th height="300" width="300" colspan="2" rowspan="2">
                                                <div class="box"
                                                    style="background: White; margin-left: auto; margin-right: auto; ">
                                                    <img src="User.png">
                                                </div>
                                            </th>

                                            <th height="150" width="100">
                                                <h3><b>이름</b></h3>
                                            </th>
                                            <th height="150" width="100">
                                                <h4>
                                                    <%out.print(name);%>
                                                </h4>
                                                <!--db, 이름 불러오기-->
                                            </th>
                                            <th height="150" width="100">
                                                <h3><b>나이</b></h3>
                                            </th>
                                            <th height="150" width="100">
                                                <h4>
                                                    <%out.print(age);%>
                                                </h4>
                                                <!--db, 나이 불러오기-->
                                            </th>
                                        </tr>
                                        <tr>
                                            <th height="150" width="100">
                                                <h3><b>이메일</b></h3>
                                            </th>
                                            <th height="150" width="400" colspan="3">
                                                <h4>
                                                    <%out.print(email);%>
                                                </h4>
                                                <!--db, 이메일 불러오기-->
                                            </th>
                                        </tr>
                                </thead>
                            </table>
                        </section>
                        <br>
                        <section>
                            <div class="text-center text-dark">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-4 mb-5 mb-lg-0">
                                            <h2 class="text-uppercase mb-4"><b>회원정보 수정</b></h2>
                                            <hr>
                                            <p class="lead mb-0">
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <br>
                        <section>
                            <table align=center>
                                <thead>
                                    <tr>
                                        <td width="140" colspan="2">
                                            <form method="post">
                                                <input style="width: 200px; height: 100px;" class="submit" type="submit" value="이름 변경"
                                                    formaction="/Update/UpdateName.jsp">
                                            </form>
                                        </td>
                                        <td width="100"></td>
                                        <td width="140" colspan="2">
                                            <form method="post">
                                                <input style="width: 200px; height: 100px;" class="submit" type="submit" value="나이 변경"
                                                    formaction="/Update/UpdateAge.jsp">
                                            </form>
                                        </td>
                                        <td width="100"></td>
                                        <td width="140" colspan="2">
                                            <form method="post">
                                                <input style="width: 200px; height: 100px;" class="submit" type="submit" value="이메일 변경"
                                                    formaction="/Update/UpdateEmail.jsp">
                                            </form>
                                        </td>
                                        <td width="100"></td>
                                        <td width="140" colspan="2">
                                            <form method="post">
                                                <input style="width: 200px; height: 100px;" class="submit" type="submit" value="회원 탈퇴"
                                                    formaction="/UserAction/deleteAction.jsp">
                                            </form>
                                        </td>
                                    </tr>
                                </thead>
                            </table>
                        </section>
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

                        <section>
                            <footer class="footer text-center fixed-bottom text-white bg-dark">
                                <div class="container">
                                    <div class="row">

                                        <div class="col-lg-4 mb-5 mb-lg-0">
                                            <h3 class="text-uppercase mb-4"><b>위치</b></h3>
                                            <p class="lead mb-0">
                                                부산광역시 부산진구 엄광로 176
                                                <br />
                                                동의대학교, 정보관
                                            </p>
                                        </div>

                                        <div class="col-lg-4 mb-5 mb-lg-0">
                                            <h3 class="text-uppercase mb-4"><b>바로가기</b></h3>
                                            <a href="#!"><img src="door.jpg" width="50" height="50"></a>
                                            <a href="#!"><img src="deu.png" width="50" height="50"></a>
                                        </div>

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
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                            crossorigin="anonymous">
                            </script>
                    </body>

                    </html>