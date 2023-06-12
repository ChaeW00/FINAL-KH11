<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- header --%>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"> --%>
<%--     <jsp:param value="${teamVO.getTeamName()}" name="title"/> --%>
<%-- </jsp:include> --%>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>
<style>
    body {
<<<<<<< HEAD
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
=======
        background-color: #F5F5F5;	
    }
    .div-team-info,
    .div-member-info-list,
    .div-right-side,
    .div-search-member-input {
        border-radius: 15px;
    }

    .team-profile {
        width: 100px;
        height: 300px;
        border-radius: 15px;
    }
    .pagination {
        justify-content: center
    }

    #crown {
        width: 20px;
    }
    .member-search {
        margin-right: 1.8em;
        background-color: transparent;
    }
    .btn-join {
        display: none;
    }
    .profile-img {
        width: 60px;
        height: 60px;
        border-radius: 50%;
>>>>>>> branch 'cw0510' of https://github.com/ChaeW00/FINAL-KH11.git
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.bundle.min.js"></script>

<!-- 아이콘 CDN -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<!-- bootswatch cdn -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >

<div class="container-fluid mt-2 mb-2">
    <div class="row">
        <div class="col-8 offset-2">
            <div class="row">
                <%-- 왼쪽 사이드바 --%>
                <div class="col-3">
<<<<<<< HEAD
                    <jsp:include page="/WEB-INF/views/template/left_side.jsp"></jsp:include>
                </div>
                <%-- 가운데 내용 --%>
                <div class="col-6">
                    <div class="row">
                        <div class="col">
                            <div class="d-flex px-3 py-2 mb-2 shadow div-search-member-input search-bar bg-white">
                                <input class="flex-fill input-search-member search-box" type="text" placeholder="회원 검색" value="${keyword}">
                                <button class="btn-search-member-submit header-btn member-search" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
<div class="shadow div-member-info-list p-3" style="background-color:white;">
    <div style="font-size:20px;" class="mb-2">총 멤버 : ${teamMemberInfo.size()}명</div>
<c:forEach var="teamMember" items="${teamMemberInfo}" varStatus="status">
    <%-- 검색어가 존재하지 않거나, 검색어가 존재할 때 해당 멤버를 표시하도록 조건 추가 --%>
    <c:if test="${empty keyword or fn:contains(teamMember.memberDto.memberName, keyword) or fn:contains(teamMember.memberDto.memberId, keyword)}">
        <div id="teamMember-${status.index}" class="mt-2" onclick="showMemberModal(${status.index})">
            ${teamMember.memberDto.memberName} (${teamMember.teamMemberDto.teamMemberLevel})
            <a href="kick?teamMemberNo=${teamMember.teamMemberDto.teamMemberNo}&teamNo=${teamNo}" 
                onclick="return confirm('정말 탈퇴시키겠습니까?')">추방</a>
        </div>
        <hr>
        
        <div class="mb-2 div-member-info" id="teamMember-${status.index}">
            <div class="modal" tabindex="-1" role="dialog" id="teamMember-info-${status.index}" data-bs-backdrop="static">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">${teamMember.memberDto.memberName} (${teamMember.memberDto.memberId}) 상세 정보</h5>
                        </div>
                        <div class="modal-body">
                            <div class="mb-2">
                                <img src="${pageContext.request.contextPath}/img/download/${teamMember.memberDto.imgNo}" 
                                    onerror="this.onerror=null; this.src='/static/image/profile.png';" 
                                    class="member-profile profile-img me-2" data-writerno="${teamMember.teamMemberDto.teamMemberNo}">
=======
                    <jsp:include page="/WEB-INF/views/template/left_sideLeader.jsp"></jsp:include>
                </div>
                <%-- 가운데 내용 --%>
                <div class="col-6">
                    <div class="row">
                        <div class="col">
                            <div class="d-flex px-3 py-2 mb-2 shadow div-search-member-input search-bar bg-white">
                                <input class="flex-fill input-search-member search-box" type="text" placeholder="회원 검색" value="${keyword}">
                                <button class="btn-search-member-submit header-btn member-search" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
>>>>>>> branch 'cw0510' of https://github.com/ChaeW00/FINAL-KH11.git
                            </div>
                            <div class="shadow div-member-info-list p-3" style="background-color: white;">
                                <div style="font-size: 20px;" class="mb-2">총 멤버 : ${teamMemberInfo.size()}명</div>
                                <c:forEach var="teamMember" items="${teamMemberInfo}" varStatus="status">
                                    <%-- 검색어가 존재하지 않거나, 검색어가 존재할 때 해당 멤버를 표시하도록 조건 추가 --%>
                                    <c:if test="${empty keyword or fn:contains(teamMember.memberDto.memberName, keyword) or fn:contains(teamMember.memberDto.memberId, keyword)}">
                                        <div id="teamMember-${status.index}" class="mt-2">
                                            ${teamMember.memberDto.memberName} (${teamMember.teamMemberDto.teamMemberLevel})
                                            <a href="kick?teamMemberNo=${teamMember.teamMemberDto.teamMemberNo}&teamNo=${teamNo}" 
                                                onclick="return confirm('정말 탈퇴시키겠습니까?')">방출</a>
											<form action="${pageContext.request.contextPath}/team_in/leaderMember/updateLevel" method="post">
											    <input type="hidden" name="teamMemberNo" value="${teamMember.teamMemberDto.teamMemberNo}">
											    <input type="hidden" name="teamNo" value="${teamDto.teamNo}">
											    <select name="teamMemberLevel">
											        <option value="일반회원" <c:if test="${teamMember.teamMemberDto.teamMemberLevel eq '일반회원'}">selected</c:if>>일반회원</option>
											        <option value="용병" <c:if test="${teamMember.teamMemberDto.teamMemberLevel eq '용병'}">selected</c:if>>용병</option>
											        <option value="팀장" <c:if test="${teamMember.teamMemberDto.teamMemberLevel eq '팀장'}">selected</c:if>>팀장</option>
											    </select>
											    <button type="submit">변경</button>
											</form>
                                        </div>
                                        <hr>
                                    </c:if>
                                </c:forEach>
                            </div>
<<<<<<< HEAD
                            <div>
                                성별: ${teamMember.memberDto.memberGender}
                            </div>
                            <div>
                                매너온도: ${teamMember.memberDto.memberManner}
                            </div>
                            <div>
                                생년월일: ${teamMember.memberDto.memberBirth}
                            </div>
                            <div>
                                멤버등급: 
                                <select id="member-level-${status.index}" onchange="changeMemberLevel(${teamMember.teamMemberDto.teamMemberNo}, this.value)">
                                    <option value="팀장" <c:if test="${teamMember.teamMemberDto.teamMemberLevel eq '팀장'}">selected</c:if>>팀장</option>
                                    <option value="일반회원" <c:if test="${teamMember.teamMemberDto.teamMemberLevel eq '일반회원'}">selected</c:if>>일반회원</option>
                                    <option value="용병" <c:if test="${teamMember.teamMemberDto.teamMemberLevel eq '용병'}">selected</c:if>>용병</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
=======
>>>>>>> branch 'cw0510' of https://github.com/ChaeW00/FINAL-KH11.git
                        </div>
                    </div>
                </div>
            </div>
        </div>
<<<<<<< HEAD
        </c:if>
</c:forEach>


                        </div>
                    </div>
                </div>
            </div>
        </div>
=======
>>>>>>> branch 'cw0510' of https://github.com/ChaeW00/FINAL-KH11.git
    </div>
</div>

<script>
<<<<<<< HEAD
    // 모달창 클릭 시 정보 확인
    function showMemberModal(index) {
        $("#teamMember-info-" + index).modal("show");
    }

    // 멤버 등급 변경
function changeMemberLevel(teamMemberNo, teamMemberLevel) {
    $.ajax({
        url: "/team_in/member/updateLevel",
        type: "POST",
        data: { teamMemberNo: teamMemberNo, teamMemberLevel: teamMemberLevel },
        success: function(response) {
            // 성공적으로 처리된 경우
            if (response.success) {
                // 페이지 리로드
                location.reload();
            } else {
                // 처리 실패 시 메시지 출력 또는 예외 처리
                console.log(response.message);
            }
        },
        error: function(xhr, status, error) {
            console.log(error);
        }
    });
}

=======
>>>>>>> branch 'cw0510' of https://github.com/ChaeW00/FINAL-KH11.git
    // 검색 버튼 클릭 시 검색 실행
    $(function(){
        $(".btn-search-member-submit").click(function(){
            var keyword = $(".input-search-member").val();
            var form = $("<form>").attr("method", "get").attr("action", "<c:url value='/team_in/leaderMember/${teamNo}'/>");
            var input_keyword = $("<input>").attr("type", "hidden").attr("name", "keyword").attr("value", keyword);
            form.append(input_keyword);
            $("body").append(form);
            form.submit();
        });
    });

    // 팀 멤버 레벨 업데이트
    function updateTeamMemberLevel(index) {
        $("#updateForm-" + index).submit();
    }
</script>
	