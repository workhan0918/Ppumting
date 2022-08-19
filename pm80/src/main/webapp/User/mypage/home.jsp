<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="icon" type="image/png" sizes="32x32" href="../../ico/favicon-32x32.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>HOME | PUMTTING</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">



    <!-- Bootstrap core CSS -->
<link href="../../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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
    </style>


    <!-- Custom styles for this template -->
    <link href="homecss/carousel.css" rel="stylesheet">
  </head>
  <body>

<header>
  <nav class="navbar navbar-expand-md fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" onClick="top.location='javascript:location.reload()'">PPUMTING</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href='<c:url value="/Qna/qnaInfo/find.do"/>'>게시판</a> 
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../../Trainer/mypage.jsp">P.P.T</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Info</a>
          </li>
        </ul>
        <div class="login_info">
          쪽지함 :
          <a type="hidden" href='<c:url value="/Note/selectTitleMsg"/>'>${countNote}</a>
          ${userId}님
          <button class="login_btn"><a href='<c:url value="/User/mypage/userUpdate/userSelect"/>'>수정</a></button>
          포인트 : ${checkPoint}p
          <button class="login_btn"><a href='<c:url value="/point/addPoint"/>'>충전</a></button>
          <button class="login_btn"><a href='<c:url value="/User/mypage/loginout/logout"/>'>로그아웃</a></button>
        </div>
      </div>
    </div>
  </nav>
</header>

<main>

  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Premium Personal Trainer</h1>
            <p>오직 회원님만을 위한 프리미엄 개인 운동 교습 P.P.T!<br>
            전문가 트레이너님들이 회원님을 기다리고 계십니다!
            </p>
            <p><a class="btn btn-lg btn-primary" href="../../Trainer/mypage.jsp">P.P.T 알아보기</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="container">
          <div class="carousel-caption">
            <h1>운동은 가고 싶은데 혼자가긴 의지가 안생겨요 ...😢</h1>
            <p>그런 분들을 위해 저희 PPUMTING에서 게시판을 OPEN 했습니다!<br>
            지금 바로 함께 운동할 친구를 찾아보세요!
            </p>
            <p><a class="btn btn-lg btn-primary" href="<c:url value="/Qna/qnaInfo/find.do"/>">게시판 글쓰러가기</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="container">
          <div class="carousel-caption text-end">
            <h1>PPUMTING 회원님들의 생생한 후기들 &#128077;</h1>
            <p>크리스토퍼 선생님의 집중교육으로 핫바디가 되었어요!</p>
            <p><a class="btn btn-lg btn-primary" href="#">P.P.T 후기 보러가기</a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <img class="radius_img" src="../../img/radius_img01.jpg" alt="">
        <h2>김종국</h2>
        <p>"포기란 없다"</p>
        <p><a class="btn btn-secondary" href="../../Trainer/mypage.jsp">선생님 자세히 알아보기</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="radius_img" src="../../img/radius_img02.jpg" alt="">
        <h2>마동석</h2>
        <p>"좋은 몸은 하루아침에 만들어지지 않는다."</p>
        <p><a class="btn btn-secondary" href="../../Trainer/mypage.jsp">선생님 자세히 알아보기</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
      <img class="radius_img" src="../../img/radius_img03.jpg" alt="">
        <h2>양치승</h2>
        <p>'한계'라고 느낄 때 '한 개'를 더 해야 성장한다.</p>
        <p><a class="btn btn-secondary" href="../../Trainer/mypage.jsp">선생님 자세히 알아보기</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
   </div>
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#">Back to top</a></p>
    <p>&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>
</main>
    <script src="../../assets/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
