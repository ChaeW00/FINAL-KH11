<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"> --%>
<%-- 	<jsp:param value="${teamVO.getTeamName()}" name="title"/> --%>
<%-- </jsp:include> --%>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>

<style>
	a {
		text-decoration: none;
	}
	body {
		background-color: rgba(230, 230, 230, 100);
	}
	
	.div-member-profile {
		width: 70px;
		height: 70px;
	}
	
	.img-member-profile {
		border-radius: 50%;
		width: 100%;
	}
	.div-editor-opener,
	.div-editor-input {
		border-radius: 10px;
		border-color : rgba(210, 210, 210);
		background-color: rgba(240, 240, 240, 50);
		padding-left: 2%;
		color: rgba(140, 140, 140, 140);
	}
  	.div-board-container{
    	border-radius: 10px 10px;  
  	}
	
	.div-board {
		background-color: white;
	}
	
	.div-board-top {
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	
	.div-board-bottom,
  	.div-reply-bottom {
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	
	.p-writer-info {
		font-weight: 1000;
	}
	
	.div-icon-dropdown {
		width : 20px;
	}
	
	.button-board,
  	.btn-reply-more {
		cursor: pointer;
		align-content: center;
	}
	
	.icon-board, 
	.icon-editor-opener {
		color: black;
		font-size: 20px;
	}
	
	.team-img {
      	width : 250px;
      	height : 250px;      
   	}
   	
  	.shadow rounded-3{
    	border-radius: 50px 50px;
  	}
	
	@keyframes heart-on {
        from {color:black;}
        to {color:#FF8681;}
        0% {transform: rotate(10deg);}
        5% {transform: rotate(-10deg);}
        10% {transform: rotate(10deg);}
        15% {transform: rotate(-10deg);}
        20% {transform: rotate(10deg);}
        25% {transform: rotate(-10deg);}
        30% {transform: rotate(10deg);}
        35% {transform: rotate(-10deg);}
        40% {transform: rotate(10deg);}
        45% {transform: rotate(-10deg);}
        50% {transform: rotate(0deg);}
    }
  
 	.icon-board-like-on {
 		animation-name: heart-on;
        animation-fill-mode: forwards;
        animation-delay: 0s;
        animation-duration: 1s;
        animation-iteration-count: 1;
	}
	
	@keyframes heart-off {
        from {color:#FF8681;}
        to {color:black;}
        0% {transform: rotate(10deg);}
        5% {transform: rotate(-10deg);}
        10% {transform: rotate(10deg);}
        15% {transform: rotate(-10deg);}
        20% {transform: rotate(10deg);}
        25% {transform: rotate(-10deg);}
        30% {transform: rotate(10deg);}
        35% {transform: rotate(-10deg);}
        40% {transform: rotate(10deg);}
        45% {transform: rotate(-10deg);}
        50% {transform: rotate(0deg);}
    }
  
 	.icon-board-like-off {
 		animation-name: heart-off;
        animation-fill-mode: forwards;
        animation-delay: 0s;
        animation-duration: 1s;
        animation-iteration-count: 1;
	}
	.div-reply,
	.btn-reply-edit-submit,
	.btn-reply-edit-cancel
	.div-reply-more, .btn-reply-more {
	  	background-color: rgba(250, 250, 250, 100);
	}
	
	.div-reply-member-profile {
	  	width: 60px;
	  	height : 60px;
	}
	
	.span-reply-writer-profile {
	  	width: 40px;
	  	height: 40px;
	}
	
	.div-reply-text {
	  	font-size: 14px;
	}
	
	/* 수정, 수정 취소 버튼 */
	.btn-reply-edit-submit,
	.btn-reply-edit-cancel {
	  	color: #FEC260; 
	}
	/* 멤버 프로필 포인터 표시*/
	.member-profile {
		cursor: pointer;
	}
	
	.team-container-radius {
		border-radius : 15px;
	}
	/*사이드바 관련*/
	 body {
		background-color: #F5F5F5;	
	}
	.div-team-info,
	.div-member-info-list,
	.div-right-side,
	.div-search-member-input {
		border-radius : 15px;
	}
	.team-profile {
		width : 100px;
		height : 300px;
		border-radius : 15px;
	}
	#crown {
		width:20px;
	}
	.member-search {
		margin-right : 1.8em;
		background-color:transparent;
	}
	.btn-join {
		display : none;
	}
	.profile-img {
		width : 60px;
		border-radius : 50%;
	}
	.img-member-profile {
		width : 50px;
		height : 50px;
		margin-left : 7px;
	}
	.reply-profile {
		width : 40px;
		height : 40px;
	}
</style>


<div class = "container-fluid mt-2 mb-2 main-content">
	
	<div class = "row">
			
		<div class = "col-8 offset-2">
			
			<div class = "row">
				
				<!-- 왼쪽 사이드바 -->
				<div class="col-3">
					<jsp:include page="/WEB-INF/views/template/left_side.jsp"></jsp:include>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col-6">
					<%-- 게시글 검색창 --%>
					<div class = "row">
						<div class = "col">
							<div class = "d-flex ps-3 py-3 bg-white div-editor-opener shadow">
								<input type = "text" class = "input-search col-11 d-flex flex-fill div-editor-input py-1 px-2" placeholder = "검색어 입력">
								<button class="col-1 d-flex align-items-center justify-content-center border-0 bg-white icon-editor-opener btn-search-submit">
									<i class="fa-solid fa-magnifying-glass w-100"></i>
								</button>
							</div>
						</div>
					</div>
						
					<%-- 게시글 작성창 --%>
					<div class = "row mt-3 div-editor-insert">
						<div class = "col">
							<div class = "d-flex ps-3 py-3 bg-white div-editor-opener shadow">
								<button class="col-11 d-flex flex-fill div-editor-opener editor-open-insert py-1 px-2" data-bs-toggle="modal" data-bs-target="#modal-insert">새 소식을 남겨보세요</button>
								<button class="col-1 d-flex align-items-center justify-content-center border-0 bg-white icon-editor-opener editor-open-insert" data-bs-toggle="modal-insert" data-bs-target="#modal-insert">
									<i class = "fa-solid fa-pen-to-square w-100"></i>
								</button>
							</div>
						</div>
					</div>
							
					<%-- 게시글 목록 --%>
					<div class = "row">
						<div class = "col" id = "div-board-list"> <%-- 게시글 목록이 표시될 영역 --%>
							
						</div>		
					</div>
							
					<%-- 게시글 작성 Modal --%>
			        <div class="modal fade" id="modal-insert" tabindex="-1" data-bs-backdrop-insert="static">
			            <div class="modal-dialog modal-dialog-centered modal-lg">
			                <div class="modal-content">
			                    <!-- 모달 헤더 : 제목 영역 -->
			                    <div class="modal-header">
			                        <h5 class="modal-title">게시글 작성</h5>
			                        <!-- X 버튼 -->
			                        <button type="button" class="btn-close modal-insert-close" aria-label="Close"></button>
			                    </div>
			                    <!-- 모달 바디 -->
			                    <div class="modal-body">
			                        <!-- Summer Note 영역 - 게시글 작성 영역 -->
			                        <textarea id = "summernote-insert"></textarea>
			                    </div>
			                    <!-- 모달 푸터 -->
			                    <div class="modal-footer">
			                        <button type="button" class="btn modal-insert-submit">작성</button>
			                        <button type="button" class="btn modal-insert-close">닫기</button>
			                    </div>
			                </div>
			            </div>
			        </div>
					        
			        <%-- 게시글 수정 Modal --%>
					<div class="modal fade" id="modal-edit" tabindex="-1" data-bs-backdrop-edit="static">
			            <div class="modal-dialog modal-dialog-centered modal-lg">
			                <div class="modal-content">
			                    <!-- 모달 헤더 : 제목 영역 -->
			                    <div class="modal-header">
			                        <h5 class="modal-title">게시글 수정</h5>
			                        <!-- X 버튼 -->
			                        <button type="button" class="btn-close modal-edit-close" aria-label="Close"></button>
			                    </div>
			                    <!-- 모달 바디 -->
			                    <div class="modal-body">
			                        <!-- Summer Note 영역 - 게시글 수정 영역-->
			                        <textarea id = "summernote-edit"></textarea>
			                    </div>
			                    <!-- 모달 푸터 -->
			                    <div class="modal-footer">
			                        <button type="button" class="btn modal-edit-submit">수정</button>
			                        <button type="button" class="btn modal-edit-close">닫기</button>
					        	</div>
					    	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




