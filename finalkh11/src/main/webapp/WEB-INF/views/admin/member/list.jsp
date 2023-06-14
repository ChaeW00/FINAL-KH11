<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<!-- 폰트 css -->
	<link rel="stylesheet" type="text/css" href="/static/css/font.css">
	
    <style>
        
        .top-50 {
            top: 45%!important;
        }
        a {
            text-decoration-line: none;
        } 
    </style>
    
    <title>회원목록</title>
   
</head>
<body>
<div class="container-fluid mt-4">
  <div class="row main-content">
    <div class="offset-md-2 col-md-8 mt-3">
      <!-- 문서 제목 (Jumbotron)-->
      <div class="row text-center">
          <div class="col">
            <a href="list"><h2>회원 목록</h2></a>
          </div>
      </div>
        <!-- 검색창 -->
        <div class="row center mt-4">
          <form action="list" method="get" class="d-flex justify-content-center" role="search">
			<div class="col-md-1.5 me-1 text-center">
	           <c:choose>
	              <c:when test="${vo.column == 'member_id'}">
	                 <select name="column" class="form-select">
	                      <option value="member_id" selected>아이디</option>
	                       <option value="member_name">이름</option>
	                       <option value="member_level">등급</option>
	                   </select>
	                </c:when>
	                <c:when test="${vo.column == 'member_name'}">
	                   <select name="column" class="form-select">
	                      <option value="member_id">아이디</option>
	               <option value="member_name" selected>이름</option>
	                       <option value="member_level">등급</option>
	                   </select>
	                </c:when>
	                <c:otherwise>
	                   <select name="column" class="form-select">
	                      <option value="member_id">아이디</option>
	               <option value="member_name">이름</option>
	                       <option value="member_level"	selected>등급</option>
	                   </select>
	                </c:otherwise>
	            </c:choose>
            </div>
            <div class="col-md-4 me-3 text-center">
				<input type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요." value="${vo.keyword}" required>
			</div>
			<div class="d-flex justify-content-center col-md-1 text-center">
				<button type="submit" class="btn btn-outline-success w-100">검색</button>
			</div>
          </form>
       </div>
       <c:if test="${!list.isEmpty()}">
          <div class="row mt-3">
            <div class="col">
              <table class="table table-hover">
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>등급</th>
                        <th>이메일</th>
                        <th>생년월일</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="memberDto" items="${list}">
                    <tr>
                        <td>${memberDto.memberId}</td>
                        <td>${memberDto.memberName}</td>
                        <td>${memberDto.memberLevel}</td>
                        <td>${memberDto.memberEmail}</td>
                        <td>${memberDto.memberBirth}</td>
                        <td>
                            <a href="detail?memberId=${memberDto.memberId}">상세</a>
                            <a href="edit?memberId=${memberDto.memberId}">수정</a>
                            <a href="delete?memberId=${memberDto.memberId}&page=${page}" onclick="return confirm('정말 탈퇴시키겠습니까?')">탈퇴</a>

                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
              </table>
            </div>
          </div>

        <div class="row mt-4">
          <div class="col d-flex justify-content-center align-items-center">
            <ul class="pagination">
              <li class="page-item ${vo.first ? 'disabled' : ''}">
                <c:choose>
                  <c:when test="${vo.first}">
                    <a class="page-link" href="#">&laquo;</a>
                  </c:when>
                  <c:otherwise>
                    <a class="page-link" href="list?${vo.parameter}&page=1">&laquo;</a>
                  </c:otherwise>
                </c:choose>
              </li>
              
              <c:choose>
                <c:when test="${vo.prev}">
                  <li class="page-item"><a class="page-link" href="list?${vo.parameter}&page=${vo.prevPage}">&lt;</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                </c:otherwise>
              </c:choose>
              
              <c:forEach var="i" begin="${vo.startBlock}" end="${vo.finishBlock}">
                <c:choose>
                  <c:when test="${vo.page == i}">
                    <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item"><a class="page-link" href="list?${vo.parameter}&page=${i}">${i}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              
              <c:choose>
                <c:when test="${vo.next}">
                  <li class="page-item"><a class="page-link" href="list?${vo.parameter}&page=${vo.nextPage}">&gt;</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                </c:otherwise>
              </c:choose>
              
              <li class="page-item ${vo.last ? 'disabled' : ''}">
                <c:choose>
                  <c:when test="${vo.last}">
                    <a class="page-link" href="#">&raquo;</a>
                  </c:when>
                  <c:otherwise>
                    <a class="page-link" href="list?${vo.parameter}&page=${vo.totalPage}">&raquo;</a>
                  </c:otherwise>
                </c:choose>
              </li>
            </ul>
          </div>
        </div>
     </div>
    </div>  
  </div>
  </c:if>
  </div>
      <c:choose>
        <c:when test="${list.isEmpty()}">
			<div class="d-flex justify-content-center align-items-center">
				<h3 class="text-center mt-4">검색 결과가 없습니다.</h3>
			</div>
			<div class="d-flex justify-content-center align-items-center">
				<h3 class="text-center mt-4">검색 결과가 없습니다.</h3>
			</div>
        </c:when>
        <c:otherwise>

        </c:otherwise>
      </c:choose>
</div>

</body>
</html>