<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원목록</title>

    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- bootswatch cdn-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
    
    
    <style>
        
        .top-50 {
            top: 45%!important;
        }
        a{
            text-decoration-line: none;
        }


    </style>

</head>
<body>
    <div class="jcontainer">
        <div class="container-fluid mt-4">
            <div class="row">
                <div class="offset-md-2 col-md-8">
                     <!-- 문서 제목 (Jumbotron)-->
                    <div class="row text-center">
                        <div class="col">
                            <h2>회원 목록</h2>
                        </div>
                    <div>
                    
                    <div class="row center">
            	<c:choose>
		<c:when test="${column == null}">
			<h1>학생 목록</h1>
		</c:when>
		<c:otherwise>
			<h1>학생 검색</h1>
		</c:otherwise>
	</c:choose>
        </div>
        <form action="admin/member/list" method="get">
           <div class="row" style="display: flex; justify-content: center;">
                <input type="text" name="keyword" placeholder="검색할 학생명" class="form-input w-40">
                <button type="submit" class="form-btn positive">검색</button>
           </div>
        </form>
        
        <c:choose>
		<c:when test="${list.isEmpty()}">
			<h2>데이터가 존재하지 않습니다</h2>
		</c:when>
		<c:otherwise>
                    

                    <div class="row">
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
                                            <a href="edit?memberId=${memberDto.memberId}">탈퇴</a>
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
        	</c:otherwise>
	</c:choose>
    </div>

    <!-- 부트스트랩 cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>    
    
    <!-- Axios(비동기) CDN -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <!--Lodash cdn-->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

    
</body>
</html>



