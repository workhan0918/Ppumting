<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/normalize.css">
    <link href="../User/mypage/homecss/carousel.css?after" rel="stylesheet">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/selectMsg.css">
    <link rel="icon" type="image/png" sizes="32x32" href="../ico/favicon-32x32.png">
 	<meta charset="utf-8">
<title>쪽지함 | PPUMTING</title>
</head>

 <body>
<header>
  <nav class="navbar navbar-expand-md fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="../User/mypage/home">PPUMTING</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="#">게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">P.P.T</a>
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
          <% String point = (String)request.getAttribute("checkPoint"); %>
          포인트 : <%=point%>p
          <button class="login_btn"><a href='<c:url value="/point/addPoint"/>'>충전</a></button>
          <button class="login_btn"><a href='<c:url value="/User/mypage/loginout/logout"/>'>로그아웃</a></button>
        </div>
      </div>
    </div>
  </nav>
</header>

    <div id="note_wrap">

      <h1>받은 쪽지함</h1>
      <div class="note_area rcv_note">
       <span class="users">보낸이</span>
       <span class="titles">제목</span>
       <span class="dates">보낸 날짜</span>
       <hr>
       <c:forEach var = "receiveTitle" items="${receiveTitles}">
		<a class="notes" onclick="window.open('notemsg?no=${receiveTitle.no}', '_blank', 'width=600 height=600')">
		<span class="user">${receiveTitle.sendUserId}</span>
		<span class="title">${receiveTitle.title} </span>
		<span class="date">${receiveTitle.regDate}</span>
		</a>
		<br>
		</c:forEach>
      </div>
      <h1>보낸 쪽지함</h1>
      <div class="note_area send_note">
       <span class="users">받은이</span>
       <span class="titles">제목</span>
       <span class="dates">보낸 날짜</span>
       <hr>
       <c:forEach var = "sendTitle" items="${sendTitles}">
		<a class="notes" onclick="window.open('notemsg?no=${sendTitle.no}', '_blank', 'width=600 height=600')">
		 <span class="user">${sendTitle.receiveUserId}</span> 
		 <span class="title">${sendTitle.title}</span> 
		 <span class="date">${sendTitle.regDate}</span>
		</a>
		<br>
		</c:forEach>
      </div>
      <button class="sendnote_btn" onclick="window.open('sendMsg.jsp', '_blank', 'width=600, height=600')" type="button">쪽지 쓰기</button>
    </div>
  </body>
</html>