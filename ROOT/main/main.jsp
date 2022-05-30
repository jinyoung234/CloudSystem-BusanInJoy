<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BusanInJoy!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/SubPage/css/sub.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        #name {
            opacity: 0.6;
            filter: alpha(opacity=60);
            -moz-opacity: 0.6;
            -khtml-opacity: 0.6;
        }
    </style>
</head>

<body>
    <section>
        <nav class="navbar navbar-expand-xxl navbar-dark fixed-top bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="main.jsp">
                    <h1>BusanInJoy!</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
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


    <section class="py-5 text-center container bg-white">
        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="5000">
                    <a href="/ContentPage/WalkContent/WalkContent1.jsp"><img src="First1.jpg" class="d-block w-100" alt="..."></a>
                    <div class="carousel-caption d-none d-md-block">
                        <div class="text-white" width="500px" height="500px"
                            style="background:000000; background : rgba(0, 0, 0, 0.4);">
                            <h5> 달맞이길/문탠로드 </h5>
                            <p> 일출과 월출 모두를 품은 달맞이길 & 문탠로드 </p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="5000">
                    <a href="/ContentPage/FestivalContent/FestivalContent4.jsp"><img src="Second2.jpg" class="d-block w-100" alt="..."></a>
                    <div class="carousel-caption d-none d-md-block">
                        <div class="text-white" width="500px" height="500px"
                            style="background:000000; background : rgba(0, 0, 0, 0.4);">
                            <h5> 아름다운 부산 밤하늘의 하모니, 부산불꽃축제 </h5>
                            <p> 모두를 감싸주는 가을밤 불꽃과 함께 </p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="5000">
                    <a href="/ContentPage/MarketContent/MarketContent2.jsp"><img src="Third3.jpg" class="d-block w-100" alt="..."></a>
                    <div class="carousel-caption d-none d-md-block">
                        <div class="text-white" width="500px" height="500px"
                            style="background:000000; background : rgba(0, 0, 0, 0.4);">
                            <h5> 민락회타운 </h5>
                            <p> 광안리 바다의 참맛 민락회타운 </p>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    <pre>



    </pre>

    <section>
        <div class="text-center text-dark">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h2 style="color:black;" class="text-uppercase mb-4"><b>Category</b></h2>
                        <hr>
                        <p class="lead mb-0">
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="main_2">
        <div class="album py-5 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="card" style="width: 18rem;">
                            <img src="Market.jpg" class="card-img-top" alt="...">
                            <div class="card-body text-center">
                                <h5 class="card-title"><b>Market</b></h5>
                                <a href="/SubPage/Market.jsp" class="btn btn-light">이동하기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card" style="width: 18rem;">
                            <img src="Festival.jpg" class="card-img-top" alt="...">
                            <div class="card-body text-center">
                                <h5 class="card-title"><b>Festival</b></h5>
                                <a href="/SubPage/Festival.jsp" class="btn btn-light">이동하기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card" style="width: 18rem;">
                            <img src="Food.jpg" class="card-img-top" alt="...">
                            <div class="card-body text-center">
                                <h5 class="card-title"><b>Food</b></h5>
                                <a href="/SubPage/Food.jsp" class="btn btn-light">이동하기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card" style="width: 18rem;">
                            <img src="Walk.jpg" class="card-img-top" alt="...">
                            <div class="card-body text-center">
                                <h5 class="card-title"><b>Walk</b></h5>
                                <a href="/SubPage/Walk.jsp" class="btn btn-light">이동하기</a>
                            </div>
                        </div>
                    </div>
                </div>
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
                        <h2 style="color:black;" class="text-uppercase mb-4"><b>Youtube in Busan</b></h2>
                        <hr>
                        <p class="lead mb-1">
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 text-center container bg-white">
        <div style="overflow:auto; width: 1300px; height:800px; background-color:white;">
            <div class="youtube">
                <div class="row">
                    <div class="col">
                        <iframe id="busanTravelIframe1" width="1300" height="800"
                            src="https://www.youtube.com/embed/q2NEYjYHSNE?rel=0&enablejsapi=1" frameborder="0"
                            allowfullscreen></iframe>
                        <script type="text/javascript">
                            /**
                             * Youtube API 로드
                             */
                            var tag = document.createElement('script');
                            tag.src = "https://www.youtube.com/iframe_api";
                            var firstScriptTag = document.getElementsByTagName('script')[0];
                            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                            /**
                             * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                             * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                             * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                             */
                            var player;
                            function onYouTubeIframeAPIReady() {
                                player = new YT.Player('busanTravelIframe1', {
                                    events: {                                   // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                        'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                                    }
                                });
                            }
                            var playerState;
                            function onPlayerStateChange(event) {
                                playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                        event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                            event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                                event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                                    event.data == -1 ? '시작되지 않음' : '예외';

                                console.log('onPlayerStateChange 실행: ' + playerState);
                            }
                        </script>
                    </div> <br>
                    <div class="col">
                        <iframe id="busanTravelIframe2" width="1300" height="800"
                            src="https://www.youtube.com/embed/nCQonEs_Z5Y?rel=0&enablejsapi=1" frameborder="0"
                            allowfullscreen></iframe>
                        <script type="text/javascript">
                            /**
                             * Youtube API 로드
                             */
                            var tag = document.createElement('script');
                            tag.src = "https://www.youtube.com/iframe_api";
                            var firstScriptTag = document.getElementsByTagName('script')[0];
                            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                            /**
                             * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                             * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                             * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                             */
                            var player;
                            function onYouTubeIframeAPIReady() {
                                player = new YT.Player('busanTravelIframe2', {
                                    events: {                                   // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                        'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                                    }
                                });
                            }
                            var playerState;
                            function onPlayerStateChange(event) {
                                playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                        event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                            event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                                event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                                    event.data == -1 ? '시작되지 않음' : '예외';

                                console.log('onPlayerStateChange 실행: ' + playerState);
                            }
                        </script>
                    </div><br>
                    <div class="col">
                        <iframe id="busanTravelIframe3" width="1300" height="800"
                            src="https://www.youtube.com/embed/YrvPOU7x-i8?rel=0&enablejsapi=1" frameborder="0"
                            allowfullscreen></iframe>
                        <script type="text/javascript">
                            /**
                             * Youtube API 로드
                             */
                            var tag = document.createElement('script');
                            tag.src = "https://www.youtube.com/iframe_api";
                            var firstScriptTag = document.getElementsByTagName('script')[0];
                            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                            /**
                             * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                             * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                             * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                             */
                            var player;
                            function onYouTubeIframeAPIReady() {
                                player = new YT.Player('busanTravelIframe3', {
                                    events: {                                   // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                        'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                                    }
                                });
                            }
                            var playerState;
                            function onPlayerStateChange(event) {
                                playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                        event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                            event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                                event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                                    event.data == -1 ? '시작되지 않음' : '예외';

                                console.log('onPlayerStateChange 실행: ' + playerState);
                            }
                        </script>
                    </div>
                    <div class="col">
                        <iframe id="busanTravelIframe4" width="1300" height="800"
                            src="https://www.youtube.com/embed/k_-eFlVD6bQ?rel=0&enablejsapi=1" frameborder="0"
                            allowfullscreen></iframe>
                        <script type="text/javascript">
                            /**
                             * Youtube API 로드
                             */
                            var tag = document.createElement('script');
                            tag.src = "https://www.youtube.com/iframe_api";
                            var firstScriptTag = document.getElementsByTagName('script')[0];
                            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                            /**
                             * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                             * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                             * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                             */
                            var player;
                            function onYouTubeIframeAPIReady() {
                                player = new YT.Player('busanTravelIframe4', {
                                    events: {                                   // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                        'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                                    }
                                });
                            }
                            var playerState;
                            function onPlayerStateChange(event) {
                                playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                        event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                            event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                                event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                                    event.data == -1 ? '시작되지 않음' : '예외';

                                console.log('onPlayerStateChange 실행: ' + playerState);
                            }
                        </script>
                    </div><br>
                    <div class="col">
                        <iframe id="busanTravelIframe5" width="1300" height="800"
                            src="https://www.youtube.com/embed/QovUu4Hx2aQ?rel=0&enablejsapi=1" frameborder="0"
                            allowfullscreen></iframe>
                        <script type="text/javascript">
                            /**
                             * Youtube API 로드
                             */
                            var tag = document.createElement('script');
                            tag.src = "https://www.youtube.com/iframe_api";
                            var firstScriptTag = document.getElementsByTagName('script')[0];
                            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                            /**
                             * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                             * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                             * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                             */
                            var player;
                            function onYouTubeIframeAPIReady() {
                                player = new YT.Player('busanTravelIframe5', {
                                    events: {                                   // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                        'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                                    }
                                });
                            }
                            var playerState;
                            function onPlayerStateChange(event) {
                                playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                        event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                            event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                                event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                                    event.data == -1 ? '시작되지 않음' : '예외';

                                console.log('onPlayerStateChange 실행: ' + playerState);
                            }
                        </script>
                    </div>
                    <div class="col">
                        <iframe id="busanTravelIframe6" width="1300" height="800"
                            src="https://www.youtube.com/embed/BROe_n9JyM0?rel=0&enablejsapi=1" frameborder="0"
                            allowfullscreen></iframe>

                        <script type="text/javascript">
                            /**
                             * Youtube API 로드
                             */
                            var tag = document.createElement('script');
                            tag.src = "https://www.youtube.com/iframe_api";
                            var firstScriptTag = document.getElementsByTagName('script')[0];
                            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                            /**
                             * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                             * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                             * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                             */
                            var player;
                            function onYouTubeIframeAPIReady() {
                                player = new YT.Player('busanTravelIframe6', {
                                    events: {                                   // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                        'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                                    }
                                });
                            }
                            
                            var playerState;
                            function onPlayerStateChange(event) {
                                playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                        event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                            event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                                event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                                    event.data == -1 ? '시작되지 않음' : '예외';

                                console.log('onPlayerStateChange 실행: ' + playerState);
                            }
                        </script>

                    </div>
                </div>
            </div>
    </section>

    <pre>
        <br>
        <br>
        <br>
        <br>
        <br>
    </pre>
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



