<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="/static/css/commons.css">    

<form action="write" method="post" autocomplete="off">
	<div class="container-800">
	<div class="row">
		<label>제목<i class="fa-solid fa-asterisk"></i></label>
		<input type="text" name="freeTitle" required class="form-input w-100">
	</div>
	<div class="row">
		<label>경기 날짜<i class="fa-solid fa-asterisk"></i></label>
		<input type="date" name="freeDate" required class="form-input w-100">
	</div>
	<div class="row">
		<label>나이<i class="fa-solid fa-asterisk"></i></label>
		<select name="freeAge" class="form-input">
			<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
			<option value="10">10대</option>
			<option value="20">20대</option>
			<option value="30">30대</option>			
		</select>
	</div>
	<div class="row">
		<label>경기장<i class="fa-solid fa-asterisk"></i></label>
		<select name="freeGround" class="form-input">
			<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="마포">마포</option>			
		</select>
	</div>
	<div class="row">
		<label>성별<i class="fa-solid fa-asterisk"></i></label>
		<select name="freeGender" class="form-input">
			<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
			<option value="남">남</option>
			<option value="여">여</option>
			<option value="상관없음">상관없음</option>			
		</select>
	</div>
	<div class="row">
		<label>필요인원수<i class="fa-solid fa-asterisk"></i></label>
		<select name="freeSize" class="form-input">
			<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>			
		</select>
	</div>
	<div class="row">
		<label>요금<i class="fa-solid fa-asterisk"></i></label>
		<select name="freeFee" class="form-input">
			<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
			<option value="1000">1000원</option>
		</select>
	</div>
	<div class="row">
		<label>실력<i class="fa-solid fa-asterisk"></i></label>
		<select name="freeSkill" class="form-input">
			<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
			<option value="상">상</option>
			<option value="중">중</option>
			<option value="하">하</option>			
		</select>
	</div>
	<div class="row">
		<label>내용<i class="fa-solid fa-asterisk"></i></label>
		<textarea name="freeContent" required class="form-input w-100" style="min-height: 300px;"></textarea>
	</div>
	
	<div class="row">
		<button type="submit" class="form-btn positive w-100">등록</button>
	</div>
</div>
</form>