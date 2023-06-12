<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--팀 프로필 사진 -->
<div class = "row">  

   <div class = "div-team-info shadow p-3 bg-white" >
      <div class = "d-flex div-team-img justify-content-center align-items-center">
            <c:choose>
               <c:when test="${teamDto.imgNo != 0}">
                  <img alt="팀 로고사진" src="${pageContext.request.contextPath}/img/download/${teamDto.imgNo}" width="250" height="250">
               </c:when>
               <c:otherwise>
                  <img src="${pageContext.request.contextPath}/static/image/profile.png" width="250" height="250">
               </c:otherwise>
            </c:choose>
      </div>

         <!-- 팀 정보 -->
<%--          <div class = "row" id = "div-member-info" data-memberno = "${teamMemberDto.teamMemberNo}" data-teamno = "${teamMemberDto.teamNo}" data-membergrade="${teamMemberDto.teamMemberLevel}" data-memberattachmentno = "${teamMemberDto.memberAttachmentNo}"> --%>
         <div class = "row" id = "div-member-info" data-memberno = "${teamMemberDto.teamMemberNo}" data-teamno = "${teamMemberDto.teamNo}" data-membergrade="${teamMemberDto.teamMemberLevel}" data-memberattachmentno = "${teamDto.imgNo}">
         <span class="team-side team-name mt-1">팀 명 : ${teamDto.getTeamName()}</span> <%-- 팀 이름 --%>
		 <span class="team-side mt-1">팀 리더 : ${teamDto.teamLeaderName}</span>
		 <span class="team-side mt-1">멤버 수 : ${count} 명</span>
		 <span class="team-side mt-1">활동지역 : ${teamDto.getTeamCity()} ${teamDto.getTeamLocation()}</span>
		 <span class="team-side mt-1">활동요일, 시간 : ${teamDto.getTeamDay()} ${teamDto.getTeamTime()}</span>
		 <span class="team-side mt-1">성별, 나이:${teamDto.getTeamGender()} ${teamDto.getTeamAge()}</span>
		 <span class="team-side mt-1 mb-1">${teamDto.getTeamInfo()}<br> <%-- 팀 소개 --%></span>
	     </div>	
      
      <div class = "row mt-1">
         <div class = "col">
             <c:if test="${teamMemberDto.getMemberId() != memberId}"><%-- 팀 회원이 아니면 --%>
<%--                 <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/team/${teamNo}/join">팀 가입</button> --%>
             </c:if>
<%--              <c:if test="${teamMemberDto.memberId==sessionScope.memberId}"> --%>
<%--                <a href="${pageContext.request.contextPath}/team/${teamNo}/editMyInfo"><span>내 정보 수정</span></a> --%>
<%--              </c:if>    --%>
         </div>
         <p>
         <div class = "col">
            <!-- 팀 수정 -->
             <c:if test="${teamDto.getTeamLeader() == sessionScope.memberId}">
               <a href="${pageContext.request.contextPath}/team/edit?teamNo=${teamDto.getTeamNo()}"><i class="fa-solid fa-gear"></i><span>팀 수정</span></a>               
            </c:if>
         </div>
        <p>          
        <div class = "col">
            <!-- 멤버관리-->
             <c:if test="${teamDto.getTeamLeader() == sessionScope.memberId}">
               <a href="${pageContext.request.contextPath}/team_in/leaderMember/${teamDto.getTeamNo()}"><i class="fa-solid fa-gear"></i><span>멤버 관리</span></a>               
            </c:if>
         </div>
         
         <!-- 신청자 정보 모달창 -->
         <div class="mt-2">
            팀 신청 목록
            <form action="" method="post">
                <c:forEach var="memberInfo" items="${memberInfo}" varStatus="status">
                    <div id="member-${status.index}" class="mt-2">${memberInfo.memberDto.memberName}</div>
                    <div class="modal" tabindex="-1" role="dialog" id="member-info-${status.index}" data-bs-backdrop="static" ref="modal02">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">${memberInfo.memberDto.memberName}(${memberInfo.memberDto.memberId}) 정보</h5>
                                </div>
                                <div class="modal-body">
                               		<div>
	                               		<img src="${pageContext.request.contextPath}/img/download/${teamMember.memberDto.imgNo}" 
	                                    onerror="this.onerror=null; this.src='/static/image/profile.png';" 
	                                    class="member-profile profile-img me-2" data-writerno="${teamMember.teamMemberDto.teamMemberNo}">
	            						${teamMember.memberDto.memberName}
                               		</div>
                                    <div>
                                        이름: ${memberInfo.memberDto.memberName}
                                    </div>
                                    <div>
                                        성별: ${memberInfo.memberDto.memberGender}
                                    </div>
                                    <div>
                                        매너온도: ${memberInfo.memberDto.memberManner}
                                    </div>
                                    <div>
                                        생년월일: ${memberInfo.memberDto.memberBirth}
                                    </div>
                                    <div>
                                        소개문: ${memberInfo.waitingDto.introduction}
                                    </div>
                                    <input type="hidden" name="waitingNo" value="${memberInfo.waitingDto.waitingNo}">
                                    <input type="hidden" name="teamNo" value="${memberInfo.waitingDto.teamNo}">
                                    <input type="hidden" name="memberId" value="${memberInfo.memberDto.memberId}">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" onclick="submitJoinAccept(this)">수락</button>
                                    <button type="button" class="btn btn-danger" onclick="rejectMember(this)">거절</button>
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
    function submitJoinAccept(button) {
        var form = button.closest('form');
        var teamNoInput = button.closest('.modal-content').querySelector('input[name="teamNo"]');
        var memberIdInput = button.closest('.modal-content').querySelector('input[name="memberId"]');

        if (form && teamNoInput && memberIdInput) {
            form.action = 'joinAccept';
            form.innerHTML = '';
            form.appendChild(teamNoInput.cloneNode());
            form.appendChild(memberIdInput.cloneNode());
            form.submit();
        }
    }
   
	//가입 거절
    function rejectMember(button) {
        var form = button.closest('form');
        var teamNoInput = button.closest('.modal-content').querySelector('input[name="teamNo"]');
        var memberIdInput = button.closest('.modal-content').querySelector('input[name="memberId"]');

        if (form && teamNoInput && memberIdInput) {
            form.action = 'joinReject';
            form.innerHTML = '';
            form.appendChild(teamNoInput.cloneNode());
            form.appendChild(memberIdInput.cloneNode());
            form.submit();
        }
    }
</script>