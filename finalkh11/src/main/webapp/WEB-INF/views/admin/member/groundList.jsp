<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!DOCTYPE html>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장 목록</title>

	<style>
		.top-50 {
		    top: 45%!important;
		}
		a {
		    text-decoration-line: none;
		}
    </style>
	
	<div class="container-fluid mt-4">
		<div class="row">
			<div class="offset-md-2 col-md-8 mt-3">
				<div class="row text-center" style="margin-top:133px;">
					<div class="col">
						<a href="groundList"><h2>구장 목록</h2></a>
					</div>
				</div>
				<!-- 검색창 -->
				<div class="row center mt-4">
					<form action="groundList" method="get" class="d-flex justify-content-center" role="search">
						<div class="col-md-1.5 me-1 text-center">
							<c:choose>
								<c:when test="${vo.column == 'ground_name'}">
									<select name="column" class="form-select">
										<option value="ground_name" selected>이름</option>
										<option value="ground_basic_addr">도시</option>
										<option value="ground_detail_addr">지역</option>
									</select>
								</c:when>
								<c:when test="${vo.column == 'ground_basic_addr'}">
									<select name="column" class="form-select">
										<option value="ground_name">이름</option>
										<option value="ground_basic_addr" selected>도시</option>
										<option value="ground_detail_addr">지역</option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="column" class="form-select">
										<option value="ground_name" selected>이름</option>
										<option value="ground_basic_addr">도시</option>
										<option value="ground_detail_addr" selected>지역</option>
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
					<div class="row mt-4">
						<div class="col">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>이름</th>
										<th>도시</th>
										<th>지역</th>
										<th>주소</th>
										<th>가격</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="groundDto" items="${list}">
										<tr>
											<td>${groundDto.groundName}</td>
											<td>${groundDto.groundBasicAddr}</td>
											<td>${groundDto.groundDetailAddr}</td>
											<td>${groundDto.groundAddr}</td>
											<td>${groundDto.groundPrice}</td>
											<td>
												<a href="../../../ground/detail?groundNo=${groundDto.groundNo}">상세</a>
												<a href="../../../ground/edit/${groundDto.groundNo}">수정</a>
												<a href="groundDelete?groundNo=${groundDto.groundNo}&page=${page}" 
													onclick="return confirm('정말 삭제하시겠습니까?')">삭제
												</a>
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
										<a class="page-link" href="groundList?${vo.parameter}&page=1">&laquo;</a>
									</c:otherwise>
									</c:choose>
								</li>
								<c:choose>
									<c:when test="${vo.prev}">
										<li class="page-item"><a class="page-link" href="groundList?${vo.parameter}&page=${vo.prevPage}">&lt;</a></li>
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
											<li class="page-item"><a class="page-link" href="groundList?${vo.parameter}&page=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
									<c:choose>
										<c:when test="${vo.next}">
											<li class="page-item"><a class="page-link" href="groundList?${vo.parameter}&page=${vo.nextPage}">&gt;</a></li>
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
											<a class="page-link" href="groundList?${vo.parameter}&page=${vo.totalPage}">&raquo;</a>
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
		<c:if test="${list.isEmpty()}">
			<div class="d-flex justify-content-center align-items-center">
				<h3 class="text-center mt-4">검색 결과가 없습니다.</h3>
			</div>
		</c:if>