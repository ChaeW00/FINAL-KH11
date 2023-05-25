<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--팀 프로필 사진 -->
<div class = "row">
	<div class = "div-team-info shadow p-3 bg-white" >
		<div class = "d-flex div-team-img justify-content-center align-items-center">
		
		<c:if test="${attachmentList.isEmpty()}">
	    	<img src = "${pageContext.request.contextPath}/images/bg_default.jpg" class="flex-fill team-profile">
    	</c:if>
     		<c:forEach var = "list" items = "${attachmentList}"> <!-- 설정한 프로필 -->
       		<img src = "${pageContext.request.contextPath}/attachment/download/team?attachmentNo=${list.attachmentNo}" class="flex-fill team-profile">  					
     		</c:forEach>
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
			    <c:if test="${teamMemberDto.memberId==sessionScope.memberId}">
					<a href="${pageContext.request.contextPath}/team/${teamNo}/editMyInfo"><span>내 정보 수정</span></a>
			 	</c:if>	
			</div>
			<div class = "col">
				<!-- 소모임 수정 -->
			 	<c:if test="${teamVO.getTeamLeader() == sessionScope.memberId}">
					<a href="${pageContext.request.contextPath}/team/edit?teamNo=${teamVO.getteamNo()}"><i class="fa-solid fa-gear"></i><span>팀 수정</span></a>					
				</c:if>
				
			</div>
		</div>
	</div>
   
</div>