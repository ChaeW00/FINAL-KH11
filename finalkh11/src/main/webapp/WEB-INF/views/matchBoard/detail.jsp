<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/cosmo/bootstrap.min.css">
 
<style>
	.center-align{
		text-align: center;
	}
	
	.custom-container {
		width:66.67%;
		margin: 0 auto;
	}
	
	.row {
		margin: 0 auto;
		mt: 2px;
	}
	
	.reply-item {
		font-size:20px;
		padding:1em;
	}
	
	.ms-20 {
    	margin-left: 20px;
    	cursor: pointer;
	}

	.ms-10 {
    	margin-left: 10px;
    	cursor: pointer;
	}
	
	.author {
		display: inline-block;
    	padding: 2px 6px;
    	border: 1px solid red;
    	border-radius: 4px;
    	color: red;
	}
	
	.fa-check {
    	border: 2px solid lime;
    	background-color: lime;
    	color: green;
    	padding: 5px;
    	border-radius: 5px;
	}
	
	.box {
    	border: 1px solid;
    }
    	
    .panel {
    	text-align: center;
    }
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script>
	var sessionId = "${sessionScope.memberId}";	//현재 로그인
	var boardWriter = "${matchBoardDto.memberId}";	//매치 모집글 작성자
</script>

<script src="/static/js/matchReply.js"></script>
<script type="text/template" id="reply-template">
    <div class="reply-item">
        <div class="memberId">?</div>
        <div class="matchReplyContent">?</div>
        <div class="matchReplyTime">?</div>
    </div>
</script>

<div class="container-fluid mt-4 custom-container">
	<div class="row">
		<h1 class="center-align">모집글 게시판</h1>
	</div>
	<div class="row">
		<h2 style="color:gray;">${matchBoardDto.matchBoardHead}</h2>
	</div>
	<hr>
	<div class="row">
			<h3> ${matchBoardDto.matchBoardTitle} </h3>
	</div>
	<hr>
	<div class="row">
		<div class="col">
			<h4>${matchBoardDto.memberId} ${matchBoardDto.getMatchBoardTimeAuto()} 조회수 : ${matchBoardDto.matchBoardRead}</h4>
		</div>
		<div class="col text-end">
			<a class="btn btn-light mt-2" href="/matchBoard/list">목록</a>
		</div>
	</div>
	<hr>
	<div class="row" style="min-height:200px;">
		${matchBoardDto.matchBoardContent}
	</div>
	<div class="row">
		<p>매치 정보 : ${matchBoardDto.matchBoardCity} ${matchBoardDto.matchBoardLocation} <fmt:formatDate value="${matchBoardDto.matchBoardDate}" pattern="y년 M월 d일"/> ${matchBoardDto.matchBoardTime2} ${matchBoardDto.matchBoardAge}대 ${matchBoardDto.matchBoardSize}vs${matchBoardDto.matchBoardSize}</p>
	</div>
	<hr>
	<!-- 추가된 코드 -->
    		<div class="row">
      			<!-- 첫 번째 구역 -->
      			<div class="col-md-4">
        			<!-- 첫 번째 구역의 내용 -->
        			<h3 class="panel">Home Team</h3>
        			<div class="box">
    					<ul>
  							<c:forEach items="${homeTeams}" var="homeTeam">
    							<li>${homeTeam}</li>
  							</c:forEach>
						</ul>
					</div>
      			</div>
      		
      			<!-- 두번째 구역 -->
      			<div class="col-md-4">
      				<h3 class="panel">대기실</h3>
      				<div class="box">
      					<ul>
        					
        				</ul>
      				</div>
      			</div>
      		
      			<!-- 세 번째 구역 -->
      			<div class="col-md-4">
        			<!-- 세 번째 구역의 내용 -->
        			<h3 class="panel">Away Team</h3>
        			<div class="box">
        				<ul>
        					
        				</ul>
        			</div>
      			</div>
    		</div>
	<hr>
	<div class="row">
		댓글
		<span class="reply-count">${matchBoardDto.matchBoardReply}</span>
	</div>
	<hr>
	<div class="row reply-list">
		댓글 목록
	</div>
	<hr>
	
	<div>
		<c:if test="${sessionScope.memberId != null}">
    		<p>${sessionScope.memberId}</p>
		</c:if>
	</div>
	
	<div class="row">
		
		<div class="row">
			<c:choose>
				<c:when test="${sessionScope.memberId != null}">
					<textarea name="matchReplyContent" class="form-control w-100"
							placeholder="댓글 내용을 작성하세요"></textarea>	
				</c:when>
				<c:otherwise>
					<textarea name="matchReplyContent" class="form-control w-100"
							placeholder="로그인 후에 댓글 작성이 가능합니다" disabled></textarea>	
				</c:otherwise>
			</c:choose>
			
		</div>
		<c:if test="${sessionScope.memberId != null}">		
		<div class="row">
			<button type="button" class="btn btn-dark mt-2 reply-insert-btn">댓글 작성</button>
		</div>
		</c:if>

	</div>
	
	<hr>
	
	<div class="row">
		<a class="btn btn-primary mt-2" href="/match/write?matchBoardNo=${matchBoardDto.matchBoardNo}">글쓰기</a>
		
		<c:if test="${owner}">
		<!-- 내가 작성한 글이라면 수정과 삭제 메뉴를 출력 -->
		<a class="btn btn-secondary mt-2" href="/matchBoard/edit?matchBoardNo=${matchBoardDto.matchBoardNo}">수정</a>
		</c:if>
		
		<c:if test="${owner || admin}">
		<!-- 파라미터 방식일 경우의 링크 -->
		<a class="btn btn-danger mt-2" href="/matchBoard/delete?matchBoardNo=${matchBoardDto.matchBoardNo}">삭제</a>
		<!-- 경로 변수 방식일 경우의 링크 -->
	<%-- 				<a href="/board/delete/${boardDto.boardNo}">삭제</a> --%>
		</c:if>
		<a class="btn btn-light mt-2" href="/matchBoard/list">목록보기</a>
	</div>
	
</div>