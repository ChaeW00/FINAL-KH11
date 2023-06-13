<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="팀 수정" name="title" />
</jsp:include>
<!-- 폰트 css -->
     <link rel="stylesheet" type="text/css" href="/static/css/font.css">
<script type="text/javascript">
function handleFileChange(event) {
    const input = event.target;
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = function (e) {
        const previewImage = document.getElementById('preview');
        previewImage.src = e.target.result;
        const deleteButton = document.getElementById('deleteButton');
        deleteButton.style.display = 'block'; // 이미지 선택 시 삭제 버튼 표시
      };
      reader.readAsDataURL(input.files[0]);
    }
  }

  function deleteImage() {
    // 이미지 미리보기 엘리먼트와 삭제 버튼 엘리먼트 가져오기
    const previewImage = document.getElementById('preview');
    const deleteButton = document.getElementById('deleteButton');

    // 이미지 제거 및 기본 이미지로 변경
    previewImage.src = '/static/image/profile.png';

    // 파일 선택 input의 값을 초기화
    const fileInput = document.getElementById('formFile');
    fileInput.value = null;

    // 삭제 버튼 숨기기
    deleteButton.style.display = 'none';
  }

  //시군구 selectbox(javascript)
  $('document').ready(function() {
	  var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	  var area3 = ["대덕구","동구","서구","유성구","중구"];
	  var area4 = ["광산구","남구","동구",     "북구","서구"];
	  var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	  var area6 = ["남구","동구","북구","중구","울주군"];
	  var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	  var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	  var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	  var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	  var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	  var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	  var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	  var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	  var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	  var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	  // 시/도 선택 박스 초기화
	  $("select[name^=teamCity]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	  $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });
	 // 시/도 선택시 구/군 설정
	 $("select[name^=teamCity]").change(function() {
	 	var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	 	var $gugun = $(this).next(); // 선택영역 구군 객체
	 $("option",$gugun).remove(); // 구군 초기화
	  if(area == "area0")
	  	$gugun.append("<option value=''>구/군 선택</option>");
	  else {
	  	$.each(eval(area), function() {
	  	$gugun.append("<option value='"+this+"'>"+this+"</option>");
	 });
	}
  });

	//팀이름 입력 제어 (javascript)
	function teamName1() {
		//(주의) input 입력값을 value로 조회
		var tag = document.querySelector(".teamName-input");
		var text = tag.value;

		//글자수에 따라 다른 표시를 숫자로 구현
		var span = document.querySelector(".teamName-input-length");
		span.textContent = text.length;

		//15글자 초과시 빨간 글씨로 표현
		if (text.length > 15) {
			span.style.color = "red";
		} else {
			span.style.color = "black";
		}

		//15글자 초과시 입력 불가 처리 = 15글자 넘어가면 잘라내기
		var size = text.length;
		while (size > 15) {
			tag.value = tag.value.substring(0, size - 1);
			size--;
		}
		span.textContent = size;
	}

	//팀소개 입력 제어 (javascript)
	function teamInfo1() {
		//(주의) input 입력값을 value로 조회
		var tag = document.querySelector(".teamInfo-input");
		var text = tag.value;

		//글자수에 따라 다른 표시를 숫자로 구현
		var span = document.querySelector(".teamInfo-input-length");
		span.textContent = text.length;

		//200글자 초과시 빨간 글씨로 표현
		if (text.length > 200) {
			span.style.color = "red";
		} else {
			span.style.color = "black";
		}

		//200글자 초과시 입력 불가 처리 = 15글자 넘어가면 잘라내기
		var size = text.length;
		while (size > 200) {
			tag.value = tag.value.substring(0, size - 1);
			size--;
		}
		span.textContent = size;
	}
		$('.teamName-input').on('input', teamName1);
	    $('.teamInfo-input').on('input', teamInfo1);


		//취소버튼 클릭 시, 이전 페이지로 이동(jquery)
		$(".btn-edit-cancel").click(function() {
			history.back();
		});
	});
</script>

<style>

</style>

<div class="container-fluid main-content">
	<div class = "row">
		<div class = "col-8 offset-2 mt-5">
		
	<form action="edit" method="post" enctype="multipart/form-data">
<%-- 		<input name="teamLeader" value="${sessionScope.memberId}" --%>
<!-- 			type="hidden"> -->
		<input type="hidden"  name = "teamNo" value="${teamDto.teamNo}">

		<span class="fs-2">팀 수정</span>
		<!-- 팀 로고 이미지 -->
		<div class="form-group">
		    <label for="formFile" class="form-label mt-4">팀 이미지</label>
		    <img id="preview" width="100" height="100" src="/img/download/${teamDto.imgNo}" style="margin-left: 180px; margin-bottom: 10px;" alt="프로필 이미지">
		    <input class="form-control" type="file" name="logoImage" id="formFile" accept=".png,.jpg" onchange="handleFileChange(event)">
		    <input name="imgNo" type="hidden" value="${teamDto.imgNo}">
		    <button id="deleteButton" type="button" class="btn btn-outline-danger mt-2" onclick="deleteImage()" style="display: none;">삭제</button>
		</div>
		<%--팀 이름 --%>
		<div class="row align-items-center mt-5">
			<p class="fs-3">팀 이름을 입력해주세요</p>
			<div>
				<input name="teamName" class="teamName-input d-inline-flex form-control form-control-lg rounded"
					oninput="teamName1();" type="text" value="${teamDto.teamName}" 
					autocomplete="off" required><br> 
					<span class="teamName-input-length">0</span> / 15<br>
				<br>
			</div>
		</div>

		<%--팀 소개 --%>
		<div class="row align-items-center mt-5">
			<p class="fs-3">팀 소개글을 입력해주세요</p>
		
			<div>
				<textarea name="teamInfo" class="teamInfo-input form-control rounded"
					oninput="teamInfo1();" type="text" value="${teamDto.teamInfo}" 
					autocomplete="off" style="height: 100px" required></textarea>
				<span class="teamInfo-input-length">0</span> / 200<br>
<%-- 				<textarea name="teamInfo" class="teamInfo-input form-control rounded" oninput="teamInfo1();" autocomplete="off" style="height: 100px" required>${teamDto.teamInfo}</textarea> --%>
<!-- 				<span class="teamInfo-input-length">0</span> / 200<br> -->
				<br>
			</div>
		</div>
		
		<div class="row align-items-center mt-5">
			<p class="fs-3">팀 활동 지역을 설정하세요</p>

				<%--지역선택 시/도 --%>
				<select class="form-select form-select-lg mb-3" name="teamCity" id="sido1"></select>
				<%--지역선택 군/구 --%>
				<select class="form-select form-select-lg mb-3" name="teamLocation" id="gugun1"></select>
		</div>

		<div class="row mt-4">
			<p class="fs-3">활동요일</p>
			<div class="row justify-content-center">
			
				<div class="fs-4">
					<input type="radio" name="teamDay" id="ex_rd1" value="월요일" checked>
					<label for="ex_rd1">월요일</label><br> 
					
					<input type="radio" name="teamDay" id="ex_rd2" value="화요일">
					<label for="ex_rd2">화요일</label><br> 
						
					<input type="radio" name="teamDay" id="ex_rd3" value="수요일">
					<label for="ex_rd3">수요일</label><br>
					
					<input type="radio" name="teamDay" id="ex_rd4" value="목요일">
					<label for="ex_rd4">목요일</label><br> 
					
					<input type="radio" name="teamDay" id="ex_rd5" value="금요일">
					<label for="ex_rd5">금요일</label><br>
					
					<input type="radio" name="teamDay" id="ex_rd6" value="토요일">
					<label for="ex_rd6">토요일</label><br> 
					
					<input type="radio" name="teamDay" id="ex_rd7" value="일요일">
					<label for="ex_rd7">일요일</label><br>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<p class="fs-3">활동시간</p>
			<div class="row justify-content-center">
			
				<div class="fs-4">
					<input type="radio" name="teamTime" id="ex_rd8" value="아침(06~10시)" checked>
					<label for="ex_rd8">아침(06~10시)</label><br> 
					
					<input type="radio" name="teamTime" id="ex_rd9" value="낮(10시~18시)">
					<label for="ex_rd9">낮(10시~18시)</label><br> 
						
					<input type="radio" name="teamTime" id="ex_rd10" value="저녁(18~24시)">
					<label for="ex_rd10">저녁(18~24시)</label><br>
					
					<input type="radio" name="teamTime" id="ex_rd11" value="심야(24시~06시)">
					<label for="ex_rd11">심야(24시~06시)</label><br> 
				</div>
			</div>
		</div>

	<div class="row mt-4">
			<p class="fs-3">성별</p>
			<div class="row justify-content-center">
			
				<div class="fs-4">
					<input type="radio" name="teamGender" id="ex_rd12" value="남자" checked>
					<label for="ex_rd12">남자</label><br> 
					
					<input type="radio" name="teamGender" id="ex_rd13" value="여자">
					<label for="ex_rd13">여자</label><br> 
						
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<p class="fs-3">나이대</p>
			<div class="row justify-content-center">
			
				<div class="fs-4">
					<input type="radio" name="teamAge" id="ex_rd14" value="10대" checked>
					<label for="ex_rd14">10대</label><br> 
					
					<input type="radio" name="teamAge" id="ex_rd15" value="20대">
					<label for="ex_rd15">20대</label><br> 
					
					<input type="radio" name="teamAge" id="ex_rd16" value="30대">
					<label for="ex_rd16">30대</label><br> 
										
					<input type="radio" name="teamAge" id="ex_rd17" value="40대">
					<label for="ex_rd17">40대</label><br> 

					<input type="radio" name="teamAge" id="ex_rd18" value="50대 이상">
					<label for="ex_rd18">50대 이상</label><br> 						
				</div>
			</div>
		</div>
		
		
		<div class="row justify-content-center mt-5 mb-5">
			<button type="submit" class="col btn-edit-cancel btn btn-outline-secondary rounded" >취소</button>
            <button type="submit" class="col btn rounded" style="background-color : #E6E6E6; color:#3E4684;">수정하기</button>
			<a type="submit" class="btn rounded" href="${pageContext.request.contextPath}/team/delete?teamNo= ${teamDto.teamNo}" onclick="return confirm('정말 삭제하시겠습니까?')" role=button>
				<i class="fa-solid fa-trash" style="color:red;"></i>
				<span style="color:red">팀 삭제</span>
			</a>
		</div>	
</form>
</div>
</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>