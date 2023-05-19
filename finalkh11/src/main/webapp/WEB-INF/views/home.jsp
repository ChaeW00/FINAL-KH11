<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/sandstone/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
	<style>
		.chat-icon{
		  margin-bottom : 1.5em;
		  margin-right : 1.5em;
		  cursor : pointer;
		}
		.chat-container{
		  width : 400px;
		  margin-bottom : 1.5em;
		  margin-right : 1.5em;
		  padding : 2em;
		}
		.chat-header{
		  font-size : 1.75em;
		  font-weight : bold;
		  margin-bottom: 1em;
		}
		.close-btn{
		  margin-left: 1em;
		  cursor : pointer;
		}
		.backward-btn{
		  margin-right: 1em;
		  cursor : pointer;
		}
	</style>
</head>

<body>
<h1>웹소켓 테스트</h1>
	<div class="container-fluid mt-4" id="app">
		<c:choose>
			<c:when test="${memberId == null}">
				<!-- 로그인 화면 : 로그아웃 상태일 때 -->
				<form action="login" method="post">
					<input type="text" name="memberId" required placeholder="아이디">
					<input type="password" name="memberPw" required placeholder="비밀번호">
					<button type="submit">로그인</button>
				</form>
			</c:when>
			<c:otherwise>
				<!-- 사용자 정보 : 로그인 상태일 때 -->
				<h2>
				아이디 : ${sessionScope.memberId}, 
				<a href="logout">로그아웃</a>
				</h2>
			</c:otherwise>
		</c:choose>
		
		<a href="create">테스트 매치 생성</a>
		<hr>
		<h2> 명단 생성 </h2>
		<c:forEach var="match" items="${matchList}">
			<h2><a href="match?matchNo=${match.matchNo}">${match.matchTitle}</a></h2>
		</c:forEach>
		
		<div class="position-relative">
        	<div class="chat-icon position-fixed bottom-0 end-0"
	         :class="{invisible: iconVisible == false}" v-on:click="chatListOpen">
	          <i class="fa-solid fa-comments fa-4x"></i>
        	</div>
      	</div>
		
		<div class="position-relative">
			<div class="chat-container position-fixed bottom-0 end-0 border rounded-3"
			 :class="{invisible : chatListVisible == false}">
			 	<div class="row">
			 		<div class="col chat-header">
			 			<div class="float-start">
			                채팅방 목록
			              </div>
			              <div class="float-end">
			                <i class="fa-solid fa-close fa-lg close-btn"
			                 v-on:click="chatClose"></i>
			              </div>
			 		</div>
			 	</div>
			 	
			 	<hr>
			 	
			 	<div class="row">
			 		<div class="col chat-body">
						<div class="row mt-4" v-for="(room, idx) in roomList">
							<div class="col">
								<button class="btn btn-primary" v-on:click="chatOpen(room.matchNo)">
									{{room.matchNo}}
								</button>
							</div>
						</div>
			 		</div>
			 	</div>
			 </div>
			 
	 		<div class="chat-container position-fixed bottom-0 end-0 border rounded-3"
	  		 :class="{invisible : chatVisible == false}">
	  			<div class="row">
			  		<div class="col chat-header">
			  			<div class="float-start">
		                	<i class="fa-solid fa-arrow-left backward-btn" v-on:click="chatListOpen"></i>
		              	</div>
		              	<div class="float-start">채팅방 참가 멤버</div>
		              	<div class="float-end">
							<i class="fa-solid fa-close fa-lg close-btn" v-on:click="chatClose"></i>	              	
		              	</div>
			  		</div>
			  		<div class="row">
			  			<div class="col" v-for="(entry, idx) in entryList">
			  				<span>{{entry.memberId}}</span>
			  			</div>
			  		</div>
	  			</div>
	  			
	  			<hr>
	  			<div class="row">
	  				<div class="col chat-body">
	  					<div class="message">
	  						<div class="profile-wrapper">
	  							<imc src="https://via.placeholder.com/30x30?text=P" width="100%">
	  						</div>
	  						<div class="content-wrapper" v-for="(message, idx) in messageList">
	  							<div class="content-header">{{message.messageBody.memberId}}</div>
	  							<div class="content-body">
	  								<div class="message-wraper">{{message.messageBody.content}}</div>
	  								<div class="time-wraper">{{message.messageTime}}</div>
	  							</div>
	  						</div>
	  					</div>
	  				</div>
	  			</div>
	  			
	  			<div class="row">
	  				<div class="col chat-footer">
	  					<div class="input-wrapper">
	  						<div class="textarea-wrapper float-left">
	  							<textarea></textarea>
	  						</div>
	  						<div class="button-wrapper float-right">
	  							<i class="fa-regular fa-paper-plane"></i>
	  						</div>
	  					</div>
	  				</div>
	  			</div>
	  			
		</div>
		
		<h1>채팅방 목록</h1>
		<c:forEach var="chatRoom" items="${entryList}">
			<h2><a href="groupchat?room=${chatRoom.matchNo}">${chatRoom.matchNo}</a></h2>
		</c:forEach>
		
	</div>

	<script>
		const contextPath = "${pageContext.request.contextPath}";
	    const memberId = "${sessionScope.memberId}";
      	const memberLevel = "${sessionScope.memberLevel}";
	</script>
	
	<script src="https://unpkg.com/vue@3.2.36"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script>
        Vue.createApp({
            //데이터 설정 영역
            data(){
                return {
                    iconVisible:true,
                    chatListVisible:false,
                    chatVisible:false,
                    roomNo:0,
                    roomList:[],
                    entryList:[],
                    messageList:[]
                };
            },

            computed:{
				
            },

            methods:{
            	async loadRoomList(){
            		if (memberId != null && memberId.length != 0){
	            		const url = contextPath+"/rest/roomlist/" + memberId; 
	            		const resp = await axios.get(url);
	            		this.roomList.push(...resp.data);            			
            		}
            	},
            	
            	async loadEntryList(matchNo){
            		const url = contextPath+"/rest/entry/" + matchNo;
            		const resp = await axios.get(url);
            		this.entryList.push(...resp.data);
            	},
            	
            	async loadMessageList(matchNo){
            		const url = contextPath+"/rest/message/" + matchNo;
            		const resp = await axios.get(url);
            		this.messageList = resp.data.map(message => ({
            			messageNo : message.messageNo,
            			memberId : message.memberId,
            			roomNo : message.roomNo,
            			messageBody : JSON.parse(message.messageBody),
            			messageTime : message.messageTime
            		}));
            	},
            	
            	
	            chatListOpen(){
	           		this.iconVisible = false;
	               	this.chatListVisible = true;
	               	this.chatVisible = false;
	               	this.entryList = [];
	               	this.messageList = [];
	            },
	            chatClose(){
	                this.iconVisible = true;
	                this.chatListVisible = false;
	                this.chatVisible = false;
	            },
	            chatOpen(no){
	                this.iconVisible = false;
	                this.chatListVisible = false;
	            	this.chatVisible = true;
	            	this.roomNo = no;
	            	this.loadEntryList(no);
	            	this.loadMessageList(no);
	            },
	            timeFormat(time){
	                return time.format("A h:mm");
	            },
	             
	            calculateDisplay(index) {
			        if(index + 1 == this.messageList.length) return true;
	                const after = this.messageList[index+1];
	                const current = this.messageList[index];
	                if(current.memberId != after.memberId) return true;
	                if(this.timeFormat(current.time) != this.timeFormat(after.time)) return true;
	                return false;
	            },
	            
	            connectWebSocket(){
	            	this.changetToDisconnect();
	            	const url = contextPath+"/ws/channel";
	            	
	            	this.socket = new SockJS(url);
	            	this.socket.onopen = () =>{
	            		const data = { type : 2, room : this.roomNo};
	            		this.socket.send(JSON.stringify(data));
		            	this.changeToConnect();
		            	this.appendToMessageWrapper("서버에 연결되었습니다");
	            	};
	            	
	            	this.socket.onclose = () => {
	            		this.changetToDisconnect();
	            		this.appendToMessageWrapper('서버와의 연결이 종료되었습니다');
	            	};
	            	
	            	this.socket.onerror = () => {
	            		this.changeToDisconnect();
	            		this.appendToMessageWrapper('서버와의 연결 오류가 발생했습니다');
	            	};
	            	
	            };
	            
               
           	},
           	created(){
           		this.loadRoomList();
           	}
        }).mount("#app");
    </script>
</body>