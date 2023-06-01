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
<%-- 			    	<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/team/${teamNo}/join">팀 가입</button> --%>
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
			
			<div class="mt-2">
				팀 신청 목록
<form action="" method="post" id="joinAcceptForm">
    <c:forEach var="memberInfo" items="${memberInfo}" varStatus="status">
        <div id="member-${status.index}" class="mt-2">${memberInfo.memberDto.memberName}</div>
        <div class="modal" tabindex="-1" role="dialog" id="member-info-${status.index}" data-bs-backdrop="static" ref="modal02">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">${memberInfo.memberDto.memberName} 정보</h5>
                    </div>
                    <div class="modal-body">
                        <div>
                            이름 : ${memberInfo.memberDto.memberName}
                        </div>
                        <div>
                            성별 : ${memberInfo.memberDto.memberGender}
                        </div>
                        <div>
                            매너온도 : ${memberInfo.memberDto.memberManner}
                        </div>
                        <div>
                            생일 : ${memberInfo.memberDto.memberBirth}
                        </div>
                        <div>
                            소개문 : ${memberInfo.waitingDto.introduction}
                        </div>
                        <input type="hidden" id="teamNo-${status.index}" value="${memberInfo.waitingDto.teamNo}" name="teamNo">
                        <input type="hidden" id="memberId-${status.index}" value="${memberInfo.memberDto.memberId}" name="memberId">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="submitJoinAccept(${status.index})">수락</button>
                        <button type="button" class="btn btn-danger" onclick="rejectMember(${status.index})">거절</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</form>
			</div>
		</div>
	</div>
   
</div>

<!-- JQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
	//모달창 클릭 시 정보 확인
    $(function() {
        $("[id^=member]").click(function() {
            var index = $(this).attr("id").split("-")[1];
            $("#member-info-" + index).modal("show");
        });
    });
    
    //가입 수락
//     function submitJoinAccept(index) {
//     	var teamNoInput = document.getElementById('teamNo-' + index);
//     	var memberIdInput = document.getElementById('memberId-' + index);

//     	if (teamNoInput && memberIdInput) {
//     		var form = document.createElement('form');
//     		form.action = 'joinAccept';
//     		form.method = 'post';

//     		var teamNoField = document.createElement('input');
//     		teamNoField.type = 'hidden';
//     		teamNoField.name = 'teamNo';
//     		teamNoField.value = teamNoInput.value;

//     		var memberIdField = document.createElement('input');
//     		memberIdField.type = 'hidden';
//     		memberIdField.name = 'memberId';
//     		memberIdField.value = memberIdInput.value;

//     		form.appendChild(teamNoField);
//     		form.appendChild(memberIdField);

//     		document.body.appendChild(form);
//     		form.submit();
//     	}
//     }
    function submitJoinAccept(index) {
		var form = document.getElementById('joinAcceptForm');
		var teamNoInput = document.getElementById('teamNo-' + index);
		var memberIdInput = document.getElementById('memberId-' + index);

	    if (form && teamNoInput && memberIdInput) {
	        form.action = 'joinAccept';
	        teamNoInput.name = 'teamNo';
	        memberIdInput.name = 'memberId';
	        form.submit();
	    }
    }
    
    function rejectMember(index) {
        var form = document.getElementById('joinAcceptForm');
        var memberIdInput = document.getElementById('memberId-' + index);

        if (form && memberIdInput) {
            form.action = 'joinReject';
            memberIdInput.name = 'memberId';
            form.submit();
        }
    }
</script>