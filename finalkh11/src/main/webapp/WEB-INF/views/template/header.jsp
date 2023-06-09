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
<!-- 	<link rel="stylesheet" type="text/css" href="/static/css/header.css"> -->
	
	<!-- Footer CSS -->
	<link rel="stylesheet" type="text/css" href="/static/css/footer.css">
	
	<!-- Font Awesome CDN -->
	<link rel="stylesheet" type = "text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Bootstrap CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- bootswatch CDN -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet">
	
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
	
	<!-- MDB -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.css" rel="stylesheet"/>
	
	<!-- MDB -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
	
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
		const imgNo = "${sessionScope.imgNo}";
	</script>
	
</head>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top">
		<div class="text-white container-fluid col-md-7">
			<button
				class="navbar-toggler"
				type="button"
				data-mdb-toggle="collapse"
				data-mdb-target="#navbarExample01"
				aria-controls="navbarExample01"
				aria-expanded="false"
				aria-label="Toggle navigation"
			>
			<i class="fas fa-bars"></i>
 			</button>
			<!-- Navbar brand -->
			<a class="navbar-brand me-2" href="/">
				<img
					src="/static/image/matchUp.png"
					height="60"
					alt="MDB Logo"
					loading="lazy"
					style="margin-top: -1px;"
				/>
			</a>
			<!-- 헤더 메뉴 -->
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
			<!-- 검색창 -->
			<form class="d-flex input-group w-auto me-4">
				<input
					type="search"
					class="form-control rounded"
					placeholder="Search"
					aria-label="Search"
					aria-describedby="search-addon"
				/>
				<span class="input-group-text border-0" id="search-addon">
					<i class="fas fa-search"></i>
				</span>
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
			<c:if test="${sessionScope.memberId !=null}">
				<!-- 드롭 다운 -->
				<div class="dropdown text-center">
					<a
						class="dropdown-toggle d-flex align-items-center hidden-arrow"
						href="#"
						id="navbarDropdownMenu"
						role="button"
						data-mdb-toggle="dropdown"
						aria-expanded="false"
					>
					<img
						src="/static/image/profile.png"
						class="rounded-circle"
						height="25"
						alt="프로필 사진"
						loading="lazy"
					/>
					</a>
					<ul
						class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuAvatar"
					>
						<li>
							<a class="dropdown-item" href="/member/mypage">마이페이지</a>
						</li>
						<li>
							<a class="dropdown-item" href="#">팀</a>
						</li>
						<li>
							<a class="dropdown-item" href="/member/logout">로그아웃</a>
						</li>
	        		</ul>
				</div>
			</c:if>
		</div>
	</nav>