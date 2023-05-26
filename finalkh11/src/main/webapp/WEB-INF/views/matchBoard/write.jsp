<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/lumen/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
    <style>
	
    </style>
    
    <form action="write" method="post" autocomplete="off">
        <div class="container mt-5">
        <div class="row">
            <div class="offset-md-2 col-md-8">
            <!-- 문서 제목 (Jumbotron) -->
            <div class="row text-center">
                <div class="col bg-dark text-light p-4 rounded" style="margin-top:25%;">
                <h1>매칭 생성</h1>
                </div>
            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-2">
                    <label for="inputTitle" class="form-label">제목 : </label>
                </div>
                <div class="col-md-8">   
                    <input type="text" class="form-control" id="inputTitle" name="matchBoardTitle">
                </div>
            </div>
            <div class="row align-items-center mt-5">
				<div class="col-md-2">
					<label class="form-label w-100">말머리</label>
				</div>
				<div class="col-md-8">
					<input name="matchBoardHead" class="form-control" value="모집글" readonly>
					<c:if test="${memberLevel == '관리자'}">
						<select name="matchBoardHead" class="form-select">
							<option value="모집글">모집글</option>
							<option value="공지">공지</option>
						</select>
					</c:if>
				</div>
			</div>
            
            <div class="row align-items-center mt-5">
                <div class="col-md-5">
                    <label for="selectLocation">지역 선택 : </label>
                </div>
                <div class="col-md-5">
                    <select name="matchBoardLocation" id="selectLocation" class="form-select">
                        <option value="서울">서울</option>
                        <option value="부산">부산</option>
                        <option value="대구">대구</option>
                        <option value="인천">인천</option>
                        <option value="광주">광주</option>
                        <option value="대전">대전</option>
                        <option value="울산">울산</option>
                        <option value="세종">세종</option>
                        <option value="경기">경기</option>
                        <option value="강원">강원</option>
                        <option value="충북">충북</option>
                        <option value="충남">충남</option>
                        <option value="전북">전북</option>
                        <option value="전남">전남</option>
                        <option value="경북">경북</option>
                        <option value="경남">경남</option>
                        <option value="제주">제주</option>
                    </select>
                </div>

            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-5">
                    <label for="selectCity">도시 선택 : </label>
                </div>
                <div class="col-md-5">
                    <select name="matchBoardCity" id="selectCity" class="form-select">

                    </select>
                </div>
            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-3">
                    <label for="inputDate">매치 날짜 : </label>
                </div>
                <div class="col-md-7">
                    <input type="Date" id="inputDate" class="form-control" name="matchBoardDate">
                </div>
            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-3">
                    <label for="inputTime">매치 시간 : </label>
                </div>
                <div class="col-md-7">
                    <input type="text" id="inputTime" name="matchBoardTime2" class="form-select">
                </div>
            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-3">
                    <label for="selectAge">매치 연령대 : </label>
                </div>
                <div class="col-md-7">
                    <select name="matchBoardAge" id="selectAge" class="form-select">
                        <option value="10">10 ~ 19</option>
                        <option value="20">20 ~ 29</option>
                        <option value="30">30 ~ 39</option>
                        <option value="40">40 ~ 49</option>
                        <option value="50">50 ~ 59</option>
                        <option value="60">60 ~ 69</option>
                    </select>
                </div>
            </div>
            <div class="row align-items-center mt-5">
    			<div class="col-md-3">
        			<label for="selectSize">매치 인원 : </label>
    			</div>
    			<div class="col-md-7">
        			<select name="matchBoardSize" id="selectSize" class="form-select">
        				<option value="" default>선택하세요</option>
            			<option value="1">1 vs 1</option>
            			<option value="2">2 vs 2</option>
            			<option value="3">3 vs 3</option>
            			<option value="4">4 vs 4</option>
            			<option value="5">5 vs 5</option>
        			</select>
    			</div>
			</div>
			<div id="inputContainer" class="row align-items-center mt-5">
    			<div class="col-md-6 mt-4">
