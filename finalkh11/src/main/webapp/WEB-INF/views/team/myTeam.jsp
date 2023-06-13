<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="my Team" name="title"/>
</jsp:include>
<div class = "container-fluid mt-3">
	<div>
		<div class = "col-8 offset-2 main-content">
			<div>
				<div class=" mt-4">
					<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 rounded">
							<h1 class="text-center">My Team</h1>	
						</div>
					</div>
				</div>
	
						 <div class=" mt-4 mb-3">
				            <div class="col-md-10 offset-md-1">
				                <table class="table table-hover">
				                    <thead class="text-center">
						                <tr>
						                    <th scope="col">#</th>
						                    <th scope="col">팀 번호</th>
						                    <th scope="col">팀 이름</th>
						                    <th scope="col">팀 지역</th>
						                    <th scope="col">팀 리더</th>
						                    <th scope="col">회원 수</th>
						                </tr>
				                    </thead>
				                    <tbody class="text-center" >
				                        <c:forEach items="${teams}" var="team" varStatus="status">
											<tr>
												<th scope="row">${status.count}</th>
												<td>${team.teamNo}</td>
												<td>
													<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 -->
				 									<a href="${pageContext.request.contextPath}/team_in/member/${team.teamNo}">
														${team.teamName}
													</a>
												</td>
												<td>${team.teamCity}</td>
<%-- 												<td>${myTeam.teamCnt}</td> --%>
												<td>${team.teamLeaderName}</td>
												<td>${team.teamMemberCount}</td>
											</tr>
										</c:forEach>
									</tbody>
				                </table>
				            </div>
				        </div>
			</div>
		</div>
	</div>
</div>
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
