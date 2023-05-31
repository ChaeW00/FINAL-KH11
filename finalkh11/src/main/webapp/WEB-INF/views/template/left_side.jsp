<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--팀 프로필 사진 -->
<div class = "row">
	<div class = "div-team-info shadow p-3 bg-white" >
		<div class = "d-flex div-team-img justify-content-center align-items-center">
				<c:choose>
					<c:when test="${teamVO.imgNo != 0}">
						<img alt="팀 로고사진" src="${pageContext.request.contextPath}/img/download/${teamVO.imgNo}" width="150" height="150">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/static/image/profile.png" width="150" height="150">
					</c:otherwise>
				</c:choose>
		</div>

   		<!-- 팀 정보 -->
<%--    		<div class = "row" id = "div-member-info" data-memberno = "${teamMemberDto.teamMemberNo}" data-teamno = "${teamMemberDto.teamNo}" data-membergrade="${teamMemberDto.teamMemberLevel}" data-memberattachmentno = "${teamMemberDto.memberAttachmentNo}"> --%>
   		<div class = "row" id = "div-member-info" data-memberno = "${teamMemberDto.teamMemberNo}" data-teamno = "${teamMemberDto.teamNo}" data-membergrade="${teamMemberDto.teamMemberLevel}" data-memberattachmentno = "${teamDto.imgNo}">
			<span class="team-side team-name mt-1">${teamVO.getTeamName()}</span><%--팀 이름 --%>
			<span class="team-side mt-1">멤버 수 ${teamVO.getTeamMemberCount()}</span>
			<span class="team-side mt-1 mb-1">${teamVO.getTeamInfo()}<br> <%--팀 소개 --%></span>
			<span class="team-side mt-1">팀 리더 : ${teamVO.teamLeader}</span>
		</div>
		
		<div class = "row mt-1">
			<div class = "col">
			    <c:if test="${teamMemberDto.getMemberId() != memberId}"><%-- 팀 회원이 아니면 --%>
			    	<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/team/${teamNo}/join">팀 가입</button>
			    </c:if>
<%-- 			    <c:if test="${teamMemberDto.memberId==sessionScope.memberId}"> --%>
<%-- 					<a href="${pageContext.request.contextPath}/team/${teamNo}/editMyInfo"><span>내 정보 수정</span></a> --%>
<%-- 			 	</c:if>	 --%>
			</div>
			<div class = "col">
				<!-- 팀 수정 -->
			 	<c:if test="${teamVO.getTeamLeader() == sessionScope.memberId}">
					<a href="${pageContext.request.contextPath}/team/edit?teamNo=${teamVO.getTeamNo()}"><i class="fa-solid fa-gear"></i><span>팀 수정</span></a>					
				</c:if>
				
			</div>
		</div>
	</div>
   
</div>