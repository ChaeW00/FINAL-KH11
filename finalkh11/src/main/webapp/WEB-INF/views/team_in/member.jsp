<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"> --%>
<%-- 	<jsp:param value="${teamVO.getTeamName()}" name="title"/> --%>
<%-- </jsp:include> --%>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>
<style>
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
	.pagination{
		justify-content : center
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
		height : 60px;
		border-radius : 50%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.bundle.min.js"></script>

<!--아이콘 CDN-->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <!-- bootswatch cdn-->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
<div class="container-fluid mt-2 mb-2">
	<div class="row">
		
		<div class="col-8 offset-2">
			 
			<div class="row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class="col-3">
					<jsp:include page="/WEB-INF/views/template/left_side.jsp"></jsp:include>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class="col-6">
					<div class="row">
						<div class="col">
							<div class="d-flex px-3 py-2 mb-2 shadow div-search-member-input search-bar bg-white">
								<input class="flex-fill input-search-member search-box" type="text" placeholder="회원 검색">
								<button class="btn-search-member-submit header-btn member-search" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
							</div>
							<div class="shadow div-member-info-list p-3" style="background-color:white;">
								<div style="font-size:20px;" class="mb-2">총 멤버 : ${teamMemberList.size()}명</div>
								<c:forEach var="teamMember" items="${teamMemberList}">
									<div class="mb-2 div-member-info">
<%-- 										<img src="${pageContext.request.contextPath}/img/download/${teamMemberList.teamMemberDto.imgDto.imgNo}" onerror="this.onerror=null; this.src='/static/image/profile.png';" class="member-profile profile-img me-2" data-writerno="${teamMemberList.teamMemberNo}"> --%>
<%-- 										${teamMember.memberId}  (${teamMember.teamMemberLevel}) --%>
										<c:out value="${teamMember.memberId}" />  (${teamMember.teamMemberLevel})
										<hr>	
									</div> 
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				
				<%-- 오른쪽 사이드바 --%>
<!-- 				<div class="col-3"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="div-right-side p-3 shadow bg-white"> -->
<!-- 						 	<div style="height:43px;"> -->
<!-- 								다가오는 일정 -->
<!-- 								<hr /> -->
<!-- 							</div> -->
<!-- 							<div> -->
<%-- 								<c:forEach var="planListRownum" items="${planListRownum}">	 --%>
<!-- 									<div style="margin-bottom: 10px;">	 -->
<%-- 										<span style="font-size:20px;">${planListRownum.planTitle}</span> --%>
<!-- 										<br> -->
<%-- 										<span style="font-size:12px;">${fn:substring(planListRownum.planStart, 2, 4)}년 ${fn:substring(planListRownum.planStart, 5, 7)}월 ${fn:substring(planListRownum.planStart, 8, 10)}일 ${fn:substring(planListRownum.planStart, 11, 16)}</span> --%>
<!-- 									</div>	 -->
<%-- 								</c:forEach> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 지우지마시오 -->
<%-- <c:forEach var = "teamMemberList" items = "${teamMemberList}"> --%>
<!-- 	<div class = "mb-2 div-member-info"> -->
<%-- 		회원 번호 : ${teamMemberList.memberNo} <br> --%>
<%-- 		소모임 번호 : ${teamMemberList.memberTeamNo} <br> --%>
<%-- 		회원 아이디 : ${teamMemberList.memberId} <br> --%>
<%-- 		회원 등급 : ${teamMemberList.memberGrade} <br> --%>
<%-- 		회원 활동점수 : ${teamMemberList.memberScore} <br> --%>
<%-- 		회원 가입일 : ${teamMemberList.memberJoindate} <br> --%>
<%-- 		회원 닉네임 : ${teamMemberList.memberNick} <br> --%>
<%-- 		회원 프로필 번호 : ${teamMemberList.memberAttachmentNo} <br> --%>
<!-- 		<hr>	 -->
<!-- 	</div>  -->
<%-- </c:forEach> --%>

	<%-- 페이지 네비게이터 --%>
<!-- 	<div class=" mt-3 mb-4"> -->
<!-- 	<ul class="pagination"> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test = "${teamMemberInfoRequestVO.isFirst()}"> --%>
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href = "">&laquo;</a> -->
<!-- 				</li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<li class="page-item"> -->
<%-- 					<a class="page-link" href = "member?p=${teamMemberInfoRequestVO.firstBlock()}&${teamMemberInfoRequestVO.parameter()}">&laquo;</a> --%>
<!-- 				</li> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
<%-- 		<c:choose> --%>
<%-- 			<c:when test = "${teamMemberInfoRequestVO.hasPrev()}"> --%>
<!-- 				<li class="page-item"> -->
<%-- 					<a class="page-link" href = "member?p=${teamMemberInfoRequestVO.prevBlock()}&${teamMemberInfoRequestVO.parameter()}">&lt;</a> --%>
<!-- 				</li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href = "">&lt;</a> -->
<!-- 				</li> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
<%-- 		<c:forEach var = "i" begin = "${teamMemberInfoRequestVO.startBlock()}" end = "${teamMemberInfoRequestVO.endBlock()}" step = "1"> --%>
<!-- 			<li class="page-item"> -->
<%-- 				<a class="page-link" href = "member?p=${i}&${teamMemberInfoRequestVO.parameter()}">${i}</a> --%>
<!-- 			</li> -->
<%-- 		</c:forEach> --%>
		
<%-- 		<c:choose> --%>
<%-- 			<c:when test = "${teamMemberInfoRequestVO.hasNext()}"> --%>
<!-- 				<li class="page-item"> -->
<%-- 					<a class="page-link" href = "member?p=${teamMemberInfoRequestVO.nextBlock()}&${teamMemberInfoRequestVO.parameter()}">&gt;</a> --%>
<!-- 				</li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href = "">&gt;</a> -->
<!-- 				</li> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
<%-- 		<c:choose> --%>
<%-- 			<c:when test = "${teamMemberInfoRequestVO.isLast()}"> --%>
<!-- 				<li class="page-item"> -->
<!-- 					<a class="page-link" href = "">&raquo;</a> -->
<!-- 				</li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<li class="page-item"> -->
<%-- 					<a class="page-link" href = "member?p=${teamMemberInfoRequestVO.lastBlock()}&${teamMemberInfoRequestVO.parameter()}">&raquo;</a> --%>
<!-- 				</li> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 	</ul> -->
<!-- 	</div> -->
<!-- </div> -->

	<script>
		var teamNo = $(".div-member-info").data("data-teamno");
		// 초기 검색시 조회되는 페이지를 1페이지로
		var p = 1;

		// 검색 버튼을 누를 때 검색 실행
		$(function(){
			$(".btn-search-member-submit").click(function(){
				// 검색창의 문자열을 변수로 지정
				var keyword = $(".input-search-member").val();
				console.log(keyword);
				var form = $("<form>").attr("method", "get").attr("action", "member");
				var input_keyword = $("<input>").attr("type", "hidden").attr("name", "keyword").attr("value", keyword);
				var input_p = $("<input>").attr("type", "hidden").attr("name", "p").attr("value", p);
				form.append(input_keyword).append(input_p);
				$("body").append(form);
				form.submit();
			});
		});
	</script>
	<script>
    // 검색 버튼을 누를 때 검색 실행
    $(function(){
        $(".btn-search-member-submit").click(function(){
            // 검색창의 문자열을 변수로 지정
            var keyword = $(".input-search-member").val();
            console.log(keyword);
            var form = $("<form>").attr("method", "get").attr("action", "member");
            var input_keyword = $("<input>").attr("type", "hidden").attr("name", "keyword").attr("value", keyword);
            var input_p = $("<input>").attr("type", "hidden").attr("name", "p").attr("value", p);
            form.append(input_keyword).append(input_p);
            $("body").append(form);
            form.submit();
        });
    });
</script>
</div>
