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
	<link rel="stylesheet" type="text/css" href="/static/css/header.css">
	
	<!-- Footer CSS -->
	<link rel="stylesheet" type="text/css" href="/static/css/footer.css">
	<!-- Chat CSS -->
	<link rel="stylesheet" type="text/css" href="/static/css/chat.css">
	
	<!-- Font Awesome CDN -->
	<link rel="stylesheet" type = "text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<!-- Bootstrap CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<!-- bootswatch CDN -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet">
	
	<!-- JQuery CDN -->
	<script src = "https://code.jquery.com/jquery-3.6.4.js"></script>
	
	<!-- Axios CDN -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	<!-- VueJS CDN -->
	<script src="https://unpkg.com/vue@3.2.36"></script>
	
	<!-- Lodash CDN -->
	<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
	
	<!-- SockJS CDN -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	
	<!-- Moment CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	
	<script>
		const contextPath = "${pageContext.request.contextPath}";
		const memberId = "${sessionScope.memberId}";
		const memberLevel = "${sessionScope.memberLevel}";
	</script>
	
	<script type="text/javascript">
	    $(function () {
	
	        // sidebar 보이기/숨기기 버튼 클릭 시 이벤트
	        $('.moreIconWrap').click(function () {
	            // sidebar 열기/닫기
	            $('#sidebar-main').toggleClass('active');
	            $('#sidebar-main').animate({ 'right': '0px' }, 250);
	            $('#overlay').show();
	        });
	
	        $(document).mouseup(function (e) {
	            const container = $("#sidebar-main");
	            const overlay = $("#overlay");
	            // sidebar와 overlay 영역 외부 클릭 시 사라지도록 설정
	            if (!container.is(e.target) && container.has(e.target).length === 0) {
	                container.removeClass('active');
	                container.animate({ 'right': '-300px' }, 500);
	                overlay.hide();
	            }
	        })
	
	        const clearBtn = document.querySelector('.clear');
	        clearBtn.addEventListener('click', function(){
	            const input = document.querySelector('input[type="search"]');
	            input.value = '';
	            $('.clear').hide();
	        });
	
	        $('input[type="search"]').on('focus', function(){
	            $('.clear').show();
	        });
	
	    });
	</script>
	
	<style>
	 		input::placeholder {
				color:#3E4684;
			}
			input:focus {
			    outline: 1px solid #3E4684;
			    border-radius : 2em;
			} 
		    .btn-create {
	            width: 80px;
	            height: 80px;
	            border-radius : 50%;
	            background-color: #3E4684;
	            z-index : 99999;
	        }
	        .create-img {
	        	 width:40px;
	        	 margin : 0.9em 0.7em;
	        }
			.create {
				color : white;
				font-size : 12px;
				margin:-1em;
				padding:0;
			}
	</style>

</head>
   <!-- Navbar -->
   <nav class="navbar navbar-expand-lg" style="background-color: #A4C5B1" data-bs-theme="dark">
      <div class="container-fluid col-md-9 ms-auto">
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
                  <a class="nav-link" href="/matchBoard/list">팀 매치</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/ground/list">구장 목록</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/team/list">팀 게시판</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/free/list">용병 게시판</a>
               </li>
            </ul>
         </div>
         <!-- 검색창 -->
         <form class="d-flex me-4">
              <input class="form-control me-sm-2" type="search" placeholder="Search">
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