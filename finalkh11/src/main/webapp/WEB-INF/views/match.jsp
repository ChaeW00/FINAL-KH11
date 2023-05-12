<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    
    
     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/cosmo/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    
    <style>
.carousel-item img {
  max-width: 50%;
  height: auto;
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top: 12%;
}
</style>
    
    <style>
        .carousel-item {
          display: none;
        }
    
        .carousel-item.active {
          display: block;
        }
      </style>
      <style>
      	.slick-slide{
      	height: 50px;
      	justify-content: center;
      	}
      	
      	.matchInfo {
    		margin: 0;
    		padding: 0;
    		word-break: break-all;
    		display: flex;
    		justify-content: center;
    		align-items: center;
		}
      </style>
      
      <!-- 슬라이드 (slide) -->
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="https://via.placeholder.com/200x100?text=1" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://via.placeholder.com/200x100?text=2" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://via.placeholder.com/200x100?text=3" class="d-block w-100" alt="...">
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>

    <div class="container-fluid mt-4">

        <div class="row">
            <div class="offset-md-2 col-md-8">

  
  				<a href="/match/write" class="btn btn-primary mt-2" style="float: right;">글쓰기</a>
    
    			 <div class="slider"></div>
    
    			<div class="row mt-4">
                    <div class="col">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><p class="matchInfo">매치 시간</p></th>
                                    <th><p class="matchInfo">매치 정보</p></th>
                                    <th><p class="matchInfo">매치 상태</p></th>
                                </tr>
                            </thead>
                            <c:forEach var="matchDto" items="${list}">
                            <tbody>
                            	<tr>
                            			<td data-matchNo="${matchDto.matchNo}"><p class="matchInfo" style="font-weight: bold;">${matchDto.matchTime}</p></td>
                            			<td data-matchNo="${matchDto.matchNo}"><p class="matchInfo">[${matchDto.matchSize}vs${matchDto.matchSize}] ${matchDto.matchTitle}</p></td>
                            			<td data-matchNo="${matchDto.matchNo}"><p class="matchInfo">${matchDto.matchStatus}<p></td>
                            	</tr>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
  
  
        </div>
      </div>
    </div>
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<script>
		$(function() {
	    	$('td').click(function() {
	      	var matchNo = $(this).attr('data-matchNo');
	      	window.location.href = "/match/detail?matchNo=" + matchNo;
	    	});
	  	});
   	</script>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>