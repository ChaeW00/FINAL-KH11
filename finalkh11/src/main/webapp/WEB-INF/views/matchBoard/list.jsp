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
        .carousel-item {
          display: none;
        }
    
        .carousel-item.active {
          display: block;
        }
      	.slick-slide{
      		height: 50px;
      		justify-content: center;
      	}
      	
      	.boardInfo {
    		margin: 0;
    		padding: 0;
    		word-break: break-all;
    		display: flex;
    		justify-content: center;
    		align-items: center;
    		cursor: pointer;
		}
		
		.boardInfo2 {
    		margin: 0;
    		padding: 0;
    		word-break: break-all;
    		display: flex;
    		justify-content: center;
    		align-items: center;
		}
		
		.carousel-control-prev,
		.carousel-control-next {
		  position: absolute;
		  top: 80%;
		  transform: translateY(-50%);
		  width: 40px;
		  height: 40px;
		  background-color: rgba(0, 0, 0, 0.5);
		  border-radius: 50%;
		  color: white;
		  transition: left 0.3s, right 0.3s;
		}

		.carousel-control-prev-icon,
		.carousel-control-next-icon {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		}
		
		.carousel-control-prev {
		  left: 50%;
		  transform: translate(-1120%, -260%);
		}

		.carousel-control-next {
		  right: 50%;
		  transform: translate(1120%, -260%);
		}
      </style>
      
      <!-- 슬라이드 (slide) -->
                

    <div class="container-fluid mt-4">
		
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">

    <div class="carousel-item active">
        <img src="/static/image/google.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item active">
        <img src="/static/image/google.png" class="d-block w-100" alt="...">
    </div>
</div>

<c:choose>
    <c:when test="${mainImgList == null}">
      <div class="carousel-item active">
        <img src="/static/image/google.png" class="d-block w-100" alt="...">
    </div>
    </c:when>
    <c:otherwise>
        <c:forEach var="mainImgConnectDto" items="${mainImgList}">
            <div class="swiper-slide">
                <img alt="메인 슬라이드 이미지" class="slide-img" src="/img/download?imgNo=${mainImgConnectDto.imgNo}">
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>

         </div>
		
        <div class="row">
            <div class="offset-md-2 col-md-8">

  				<c:if test="${sessionScope.memberId != null}">
  				<a href="/matchBoard/write" class="btn btn-primary mt-2" style="float: right;">글쓰기</a>
    			</c:if>
    			 <div class="slider"></div>
    
    			<div class="row mt-4">
                    <div class="col">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><p class="boardInfo2">모집글 번호</p></th>
                                    <th><p class="boardInfo2">모집글 제목</p></th>
                                    <th><p class="boardInfo2">모집글 시간</p></th>
                                    <th><p class="boardInfo2">모집글 작성자</p></th>
                                    <th><p class="boardInfo2">모집글 조회수</p></th>
                                </tr>
                            </thead>
                            <c:forEach var="matchBoardDto" items="${list}">
                            <tbody>
                            	<tr>
                            			<td data-boardNo="${matchBoardDto.matchBoardNo}"><p class="boardInfo" style="font-weight: bold;">${matchBoardDto.matchBoardNo}</p></td>
                            			<td data-boardNo="${matchBoardDto.matchBoardNo}"><p class="boardInfo">${matchBoardDto.matchBoardTitle} (${matchBoardDto.matchBoardCity} ${matchBoardDto.matchBoardLocation} <fmt:formatDate value="${matchBoardDto.matchBoardDate}" pattern="y년 M월 d일"/> ${matchBoardDto.matchBoardTime2} ${matchBoardDto.matchBoardAge}대 ${matchBoardDto.matchBoardSize}vs${matchBoardDto.matchBoardSize}) (${matchBoardDto.matchBoardReply})</p></td>
                            			<td data-boardNo="${matchBoardDto.matchBoardNo}"><p class="boardInfo">${matchBoardDto.getMatchBoardTimeAuto()}</p></td>
                            			<td data-boardNo="${matchBoardDto.matchBoardNo}"><p class="boardInfo">${matchBoardDto.memberId}</p></td>
                            			<td data-boardNo="${matchBoardDto.matchBoardNo}"><p class="boardInfo">${matchBoardDto.matchBoardRead}</p></td>
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
	      	var matchBoardNo = $(this).attr('data-boardNo');
	      	window.location.href = "/matchBoard/detail?matchBoardNo=" + matchBoardNo;
	    	});
	  	});
   	</script>
    
<%--     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>