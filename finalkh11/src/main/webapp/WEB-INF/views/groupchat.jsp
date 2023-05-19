<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.message {
		border:1px solid gray;
		padding:10px;
	}
	.home {
		color : blue;
	}
	.away{
		color : red;
	}
</style>

<h1>그룹채팅 테스트</h1>
<h2>참가인원</h2>
<c:forEach var="entry" items="${entryList}">
	<c:if test="${entry.teamType == 'home'}">
		<span class="home">${entry.memberId}</span>
	</c:if>
	<c:if test="${entry.teamType == 'away'}">
		<span class="away">${entry.memberId}</span>
	</c:if>
	
</c:forEach>
<br><br>

<input type="text" class="user-input">
<button class="btn-send">전송</button>

<hr>

<!-- 메세지가 표시될 공간 -->
<div class="message-wrapper"></div>

<script type="text/template" id="message-template">
<div class="message">
	<h2 class="memberId">보낸사람</h2>
	<p class="content">내용</p>
	<span class="time">HH:mm</span>
</div>
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
	$(function(){
		//시작하자마자 채팅방 메세지를 불러온다
		loadMessage();
		
		
		
		function loadMessage() {
			const roomName = new URLSearchParams(location.search).get("room");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/message/"+roomName,
				method:"get",
				success:function(resp){
					//resp에 있는 목록의 모든 메세지를 화면에 추가
					displayMessageList(resp);
					//웹소켓 연결
					connectWebSocket();
				},
			});
		}
		
		function displayMessageList(resp){
			for(let i=0; i < resp.length; i++) {
				//수신한 데이터(e.data)가 JSON 문자열 형태이므로 해석 후 처리
				const data = JSON.parse(resp[i].messageBody);
				const time = moment(data.time).format("HH:mm");
				//const time = moment(data.time).fromNow();
				
				var template = $("#message-template").html();
				var html = $.parseHTML(template);
				$(html).find(".memberId").text(data.memberId);
				$(html).find(".content").text(data.content);
				$(html).find(".time").text(time);
				
				$(".message-wrapper").append(html);
			}
		}
		
		function connectWebSocket(){
			changeToDisconnect();
			
			//시작하자마자 연결
				
			//SockJS를 사용하여 달라지는 부분(주소, 연결생성)
			const url = "${pageContext.request.contextPath}/ws/channel";
			window.socket = new SockJS(url);
			
			//실제로 연결이 됐는지, 끊어졌는지 알 방법이 없다
			//- 웹소켓에서 이벤트 형태로 제공한다(callback)
			//- 지금 현재 서버의 대기실에 위치하고 있으므로 방 번호를 알려줘서 이동 처리
			window.socket.onopen = function(){
				//파라미터 중에서 room이라는 항목을 읽어서 첨부하여 전송
				//const data = {type : 2, room : "${param.room}"};
				
				const room = new URLSearchParams(location.search).get("room");
				const data = {type : 2, room : room};
				window.socket.send(JSON.stringify(data));
				
				changeToConnect();
				$("<p>").text("서버에 연결되었습니다")
							.appendTo(".message-wrapper");
			};
			window.socket.onclose = function(){
				changeToDisconnect();
				$("<p>").text("서버와의 연결이 종료되었습니다")
							.appendTo(".message-wrapper");
			};
			window.socket.onerror = function(){
				changeToDisconnect();
				$("<p>").text("서버와의 연결 오류가 발생했습니다")
							.appendTo(".message-wrapper");
			};
			//메세지를 수신하면 수신된 메세지로 태그를 만들어서 추가
			window.socket.onmessage = function(e){
				//수신한 데이터(e.data)가 JSON 문자열 형태이므로 해석 후 처리
				const data = JSON.parse(e.data);
				const time = moment(data.time).format("HH:mm");
				//const time = moment(data.time).fromNow();
				
				var template = $("#message-template").html();
				var html = $.parseHTML(template);
				$(html).find(".memberId").text(data.memberId);
				$(html).find(".content").text(data.content);
				$(html).find(".time").text(time);
				
				
				$(".message-wrapper").append(html);
			};
				
			$(".btn-send").click(function(){
				const text = $(".user-input").val();
				if(text.length == 0) return;

				const data = {type:1, content:text};
				window.socket.send(JSON.stringify(data));
				
				$(".user-input").val("");//입력창 초기화
			});
			
			//연결 상태일 때의 화면을 만드는 함수
			function changeToConnect(){
				$(".user-input").prop("disabled", false);
				$(".btn-send").prop("disabled", false);
			}
			
			//종료 상태일 때의 화면을 만드는 함수
			function changeToDisconnect(){
				$(".user-input").prop("disabled", true);
				$(".btn-send").prop("disabled", true);
			}
		}
		
		
	});
	
</script>