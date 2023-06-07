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
		  color: black;
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
                
 <div class="container-fluid mt-6">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators" >
	<c:forEach var="mainImg" items="${mainImgList}" varStatus="status">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}"<c:if test="${status.index == 0}"> class="active" aria-current="true"</c:if> aria-label="Slide ${status.index + 1}"></button>
	</c:forEach>
  </div>
  <div class="carousel-inner" style="margin-top:300px;" >
  	<c:choose>
   		<c:when test="${mainImgList.size() == 0}">
   			<div class="carousel-item active">
       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy01.png">
       		</div>
   			<div class="carousel-item">
       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy02.png">
       		</div>
			<div class="carousel-item">
       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy03.png">
       		</div>
   		</c:when>
   		<c:otherwise>
			<c:forEach var="mainImg" items="${mainImgList}" varStatus="status">
			    <div class="carousel-item<c:if test="${status.index == 0}"> active</c:if>">
			        <img src="/img/download/${mainImg.imgDto.imgNo}" class="slide-img" alt="메인 슬라이드 이미지">
			        <!-- 경로를 저렇게 쓴 이유는 imgRestController에 내가 //다운로드 (이미지 미리보기를 하고싶으면 작성해야하는 코드)
			@GetMapping("/download/{imgNo}") 이렇게 적었기 때문 -->
			    </div>
			</c:forEach>
   		</c:otherwise>
       </c:choose>
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
</div>		        <!-- 이미지 슬라이드 end -->
		
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