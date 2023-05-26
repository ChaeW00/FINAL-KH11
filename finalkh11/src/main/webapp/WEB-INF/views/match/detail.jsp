<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/cosmo/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
    	.box {
    		border: 1px solid;
    	}
    	
    	.panel {
    		text-align: center;
    	}
    	
    </style>
    
<div class="container-fluid mt-4">
	<div class="row">
		<div class="offset-md-2 col-md-8">
			<div class="row">
				<h2>${matchDto.matchTitle} (${matchDto.matchAge}대 , ${matchDto.matchSize}vs${matchDto.matchSize}) 
				<fmt:formatDate value="${matchDto.matchDate}" pattern="y년 M월 d일"/> ${matchDto.matchTime}</h2>
				<h4>${matchDto.memberId}</h4>
			</div>

    		<!-- 추가된 코드 -->
    		<div class="row">
      			<!-- 첫 번째 구역 -->
      			<div class="col-md-4">
        			<!-- 첫 번째 구역의 내용 -->
        			<h3 class="panel">Home Team</h3>
        			<div class="box">
    					<ul>
  							<c:forEach items="${homeTeams}" var="homeTeam">
    							<li>${homeTeam}</li>
  							</c:forEach>
						</ul>
					</div>
      			</div>
      		
      			<!-- 두번째 구역 -->
      			<div class="col-md-4">
      				<h3 class="panel">대기실</h3>
      				<div class="box">
      					<ul>
        					
        				</ul>
      				</div>
      			</div>
      		
      			<!-- 세 번째 구역 -->
      			<div class="col-md-4">
        			<!-- 세 번째 구역의 내용 -->
        			<h3 class="panel">Away Team</h3>
        			<div class="box">
        				<ul>
        					
        				</ul>
        			</div>
      			</div>
    		</div>
    		<!-- /추가된 코드 -->
    		
    		<c:if test="${matchDto.matchStatus == '모집마감'}">
    		<!-- 추가된 코드 2 -->
    		<div class="row">
      			<!-- 첫 번째 구역 -->
      			<div class="col-md-4">
        			<!-- 첫 번째 구역의 내용 -->
        			<h3 class="panel">Home Team</h3>
        			<div class="box">
        				<ul>
        					
        				</ul>
        			</div>
      			</div>
      		
      		
      			<div class="col-md-4">
      				<div class="row">
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel">점수</h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel"></h5>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel">Home</h5>
      					</div>
      					<div class="col-md-4">
      						<h1 class="panel">0:0</h1>
      					</div>
      					<div class="col-md-4">
      						<h5 class="panel">Away</h5>
      					</div>
      				</div>
      			</div>
      		
      				<!-- 세 번째 구역 -->
      				<div class="col-md-4">
        				<!-- 세 번째 구역의 내용 -->
        				<h3 class="panel">Away Team</h3>
        				<div class="box">
        					<ul>
        						
        					</ul>
        				</div>
      				</div>
    			</div>
    		</div>
    		<!-- /추가된 코드 2 -->
    		</c:if>
  	</div>
  	<a class="btn btn-light mt-2" href="/match">목록보기</a>
</div>

