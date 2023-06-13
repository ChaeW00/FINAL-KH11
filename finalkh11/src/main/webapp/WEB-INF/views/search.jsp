<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.container.main-content {
	  min-height: 500px; /* 여기에 원하는 최소 높이 값을 입력하세요 */
	}
	a {
		color: #0984e3;
		text-decoration-line: none;
	}
</style>

<div class="container main-content" style="margin-bottom: 151px;">
	<c:if test="${searchList.size() > 0}">
		<div class="row" style="margin-top:75px;">
			<h4>통합 검색 결과 : ${searchList.size()}건</h4>
		</div>
		<div class="row p-4">
	
		<table class="table table-striped table-hover">
		    <thead>
		        <tr class="bg-dark text-light">
		            <th class="w-25">구장 이름</th>
		            <th>도시</th>
		            <th>지역</th>
		            <th>전체 주소</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach var="searchVO" items="${searchList}">
		            <tr>
		                <c:choose>
		                    <c:when test="${not empty searchVO.groundDto.groundBasicAddr}">
		                        <td>
			                        <a href="/ground/detail?groundNo=${searchVO.groundDto.groundNo}">
			                        ${searchVO.groundDto.groundName}
			                    	</a>
		                    	</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.groundDto.groundBasicAddr}">
		                        <td>${searchVO.groundDto.groundBasicAddr}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.groundDto.groundDetailAddr}">
		                        <td>${searchVO.groundDto.groundDetailAddr}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.groundDto.groundAddr}">
		                        <td>${searchVO.groundDto.groundAddr}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>
		
		</div>
		
		<hr class="ms-3 me-3">
		
		<div class="row p-4">
		
		<table class="table table-striped table-hover">
		    <thead>
		        <tr class="bg-dark text-light">
		            <th>팀 이름</th>
		            <th>활동 요일</th>
		            <th>도시</th>
		            <th>지역</th>
		            <th>성별</th>
		            <th>나이대</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach var="searchVO" items="${searchList}">
		            <tr>
		                <c:choose>
		                    <c:when test="${not empty searchVO.teamDto.teamName}">
		                        <td>${searchVO.teamDto.teamName}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.teamDto.teamDay}">
		                        <td>${searchVO.teamDto.teamDay}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.teamDto.teamCity}">
		                        <td>${searchVO.teamDto.teamCity}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.teamDto.teamLocation}">
		                        <td>${searchVO.teamDto.teamLocation}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.teamDto.teamGender}">
		                        <td>${searchVO.teamDto.teamGender}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		                <c:choose>
		                    <c:when test="${not empty searchVO.teamDto.teamAge}">
		                        <td>${searchVO.teamDto.teamAge}</td>
		                    </c:when>
		                    <c:otherwise>
		                    </c:otherwise>
		                </c:choose>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>
		</div>
	</c:if>
	
	<c:if test="${searchList.size() == 0}">
		<div class="row text-center" style="margin-top:150px;">
			<div>
				<img src="${pageContext.request.contextPath}/static/image/search.png" width=150px; height=150px;>
			</div>
			<div class="mt-4">
				<h3 class="text-primary">' ${keyword} '에 대한 검색결과가 없습니다.</h3>
			</div>
			<div class="mt-3">
				<h4 class="text-secondary">다른 검색어를 입력하시거나 철자와 띄어쓰기를 확인해 보세요.</h4>
			</div>
		</div>
	</c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>