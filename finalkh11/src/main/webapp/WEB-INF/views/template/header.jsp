<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>

   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   <!-- Header CSS -->
<!--    <link rel="stylesheet" type="text/css" href="/static/css/header.css"> -->  
   
   <!-- Footer CSS -->
   <link rel="stylesheet" type="text/css" href="/static/css/footer.css">
   
   <!-- Font Awesome CDN -->
   <link rel="stylesheet" type = "text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
   
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
   
   <!-- Bootstrap CDN -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   
   <!-- bootswatch CDN -->
   <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/sandstone/bootstrap.min.css" rel="stylesheet">

   <!-- JQuery CDN -->
   <script src = "https://code.jquery.com/jquery-3.6.4.js"></script>
   
   <!-- Axios CDN -->
   <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   
   <!-- VueJS CDN -->
   <script src="https://unpkg.com/vue@3.2.36"></script>
   
   <!-- Lodash CDN -->
   <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
   
   <script>
      const contextPath = "${pageContext.request.contextPath}";
      const memberId = "${sessionScope.memberId}";
      const memberLevel = "${sessionScope.memberLevel}";
   </script>

<style>
	@font-face {
	    font-family: 'TheJamsil5Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
	    font-weight:  200;
	    font-style: normal;
	}

	*{
	   font-family: 'TheJamsil5Bold';
	}

	body {
	      font-family: 'TheJamsil5Bold';
	}
	
   .main-content {
      padding-top: 100px;
   }
</style>

</head>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg fixed-top" style="background-color: #A4C5B1" data-bs-theme="dark">
	<div class="container-fluid col-md-7 ms-auto">
		<button class="navbar-toggler" type="button" 
			data-bs-toggle="collapse" data-bs-target="#navbarColor02" 
			aria-controls="navbarColor02" 
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
         </button>
         <!-- Navbar brand -->
         <a class="navbar-brand me-2" href="/">
			<img
               src="/static/image/matchUp.png"
               height="60"
               alt="MatchUp Logo"
               loading="lazy"
               style="margin-top: -1px;"
            />
         </a>
         <!-- 헤더 메뉴 -->
         <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-center">
				<li class="nav-item active">
				  <a class="nav-link" href="/matchBoard/list">
				    <span class="text-lg">팀 매치</span>
				  </a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="/ground/list">
				    <span class="text-lg">구장 목록</span>
				  </a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="/team/list">
				    <span class="text-lg">팀 게시판</span>
				  </a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="/free/list">
				    <span class="text-lg">용병 게시판</span>
				  </a>
				</li>
            </ul>
         </div>
         <!-- 검색창 -->
         <form action="${pageContext.request.contextPath}/search" method="get" class="d-flex me-4">
			<input class="form-control me-sm-2" type="search" placeholder="검색" name="keyword" autocomplete="off">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
         </form>
		<c:if test="${sessionScope.memberId == null }">
			<div class="d-flex align-items-center">
                <a
                  class="btn btn-dark px-3 me-2 btn-rounded"
                  href="${pageContext.request.contextPath}/member/login"
                  role="button"
                  >
                  <i class="fas fa-user me-2"></i>
                  Log in
               </a>
               <a
                  class="btn btn-dark px-3 btn-rounded"
                  href="${pageContext.request.contextPath}/member/join"
                  role="button"
                  >
                  Sign Up
               </a>
            </div>
		</c:if>
      <!-- 회원 메뉴 -->
      <c:if test="${sessionScope.memberId != null}">
         <!-- 드롭 다운 -->
         <ul class="navbar-nav">
            <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" 
                  data-bs-toggle="dropdown" 
                  href="#" 
                  role="button" 
                  aria-haspopup="true" 
                  aria-expanded="false">
                  ${memberId} (${memberLevel})
               </a>
               <div class="dropdown-menu">
                  <a class="dropdown-item" href="/member/mypage">마이페이지</a>
                  <a class="dropdown-item" href="#">팀</a>
                  <a class="dropdown-item" href="/member/logout">로그아웃</a>
                  <div class="dropdown-divider"></div>
                  
                  <c:if test="${memberLevel == '관리자'}">
                     <!-- 관리자 메뉴 -->
                     <a class="dropdown-item" href="/admin/member/home/">관리자 메뉴</a>
                  </c:if>
                  
                  <c:if test="${memberLevel == '매니저'}">
                     <!-- 매니저 메뉴 -->
                     <a class="dropdown-item" href="/manager/list/">매니저 메뉴</a>
                  </c:if>
               </div>
            </li>
         </ul>
      </c:if>
      </div>
   </nav>