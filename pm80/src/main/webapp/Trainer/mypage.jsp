<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link href="mypagecss/style.css" rel="stylesheet">
    <link href="../User/mypage/homecss/carousel.css" rel="stylesheet">
	<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    
<title>TRAINER | PPUMTING</title>
    <style>
    .login_btn a {
    	text-decoration: none;
    }
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
</head>

<body>
<header>
  <nav class="navbar navbar-expand-md fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="../../pm80/User/mypage/home.jsp">PPUMTING</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="../Qna/qnaInfo/find.do">게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/pm80/Trainer/mypage.jsp">P.P.T</a>
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

  <div class="trainer-wrapper">
        <div class="inner">
          <div class="trainer-container">
            <h1><span class="trainer-hover">Trainer List</span></h1>
          </div>
        </div>
      </div>

<main>
    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette" style="flex-wrap:nowrap;">
      <div class="col-md-7" style="width: 48%;">
        <h2 class="featurette-heading">김종국 <br> <span class="text-muted">"먹는 것까지 운동이다."</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <img src = "./img/trainer3-2.jpg" style="width:560px;height:450px;">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" style="flex-wrap:nowrap;">
      <div class="col-md-7-2 order-md-2" style="width: 48%;">
        <h2 class="featurette-heading">양치승 <br> <span class="text-muted">"아직도 운동 안 하고 먹기만 하냐?!"</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <img src = "./img/trainer2-1.jpg" style="width:560px;height:450px;">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" style="flex-wrap:nowrap;">
      <div class="col-md-7" style="width: 48%;">
        <h2 class="featurette-heading">마동석 <br> <span class="text-muted">"병아리 만지기 무서워.. 터질까봐.."</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <img src = "./img/trainer1.png" style="width:560px;height:450px;">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" style="flex-wrap:nowrap;">
      <div class="col-md-7-2 order-md-2" style="width: 48%;">
        <h2 class="featurette-heading">권상우 <br> <span class="text-muted">"니가 그렇게 운동을 잘해? 헬스장으로 따라와.."</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <img src = "./img/trainer5.jpg" style="width:560px;height:450px;">
      </div>
    </div>
	
	    <hr class="featurette-divider">
	    
	<div class="paymentBtn">
	<button class="payment_btn"><a href='<c:url value="/point/minusPoint.jsp"/>'>PT 및 트레이너 결제하기</a></button>
	</div>

    <!-- /END THE FEATURETTES -->
  <!-- FOOTER -->
  <footer class="container">
    <div class="top-wrap">
    <a href="#" class="top">Top</a>
    </div>
    <script>
    $( document ).ready( function() {
      $(".top").hide();
      $(window).scroll(function(){
        if(	$(this).scrollTop() > 200){	
          $(".top").fadeIn();	
        }
        else{	
          $(".top").fadeOut();	
        }			
      });
      $(".top").click(function(){
        $('body,html').animate({
          scrollTop:0 
        },300 );
        return false;
      });
    });</script>
    <p>&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>
</main>
</body>
</html>