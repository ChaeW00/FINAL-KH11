<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="my Team" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3 main-content">
	<div class = "">
		<div class = "col-8 offset-2 main">
			<div class = "">

				<div class=" mt-4">
					<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 rounded">
							<h1 class="text-center">My Team</h1>	
						</div>
					</div>
				</div>
				
					<div class="p-4 rounded">
						<h1 class="text-center">가입한 팀이 없습니다.</h1>	
					</div>

				<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mb-4">
					<div class=" col" >
						<a href="/matchBoard/list" style="background-color : #E6E6E6; margin-bottom: 219px; color:#3E4684;" class="btn w-100" role="button">홈으로 이동</a>
					</div>
				</div>		
			</div>
		</div>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>