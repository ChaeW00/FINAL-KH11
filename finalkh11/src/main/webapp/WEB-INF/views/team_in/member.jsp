<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/sandstone/bootstrap.min.css" rel="stylesheet" >

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
    <div style="font-size:20px;" class="mb-2">총 멤버 : ${teamMemberInfo.size()}명</div>
    <c:forEach var="teamMember" items="${teamMemberInfo}" varStatus="status">
    <%-- 검색어가 존재할 경우에만 해당 멤버를 표시하도록 조건 추가 --%>
    <c:if test="${empty keyword or teamMember.memberDto.memberName eq keyword}">
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
                            </div>
                            <div>
                                이름: ${teamMember.memberDto.memberName}
                            </div>
                            <div>
                                성별: ${teamMember.memberDto.memberGender}
                            </div>
                            <div>
                                매너온도: ${teamMember.memberDto.memberManner}
                            </div>
                            <div>
                                생년월일: ${teamMember.memberDto.memberBirth}
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
    // 모달창 클릭 시 정보 확인
    function showMemberModal(index) {
        $("#teamMember-info-" + index).modal("show");
    }

    // 검색 버튼 클릭 시 검색 실행
    $(function(){
        $(".btn-search-member-submit").click(function(){
            var keyword = $(".input-search-member").val();
            var form = $("<form>").attr("method", "get").attr("action", "<c:url value='/team_in/member/${teamNo}'/>");
            var input_keyword = $("<input>").attr("type", "hidden").attr("name", "keyword").attr("value", keyword);
            form.append(input_keyword);
            $("body").append(form);
            form.submit();
        });
    });
</script>
