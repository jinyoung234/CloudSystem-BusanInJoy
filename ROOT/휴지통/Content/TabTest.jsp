<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>tab test</title>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
    <meta name="description" content="">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/">

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />


    <!-- -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.js" crossorigin="anonymous"></script>



    <style>
        .tab_type1 {
            width: 100%;
            height: 50%;
            display: flex;
            justify-content: center;
        }

        .tab_content {
            width: 100%;
        }

        
    </style>



</head>

<body id="page-top">

    <-- DAO, DTO 객체 들어갈 쿼리 스트링 -->
    <% boolean i = true; %>

    <section>
        <nav class="navbar navbar-expand-xxl navbar-dark fixed-top bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <h1>BusanInJoy!</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">

                    <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
                        <-- 로그인 성공 -->
                        <% if(i){ %>
                        <a class="me-3 py-2 text-white text-decoration-none" href="/SignIn/SignIn.html">로그아웃</a>
                        <a class="me-3 py-2 text-white text-decoration-none" href="/Mypage/Mypage.html">마이페이지</a>
                        <-- 로그인 실패 or 로그인 하지 않은 상태 -->
                        <% } else { %>
                        <a class="me-3 py-2 text-white text-decoration-none" href="/SignIn/SignIn.html">로그인</a>
                        <a class="me-3 py-2 text-white text-decoration-none" href="/SignIn/SignIn.html">마이페이지</a>
                        <% } %>
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
                        <h2 class="text-uppercase mb-4"><b>게시물 제목</b></h2>
                        <hr>
                        <p class="lead mb-0">
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <div class = "path-section">
        <div class="icon-img"><img src="home.png"style="width:25px; height:25px"/></div>
        <div class="icon-img"><img src="arrow-right.png"style="width:30px; height:25px"/></div>
        <div class="path-text"><h6>경로111</h6></div>
        <div class="icon-img"><img src="arrow-right.png"style="width:30px; height:25px"/></div>
        <div class="path-text"><h6>경로222</h6></div>
        </div>

    <ul class="contentlist">
        <li><div class="first-list">
                <div class="score">
                    <div><h5>평점</h5></div>
                    <div><img src="star.png"style="width:17px; height:17px"/></div>
                    <div><h5>평점수</h5></div>
                </div>
                <div class="count">
                    <div><h5>조회</h5></div>
                    <div><img src="view-details.png"style="width:17px; height:17px"/></div>
                    <div><h5>조회수</h5></div>
                </div>
                <div class="re">
                    <div><h5>리뷰</h5></div>
                    <div><img src="comment.png"style="width:17px; height:17px"/></div>
                    <div><h5>리뷰수</h5></div>
                </div>
            </div>
        </li>
        <li><div class="middle-list">
            <div><img src="shopping-bag.png"style="width:17px; height:17px"/></div>
            <div><h6>찜하기</h6></div>
        </div></li>
        <li><div class="last-list">
            <div><img src="heart.png"style="width:17px; height:17px"/></div>
            <div><h6>좋아요</h6></div>
        </div></li>
    </ul>
    
    
    <script>
        $.ajax({
            method: "GET",
            url: "https://apis.data.go.kr/6260000/ShoppingService/getShoppingKr?serviceKey=wUEtd8BhDy7yesRSMeUkuPQAU63BIllURM2vJUlvKO3YihCA%2B6JGfQHNlxDaYd8rTifOGVq4Ve6IpmJ8mGoYeA%3D%3D&pageNo=1&%20numOfRows=10",
        })
            .done(function (msg) {
                // alert("Data Saved: " + msg);
                console.log(msg);
            });
    </script>

    
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
                <h2>제목1</h2>
                <p>
                    내용설명1
                </p>
            </div>
            <div id="tab2" class="tab">
                <h2>제목2</h2>
                <p>
                    내용설명2
                    <div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=26747c65726da5e5602d24ad6195c707"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
    sdasdasd

                    
                </p>
            </div>
            <div id="tab3" class="tab">
                <h2>제목3</h2>
                <p>
                    내용설명3
                </p>
            </div>
            <div id="tab4" class="tab">
                <h2>제목4</h2>
                <p>
                    내용설명4
                </p>
            </div>
        </div>
        </div>

    </pre>
</section>

<pre>




</pre>

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
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><img src="door.jpg" width="50"
                            height="50"></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><img src="deu.png" width="50"
                            height="50"></a>
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




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>


</body>

</html>