<!--         			<label for="homeTeam1">HomeTeam 1 : </label> -->
<!--         			<input type="text" id="homeTeam1" name="homeTeam1" class="form-control" required> -->
    			</div>
			</div>
			
			<div class="row align-items-center mt-5">
				<div class="col-md-3">
					<label>내용<i class="fa-solid fa-asterisk"></i></label>
				</div>
				<div class="col-md-7">
					<textarea name="matchBoardContent" id="matchBoardContent" required class="form-control w-100" style="min-height: 300px;"></textarea>
				</div>
		</div>
            
            <div class="row align-items-center mt-5">
                <button type="submit" class="btn btn-primary">완료</button>
            </div>
            <div class="row align-items-center mt-2 mb-5">
                <a href="/match" class="btn btn-secondary">목록으로</a>
            </div>

            </div>
        </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.18/jquery.timepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    
    <script>
        $(function(){
            $("#selectLocation").change(function(){
                var selectedLocation = $(this).val();
                var selectCity = $("#selectCity");

                selectCity.empty();

                if(selectedLocation == "서울"){
                    selectCity.append('<option value="종로구">종로구</option>');
                    selectCity.append('<option value="중구">중구</option>');
                    selectCity.append('<option value="용산구">용산구</option>');
                }
                else if(selectedLocation == "부산"){
                    selectCity.append('<option value="중구">중구</option>');
                    selectCity.append('<option value="서구">서구</option>');
                    selectCity.append('<option value="동구">동구</option>');
                }
                else if(selectedLocation == "대구"){
                    selectCity.append('<option value="중구">중구</option>');
                    selectCity.append('<option value="동구">동구</option>');
                    selectCity.append('<option value="서구">서구</option>');
                }
                else if(selectedLocation == "인천"){
                    selectCity.append('<option value="중구">중구</option>');
                    selectCity.append('<option value="동구">동구</option>');
                    selectCity.append('<option value="미추홀구">미추홀구</option>');
                }
                else if(selectedLocation == "광주"){
                    selectCity.append('<option value="gwangju_city1">동구</option>');
                    selectCity.append('<option value="gwangju_city2">서구</option>');
                    selectCity.append('<option value="gwangju_city3">남구</option>');
                }
                else if(selectedLocation == "대전"){
                    selectCity.append('<option value="daejeon_city1">동구</option>');
                    selectCity.append('<option value="daejeon_city2">중구</option>');
                    selectCity.append('<option value="daejeon_city3">서구</option>');
                }
                else if(selectedLocation == "울산"){
                    selectCity.append('<option value="ulsan_city1">중구</option>');
                    selectCity.append('<option value="ulsan_city2">남구</option>');
                    selectCity.append('<option value="ulsan_city3">동구</option>');
                }
                else if(selectedLocation == "세종"){
                    selectCity.append('<option value="sejong_city1">세종특별자치시</option>');
                }
                else if(selectedLocation == "경기"){
                    selectCity.append('<option value="gyeongi_city1">수원시</option>');
                    selectCity.append('<option value="gyeongi_city2">성남시</option>');
                    selectCity.append('<option value="gyeongi_city3">고양시</option>');
                }
                else if(selectedLocation == "강원"){
                    selectCity.append('<option value="gwangwon_city1">춘천시</option>');
                    selectCity.append('<option value="gwangwon_city2">원주시</option>');
                    selectCity.append('<option value="gwangwon_city3">강릉시</option>');
                }
                else if(selectedLocation == "충북"){
                    selectCity.append('<option value="chungbuk_city1">청주시</option>');
                    selectCity.append('<option value="chungbuk_city2">충주시</option>');
                    selectCity.append('<option value="chungbuk_city3">제천시</option>');
                }
                else if(selectedLocation == "충남"){
                    selectCity.append('<option value="chungnam_city1">천안시</option>');
                    selectCity.append('<option value="chungnam_city2">공주시</option>');
                    selectCity.append('<option value="chungnam_city3">보령시</option>');
                }
                else if(selectedLocation == "전북"){
                    selectCity.append('<option value="jeonbuk_city1">전주시</option>');
                    selectCity.append('<option value="jeonbuk_city2">군산시</option>');
                    selectCity.append('<option value="jeonbuk_city3">익산시</option>');
                }
                else if(selectedLocation == "전남"){
                    selectCity.append('<option value="jeonam_city1">목포시</option>');
                    selectCity.append('<option value="jeonam_city2">여수시</option>');
                    selectCity.append('<option value="jeonam_city3">순천시</option>');
                }
                else if(selectedLocation == "경북"){
                    selectCity.append('<option value="gyeongbuk_city1">포항시</option>');
                    selectCity.append('<option value="gyeongbuk_city2">경주시</option>');
                    selectCity.append('<option value="gyeongbuk_city3">김천시</option>');
                }
                else if(selectedLocation == "경남"){
                    selectCity.append('<option value="gyeongnam_city1">창원시</option>');
                    selectCity.append('<option value="gyeongnam_city2">진주시</option>');
                    selectCity.append('<option value="gyeongnam_city3">통영시</option>');
                }
                else if(selectedLocation == "제주"){
                    selectCity.append('<option value="jeju_city1">제주시</option>');
                    selectCity.append('<option value="jeju_city2">서귀포시</option>');
                }

                selectCity.val(selectCity.find("option:first").val());
            });

            $("#selectLocation").trigger("change");
        });
    </script>
    <script>
        $(function() {
            $('#inputTime').timepicker({
                timeFormat: 'HH:mm',
                interval: 120,
                minTime: '00:00',
                maxTime: '23:59',
                startTime: '00:00',
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
        });
    </script>
<script>
  $(function() {
    var currentDate = new Date().toISOString().split("T")[0]; 
    var reservedDates = [${matchDate}]; 
    
    var inputDate = $('#inputDate');
    
    inputDate.attr("min", currentDate);
  });
</script>

<script>
	$(function() {
	  $('#selectSize').on('change', function() {
	    var matchSize = parseInt($(this).val());
	    $('#matchBoardSize').val(matchSize); // 숨겨진 입력 필드의 값을 업데이트합니다

	    var inputContainer = $('#inputContainer');
	    inputContainer.empty();

	    for (var i = 1; i <= matchSize; i++) {
	      var inputDiv = $('<div>').addClass('col-md-6 mt-4');
	      var inputLabel = $('<label>').attr('for', 'homeTeam' + i).text('HomeTeam ' + i + ' :');
	      var input = $('<input>').attr('type', 'text').attr('id', 'homeTeam' + i).attr('name', 'homeTeam' + i).attr('class', 'form-control').prop('required', true);

	      inputDiv.append(inputLabel, input);
	      inputContainer.append(inputDiv);
	    }
	  });
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>