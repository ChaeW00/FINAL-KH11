<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- header --%>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"> --%>
<%--     <jsp:param value="${teamDto.teamName}" name="title"/> --%>
<%-- </jsp:include> --%>

<style>
    body {
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
        justify-content: center;
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
    }
</style>
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
                                <button class="btn-search-member-submit header-btn member-search" type="button">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                            <div class="shadow div-member-info-list p-3" style="background-color: white;">
                                <div style="font-size: 20px;" class="mb-2">총 멤버 : ${teamDto.teamMemberCount}</div>
                                <c:forEach var="teamMember" items="${teamMemberList}">
                                    <div class="mb-2 div-member-info">
                                        <img src="${pageContext.request.contextPath}/img/download/${teamMember.imgNo}" onerror="this.onerror=null; this.src='/static/image/profile.png';" class="member-profile profile-img me-2" data-writerno="${teamMember.teamMemberNo}">
                                        ${teamMember.teamMemberName} (${teamMember.teamMemberLevel})
                                        <hr>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- 오른쪽 사이드바 --%>
                <div class="col-3">
                    <div class="row">
                        <div class="div-right-side p-3 shadow bg-white">
                            <div style="height: 43px;">
                                다가오는 일정
                                <hr>
                            </div>
                            <div>
                                <c:forEach var="plan" items="${planListRownum}">
                                    <div style="margin-bottom: 10px;">
                                        <span style="font-size: 20px;">${plan.planTitle}</span>
                                        <br>
                                        <span style="font-size: 12px;">
                                            ${fn:substring(plan.planStart, 2, 4)}년 ${fn:substring(plan.planStart, 5, 7)}월 ${fn:substring(plan.planStart, 8, 10)}일 ${fn:substring(plan.planStart, 11, 16)}
                                        </span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var teamNo = $(".div-member-info").data("data-teamno");
    // 초기 검색시 조회되는 페이지를 1페이지로
    var p = 1;

    // 검색 버튼을 누를 때 검색 실행
    $(function() {
        $(".btn-search-member-submit").click(function() {
            // 검색창의 문자열을 변수로 지정
            var keyword = $(".input-search-member").val();
            console.log(keyword);
            var form = $("<form>").attr("method", "get").attr("action", "member");
            var input_keyword = $("<input>")
                .attr("type", "hidden")
                .attr("name", "keyword")
                .attr("value", keyword);
            var input_p = $("<input>").attr("type", "hidden").attr("name", "p").attr("value", p);
            form.append(input_keyword).append(input_p);
            $("body").append(form);
            form.submit();
        });
    });
</script>
