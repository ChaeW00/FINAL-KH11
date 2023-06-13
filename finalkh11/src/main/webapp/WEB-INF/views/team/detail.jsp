<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${teamVO.getTeamName()}" name="title"/>
</jsp:include>

</div>
<!-- 폰트 css -->
     <link rel="stylesheet" type="text/css" href="/static/css/font.css">	

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
	.member-only {
		width : 160px;
		height : 160px;
	}
	
</style>

<div class="container-fluid mt-4 mb-4 main-content">
	<div class="row">
		<div class="col-8 offset-2">
			<div class="row">
				<%-- 왼쪽 사이드바 --%>
				<div class="col-3">
					<%-- 팀 프로필 사진 --%>
					<div class="row">
						<div class="div-team-info shadow p-3 bg-white">
							<div class="d-flex div-team-img justify-content-center align-items-center">
								<c:choose>
									<c:when test="${teamDto.imgNo != 0}">
										<img alt="팀 로고사진" src="${pageContext.request.contextPath}/img/download/${teamDto.imgNo}" width="250" height="250">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/static/image/profile.png" width="250" height="250">
									</c:otherwise>
								</c:choose>
							</div>
							<p>
							<%-- 팀 정보 --%>  
							<div class="row" id="div-member-info" data-memberno="${teamMemberDto.memberNo}" data-teamno="${teamMemberDto.memberteamNo}" data-memberlevel="${teamMemberDto.teamMemberLevel}">
								<span class="team-side team-name mt-1">팀 명 : ${teamDto.getTeamName()}</span> <%-- 팀 이름 --%>
								<span class="team-side mt-1">팀 리더 : ${teamDto.teamLeaderName}</span>
								<span class="team-side mt-1">멤버 수 : ${count} 명</span>
								<span class="team-side mt-1 mb-1">${teamDto.getTeamInfo()}<br> <%-- 팀 소개 --%></span>
							</div>
							<div class="row mt-1">
								<div class="col">
									<c:choose>
 										<c:when test="${teamMemberDto.memberId != null && teamMemberDto.memberId != memberId}"> <%-- 팀 회원이 아니면 --%>
								    		<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/team_in/${teamNo}/insert'">팀 가입</button>
								    	</c:when>
								    	<c:otherwise>
								    		<button type="button" class="btn btn-join" disabled>팀 가입</button><%-- 팀 회원이라면 --%>
								    	</c:otherwise>
								    </c:choose>
								</div>
								<div class="col">
									
								</div>
							</div>
						</div>  
					</div>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class="col-6">
					<div class="row">
						<div class="col">
							<div class="shadow div-member-info-list p-3 bg-white">
								<h3>팀 소개</h3>
								<span class="team-side fs-5">팀 명 : ${teamDto.getTeamName()}<br></span>
								<span class="team-side fs-5">멤버 수 : ${count}명 <br></span>
								<span class="team-side fs-5">활동지역 : ${teamDto.getTeamCity()} ${teamDto.getTeamLocation()}<br></span>
								<span class="team-side fs-5">활동요일, 시간 : ${teamDto.getTeamDay()} ${teamDto.getTeamTime()}<br></span>
								<span class="team-side fs-5">성별, 나이:${teamDto.getTeamGender()} ${teamDto.getTeamAge()}<br></span>
								<span class="team-side fs-5">${teamDto.getTeamInfo()}<br> <%-- 팀 소개 --%></span>
								<%-- members-only icon --%>
								<div class="mt-4">
									<img src="${pageContext.request.contextPath}/static/image/members-only.png" class="member-only mx-auto d-block">
								</div>
								<%-- 팀 가입하기 버튼 --%>
								<div class="mt-4">
									<c:choose>
										<c:when test="${teamMemberDto.getMemberId() == null}"><%-- 팀 회원이 아니면 --%>
											<button id="join-btn" class="btn mx-auto d-block" style="background-color: #E6E6E6; color:#3E4684;">팀 가입하기 &nbsp;<i class="fa-solid fa-angles-right"></i></button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-join" disabled>팀 가입하기</button><%-- 팀 회원이라면 --%>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>

<form action="teamJoin" method="post">
	<div class="modal" tabindex="-1" role="dialog" id="join" data-bs-backdrop="static" ref="modal02">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">${teamVO.getTeamName()} 가입 신청</h5>
				</div>
				<div class="modal-body">
					<input type="hidden" value="${teamNo}" name="teamNo">
					<input type="hidden" value="${memberDto.memberId}" name="memberId">
					<div>
						이름 : ${memberDto.memberName}
					</div>
					<div>
						성별 : ${memberDto.memberGender}
					</div>
					<div>
						매너지수 : ${memberDto.memberManner}
					</div>
					<div>
						생년월일 : ${memberDto.memberBirth}
					</div>
					<textarea name="introduction"></textarea>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn mx-auto d-block" style="background-color: #E6E6E6; color:#3E4684;">가입 신청</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</form>

	

<script>
	$(function(){
		$("#join-btn").click(function(){
			$("#join").modal("show");
			//$("#modal02").modal("hide");
		});
	});
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>