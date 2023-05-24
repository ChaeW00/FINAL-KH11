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
		.chat-body{
			width : 400px;
			height : 400px;
			overflow-y : auto;
		}
		.close-btn, .send-btn, .backward-btn{
		  	cursor : pointer;
		}
		.close-btn:hover, .send-btn:hover, .backward-btn:hover{
		  	filter : brightness(200%);
		}

		.content-header{
			font-size : 1.25em;
			font-weight : bold;
		}
		.content-wrapper-other {
			position: relative;
			background: #e1edf5;
			border-radius: .4em;
			width: 180px;
		}
		.content-wrapper-other:after {
			content: '';
			position: absolute;
			left: 0;
			top: 50%;
			width: 0;
			height: 0;
			border: 22px solid transparent;
			border-right-color: #e1edf5;
			border-left: 0;
			border-bottom: 0;
			margin-top: -11px;
			margin-left: -22px;
		}
		
		.content-wrapper-mine {
			position: relative;
			background: #cce2ff;
			border-radius: .4em;
			width: 180px;
			margin-left : auto;
		}
		.content-wrapper-mine:after {
			content: '';
			position: absolute;
			right: 0;
			top: 50%;
			width: 0;
			height: 0;
			border: 22px solid transparent;
			border-left-color: #cce2ff;
			border-right: 0;
			border-bottom: 0;
			margin-top: -11px;
			margin-right: -22px;
		}
		
		.fade-enter-active, .fade-leave-active {
			transition: opacity 0.25s ease;
			}
		.fade-enter-from, .fade-leave-to {
			opacity: 0;
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
        	<div class="chat-icon position-fixed bottom-0 end-0" v-on:click="chatListOpen" v-if="iconVisible">
	          <i class="fa-solid fa-comments fa-4x"></i>
        	</div>
      	</div>
      	
      	<div class="position-relative">
      		<transition name="fade">
			<div class="chat-container position-fixed bottom-0 end-0 border rounded-3 bg-white" v-if="chatListVisible">
			 	<div class="row">
		            <div class="col chat-header d-flex justify-content-between align-items-center py-2 px-3">
		            
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
								<button class="btn btn-primary w-100" v-on:click="chatOpen(room.matchNo)">
									{{room.matchTitle}}
								</button>
							</div>
						</div>
			 		</div>
			 	</div>
			 </div>
			</transition>
			
			<transition name="fade">
	 		<div class="chat-container position-fixed bottom-0 end-0 border rounded-3 bg-white" v-if="chatVisible">
	 			<div class="row">
		  			<div class="col chat-header d-flex justify-content-between align-items-center py-2">
		                <div>
		                    <i class="fa-solid fa-arrow-left backward-btn" v-on:click="chatListOpen"></i>
		                </div>
		                <div>채팅방 참가 멤버</div>
			                <div>
			                    <i class="fa-solid fa-close fa-lg close-btn" v-on:click="chatClose"></i>
			                </div>
			            </div>
				  		<div class="row">
				  			<div class="col" v-for="(entry, idx) in entryList">
				  				<span v-if="entry.teamType == 'home'" style="color : red;">{{entry.memberId}}</span>
				  				<span v-else style="color : blue;">{{entry.memberId}}</span>
				  			</div>
				  		</div>
	  			</div>
	  			
	  			<hr>
	  			<div class="row">
	  				<div class="col chat-body" ref="scrollContainer">
	  					<div class="message">
	  						<div class="row ms-3 me-3 mb-2" v-for="(message, idx) in messageList">
	  							<div v-if="message.memberId === memberId" class="content-wrapper-mine pt-2 pb-2">
		  							<div class="content-header">나</div>
		  							<div class="content-body">
		  								<div class="message-wraper">{{message.content}}</div>
		  								<div class="time-wraper">{{timeFormat(message.time)}}</div>
		  							</div>
	  							</div>
	  							<div v-else class="content-wrapper-other pt-2 pb-2">
		  							<div class="content-header">{{message.memberId}}</div>
		  							<div class="content-body">
		  								<div class="message-wraper">{{message.content}}</div>
		  								<div class="time-wraper">{{timeFormat(message.time)}}</div>
		  							</div>
	  							</div>
	  						</div>
	  					</div>
	  				</div>
	  			</div>
	  			
	  			<div class="row">
				    <div class="col chat-footer">
				        <div class="input-wrapper d-flex align-items-center">
				            <div class="textarea-wrapper flex-grow-1 me-1">
				                <textarea class="mt-2 w-100 form-control"
				                          v-model="message"
				                          @keydown.enter.prevent="sendMessage"></textarea>
				            </div>
				            <div class="button-wrapper">
				                <button class="btn send-btn" v-on:click="sendMessage">
				                    <i class="fa-regular fa-paper-plane fa-2x"></i>
				                </button>
				            </div>
				        </div>
				    </div>
				</div>
	  			
			</div>
			</transition>
		</div>
		
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
//                 	socekt:null,
                    iconVisible:true,
                    chatListVisible:false,
                    chatVisible:false,
                    roomNo:0,
                    memberId:memberId,
                    message:"",
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
            			memberId : JSON.parse(message.messageBody).memberId,
            			content : JSON.parse(message.messageBody).content,
            			time : JSON.parse(message.messageBody).time
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
	            	this.loadEntryList(no);
	            	this.loadMessageList(no);
	            	
	            	const data = {type : 2, room: no};
	            	this.socket.send(JSON.stringify(data));
	            },
	            
	            timeFormat(time){
	                return moment(time).format("HH:mm");
	            },
	             
	            connectWebSocket(){
	            	const url = contextPath+"/ws/channel";
	            	
	            	this.socket = new SockJS(url);
	            	this.socket.onopen = () =>{
	            		const data = { type : 2, room : this.roomNo};
	            		this.socket.send(JSON.stringify(data));
	            		console.log("연결되었습니다");
	            	};
	            	
	            	this.socket.onclose = () => {
	            		console.log("연결종료");
	            	};
	            	
	            	this.socket.onerror = () => {
	            		console.log("연결오류");
	            	};
	            	
	            	this.socket.onmessage = (e) => {
	            		const data = JSON.parse(e.data);
	            		this.messageList.push(data);
	            		
	            		this.$nextTick(() => {
	           				const scrollContainer = this.$refs.scrollContainer;
	           				scrollContainer.scrollTo({ top: scrollContainer.scrollHeight, behavior: 'smooth' });
	           			});
	            		
	            		
	            	};
	            },
	            
	            sendMessage(){
	            	const text = this.message;
            		if(text.length == 0) return;
            		const data = { type : 1, content:text};
            		this.socket.send(JSON.stringify(data));
            		this.message = "";
            	},
            	
	            
               
           	},
           	
           	created(){
           		this.loadRoomList();
           		this.connectWebSocket();
           	}
        }).mount("#app");
    </script>
</body>