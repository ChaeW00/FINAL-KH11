<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"> --%>
<%-- 	<jsp:param value="${teamVO.getTeamName()}" name="title"/> --%>
<%-- </jsp:include> --%>

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
	.member-only {
		width : 160px;
		height : 160px;
	}

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<div class = "container-fluid mt-4 mb-4">
	<div class = "row">
		
		<div class = "col-8 offset-2">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>

				<div class = "col-3">
					<%--팀 프로필 사진 --%>
					<div class = "row">
						<div class = "div-team-info shadow p-3 bg-white">
							<div class = "d-flex div-team-img justify-content-center align-items-center">
							
							<c:if test="${attachmentList.isEmpty()}">
						    	<img src = "${pageContext.request.contextPath}/image/bg_default.jpg" class="flex-fill team-profile">
					    	</c:if>
				      		<c:forEach var = "list" items = "${attachmentList}"> <!-- 설정한 프로필 -->
				        		<img src = "${pageContext.request.contextPath}/attachment/download/team?attachmentNo=${list.attachmentNo}" class="flex-fill team-profile">  					
				      		</c:forEach>
							</div>
						
			      		
				      		<%--팀 정보 --%>  
				      		<div class = "row" id = "div-member-info" data-memberno = "${teamMemberDto.memberNo}" data-teamno = "${teamMemberDto.memberteamNo}" data-memberlevel="${teamMemberDto.memberLevel}">
								<span class="team-side team-name mt-1">${teamVO.getTeamName()}</span><%--팀 이름 --%>
								<span class="team-side mt-1">멤버 ${teamVO.getTeamMemberCount()} </span>
								<span class="team-side mt-1 mb-1">${teamVO.getTeamInfo()}<br> <%--팀 소개 --%></span>
								<span class="team-side mt-1">팀 리더 : ${teamVO.getTeamLeader()}</span>
							</div>
							
							<div class = "row mt-1">
								<div class = "col">
									<c:choose>
								    <c:when test="${teamMemberDto.getMemberId() != memberId}"><%--팀 회원이 아니면 --%>
								    	<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/team_in/${teamNo}/insert'">팀 가입</button>
								    </c:when>
								    <c:otherwise>
								    	<button type="button" class="btn btn-join" disabled>팀 가입</button><%-- 팀 회원이라면 --%>
								    </c:otherwise>
								    </c:choose>
<%-- 								    <c:if test="${teamMemberDto.memberId==sessionScope.memberId}"> --%>
<%-- 										<a href="${pageContext.request.contextPath}/team_in/${teamNo}/editMyInfo"><span>내 정보 수정</span></a> --%>
<%-- 								 	</c:if>	 내 정보 수정할게 없는거 같아서 보류--%>
								</div>
								<div class = "col">
									
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col-6">
				
					<div class = "row">
						<div class = "col">
							<div class = "shadow div-member-info-list p-3 bg-white">
								
								<h3>팀 소개</h3>
									<span class="team-side fs-5">가입한 멤버 ${teamVO.getTeamMemberCount()}명 <br> </span>
									<span class="team-side  fs-6">${teamVO.getTeamInfo()}<br> <%--팀 소개 --%></span>
									
									<%--members-only icon --%>
									<div class="mt-4">
										 <img src = "${pageContext.request.contextPath}/image/members-only.png" class="member-only mx-auto d-block">
									</div>
									
									<%--팀 가입하기 버튼 --%>
									<div class="mt-4">
										<c:choose>
									    <c:when test="${teamMemberDto.getMemberId() == null}"><%-- 팀 회원이 아니면 --%>
									    	<button type="button" class="btn mx-auto d-block" onclick="location.href='${pageContext.request.contextPath}/team_in/${teamNo}/insert'" style="background-color : #E6E6E6; color:#3E4684;">팀 가입하기 &nbsp;<i class="fa-solid fa-angles-right"></i> </button>
									    </c:when>
									    <c:otherwise>
									    	<button type="button" class="btn btn-join" disabled>팀 가입하기</button><%-- 팀 회원이라면 --%>
									    </c:otherwise>
									    </c:choose>
								    </div>
			    
			    	<%--회원가입 버튼 --%>
<%-- 						<c:if test="${login == null}">
							<div class="mt-3 mb-3 fs-3">
								<a type="button" href="${pageContext.request.contextPath}/teamUser/login" >로그인하러 가기 <i class="fa-solid fa-angles-right"></i></a>
							</div>
						</c:if> --%>
									
						</div>
					</div>
				</div>
			</div>
				
				<%-- 오른쪽 사이드바 --%>
<!-- 				<div class = "col-3">
					<div class = "row">
						<div class = "div-right-side p-3 shadow bg-white">

						</div>
					</div>
				</div> -->
				
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

</script>

<%-- footer --%>
<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>