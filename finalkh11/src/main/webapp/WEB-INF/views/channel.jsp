<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.message {
		border:1px solid gray;
		padding:10px;
	}
</style>

<h2>${sessionScope.memberId}</h2>

<hr>

<input type="text" class="user-input">
<button class="btn-send">전송</button>

<hr>

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
		loadMessage();
		
		function loadMessage() {
			const roomName = new URLSearchParams(location.search).get("room");
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/message/"+roomName,
				method:"get",
				success:function(resp){
					displayMessageList(resp);
					connectWebSocket();
				},
			});
		}
		
		function displayMessageList(resp){
			for(let i=0; i < resp.length; i++) {
				const data = JSON.parse(resp[i].messageBody);
				const time = moment(data.time).format("HH:mm");
				
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

			const url = "${pageContext.request.contextPath}/ws/webchat";
			window.socket = new SockJS(url);
			window.socket.onopen = function(){
				
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
			window.socket.onmessage = function(e){
				const data = JSON.parse(e.data);
				const time = moment(data.time).format("HH:mm");
				
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
			
			function changeToConnect(){
				$(".user-input").prop("disabled", false);
				$(".btn-send").prop("disabled", false);
			}
			
			function changeToDisconnect(){
				$(".user-input").prop("disabled", true);
				$(".btn-send").prop("disabled", true);
			}
		}
		
	});
</script>