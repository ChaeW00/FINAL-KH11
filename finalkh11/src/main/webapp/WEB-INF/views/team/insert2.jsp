<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="insert" method="post">
<div class="container-400">
	<div class="row center">
		<h2>팀 생성</h2>
	</div>
	<div class="row">
		<label>팀 이름</label>
		<input type="text" name="playerId" required>
	</div>
	<div class="row">
		<label>활동 요일</label>
		<input type="text" name="playerLevel" required>
	</div>
	<div class="row">
		<label>활동 시간대</label>
		<input type="text" name="playerJob" required>
	</div>
	<div class="row">
		<label>활동 도시</label>
		<input type="text" name="playerGold" required>
	</div>
	<div class="row">
		<label>활동 지역</label>
		<input type="text" name="playerGold" required>
	</div>
	<div class="row">
		<label>성별</label>
		<input type="text" name="playerGold" required>
	</div>
	<div class="row">
		<label>나이대</label>
		<input type="text" name="playerGold" required>
	</div>
	<div class="row">
		<button type="submit">등록</button>	
		<a class="form-btn neutral" href="/team/list">취소</a>
	</div>
</div>
</form>



