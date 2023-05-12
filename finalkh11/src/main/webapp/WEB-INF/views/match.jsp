<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/cosmo/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    
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
      </style>

    <div class="container-fluid mt-4">

        <div class="row">
            <div class="offset-md-2 col-md-8">

                <!-- 슬라이드 (slide) -->
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="https://via.placeholder.com/940x320?text=1" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://via.placeholder.com/940x320?text=2" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://via.placeholder.com/940x320?text=3" class="d-block w-100" alt="...">
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
  
  				<a href="/match/write">글쓰기</a>
    
    			 <div class="slider"></div>
    
    			<div class="row mt-4">
                    <div class="col">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>매치 시간</th>
                                    <th>매치 정보</th>
                                    <th>매치 상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
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
    var dates = []; // 날짜 데이터 배열

    // 현재 날짜 생성
    var currentDate = new Date();

    // 2주일 후의 날짜 계산
    for (var i = 0; i < 14; i++) {
      var newDate = new Date(currentDate.getTime() + i * 24 * 60 * 60 * 1000);
      var formattedDate =
        newDate.getFullYear() +
        '-' +
        (newDate.getMonth() + 1) +
        '-' +
        newDate.getDate();
      dates.push(formattedDate);
    }

    var slider = $(".slider");

    // 날짜 데이터를 슬라이드로 변환
    for (var j = 0; j < dates.length; j++) {
      var date = $("<div class='date'>" + dates[j] + "</div>");

      var slide = $("<div>" + dates[j] + "</div>");

      slider.append(slide);
    }

    // Slick Slider 초기화
    slider.slick({
      // 슬라이더 값 변경 시 이벤트 처리
      onAfterChange: function(slider, index) {
        // 변경된 날짜 가져오기
        var selectedDate = dates[index];

        // AJAX 요청 등으로 해당 날짜에 대한 매치 정보 가져오기
        // 예시를 위해 임의로 데이터를 생성
        var matchData = [
          { time: "${matchDto.matchTime}", info: "[+ ${matchDto.matchSize} + vs + ${matchDto.matchSize} +] ${matchDto.matchTitle}", status: "${matchDto.matchStatus}" },
        ];

        // 테이블 내용 초기화
        var tableBody = $(".table tbody");
        tableBody.empty();

        // 매치 정보 테이블에 추가
        matchData.forEach(function(match) {
          var row =
            "<tr>" +
            "<td>" +
            match.time +
            "</td>" +
            "<td>" +
            match.info +
            "</td>" +
            "<td>" +
            match.status +
            "</td>" +
            "</tr>";
          tableBody.append(row);
        });
      }
    });
  });
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>