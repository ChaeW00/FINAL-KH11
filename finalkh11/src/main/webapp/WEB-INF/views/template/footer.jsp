<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

</article>
        </section>
        <footer style="background-color: #636e72" data-bs-theme="dark">
        
      <!-- 채팅 -->
         <div class="container" id=footer>
               <div class="position-relative">
           <div class="chat-icon position-fixed bottom-0 end-0" v-on:click="chatListOpen" v-if="iconVisible">
             <i class="fa-solid fa-comments fa-3x rounded-circle p-3 bg-white" v-bind:class="{ 'fa-shake': totalAlert }"></i>
             <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" v-if="totalAlert">
             new
           </span>
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
                         <i class="fa-solid fa-close fa-lg close-btn" v-on:click="chatClose"></i>
                     </div>
                 </div>
             </div>
         
             <hr>
         
             <div class="row">
                 <div class="col chat-body">
                     <div class="row mt-4" v-for="(room, idx) in roomList">
                         <div class="col">
                             <div class="position-relative text-center">
                                 <button class="btn btn-primary w-90" v-on:click="chatOpen(room.matchNo)">
                                     {{room.matchBoardTitle}}
                                 </button>
                                 <span class="position-absolute top-0 translate-middle badge rounded-pill bg-danger" v-if="!room.visit">
                                     new
                                 </span>
                             </div>
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
                       <p>Home</p>
                       <div class="col" v-for="(entry, idx) in homeList">
                          <span style="color : blue;">{{entry.memberName}}</span>
                       </div>
                       <p>Away</p>
                       <div class="col" v-for="(entry, idx) in awayList">
                          <span style="color : gray;">{{entry.memberName}}</span>
                       </div>
                    </div>
              </div>
              
              <hr>
              <div class="row">
                 <div class="col chat-body" ref="scrollContainer">
                    <div class="message">
                       <div class="row ms-3 me-3 mb-2" v-for="(message, idx) in messageList">
                          <div v-if="message.memberId === memberId" class="content-wrapper-mine pt-2 pb-2" style="width : 180px;">
                             <div class="content-header">나</div>
                             <div class="content-body">
                                <div class="message-wraper">{{message.content}}</div>
                                <div class="time-wraper">{{timeFormat(message.time)}}</div>
                             </div>
                          </div>
                          <div v-else class="content-wrapper-other pt-2 pb-2" style="width : 180px;">
                             <div class="content-header">{{message.memberName}}</div>
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
      <!-- 채팅 끝 -->
      
             <div class="container mt-4" style="color: white;">
              <div class="row justify-content-center">
                  <div class="col-lg-6 col-md-10 mb-4">
                      <h2 class="mt-4">
                         <a href="contextPath/matchBoard/list" 
                            style="text-decoration: none; 
                            color: white; 
                            font-weight: bold;">
                            match-up.com
                            </a>
                      </h2>
                      <p style="color: white;">풋살하고 싶을 땐, 매치업</p>
                      <span>
                         매치업 | 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 C강의장 | 대표 메일 contact@matchup.com |마케팅 제안 marketing@matchup.com
                          | 언론, 연구 team@matchup.com | 00-000-0000
                      </span>
                      <br>
                      <span>주식회사 KH컴퍼니 | 사업자번호 000-00-00000 | 대표 임채우 | 통신판매업 신고 0000-서울영등포-0000</span>
                      <br>
                      <span>&copy; Match-UP All rights reserved.</span>
                  </div>
                  <div class="col-lg-3 col-md-7 mb-4 mt-3">
                      <h5 class="mt-3 mb-3" style="letter-spacing: 2px; color: white;">Contact</h5>
                      <p><i class="fas fa-home me-3 text-secondary"></i> Dang san, SU 01000, KR</p>
                      <p><i class="fas fa-envelope me-3 text-secondary"></i>info@example.com</p>
                      <p><i class="fas fa-phone me-3 text-secondary"></i> + 01 234 567 88</p>
                      <p><i class="fas fa-print me-3 text-secondary"></i> + 01 234 567 89</p>
                  </div>
                  <div class="col-lg-3 col-md-7 mb-4 mt-1">
                      <h5 class="mb-1 mt-4" style="letter-spacing: 2px; color: white;">Open Times</h5>
                  <div class="mt-3">
                     월요일 - 일요일 : 
                  </div>
                  <div class="mt-1">
                     오전 6:00 - 오후 10:00
                  </div>
                  </div>
              </div>
          </div>
          <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); color: white;">
              &copy; 2023 Match-Up.com
          </div>
      </footer>
   </main>
    
    <script>
        Vue.createApp({
            //데이터 설정 영역
            data(){
                return {
                    memberId:memberId,
                    iconVisible:true,
                    chatListVisible:false,
                    chatVisible:false,
                    roomNo:0,
                    totalAlert:false,
                    message:"",
                    roomList:[],
                    homeList:[],
                    awyaList:[],
                    messageList:[],
                };
            },

            computed:{
            },

            methods:{
               async loadRoomList() {
                   if (memberId != null && memberId.length != 0) {
                       const url = contextPath + "/rest/roomlist/" + memberId;
                       const resp = await axios.get(url);
                       for (let i = 0; i < resp.data.length; i++) {
                          let visitcnt = await this.loadVisit(resp.data[i].matchNo);
                          let visit = true; 
                          if(visitcnt == 0) visit = false;
                          if (!visit) this.totalAlert = true;
                           this.roomList.push({
                               matchNo: resp.data[i].matchNo,
                               matchBoardTitle: resp.data[i].matchBoardTitle,
                               visit : visit
                           });
                       }
                   }
               },
               
               async loadEntryList(matchNo){
                  const url = contextPath+"/rest/entry/" + matchNo;
                  const resp = await axios.get(url);
                  resp.data.forEach(entry =>{
                     if(entry.teamType == 'home') this.homeList.push(entry);
                     else this.awayList.push(entry);
                  });
               },
               
               async loadMessageList(matchNo){
                  const url = contextPath+"/rest/message/" + matchNo;
                  const resp = await axios.get(url);
                  this.messageList = resp.data.map(message => ({
                     memberId : JSON.parse(message.messageBody).memberId,
                     memberName : JSON.parse(message.messageBody).memberName,
                     content : JSON.parse(message.messageBody).content,
                     time : JSON.parse(message.messageBody).time
                  }));
               },
               
               async loadVisit(matchNo){
                  const url = contextPath+"/rest/chatvisit/" + memberId + "/" + matchNo;
                  const resp = await axios.get(url);
                  return resp.data;
                  
               },
               
               async saveVisit(matchNo){
                   const url = contextPath +"/rest/chatvisit";
                   const data = {memberId : memberId, roomNo : matchNo};
                   const resp = await axios.post(url, data);
                               
                   const roomIndex = this.roomList.findIndex(room => room.matchNo === matchNo);
                   if (roomIndex !== -1) {
                       this.roomList[roomIndex].visit = true;
                   }
               },
               
               checkVisit(no){
                  for(let i = 0; i < this.roomList.length; i++){
                     if(this.roomList[i].matchNo == no){
                        if(this.roomList[i].visit == false) this.saveVisit(no);
                        else return false;
                     }
                  }
               },
               
               checkAlert(){
                  let alert = false;
                  for(let i = 0; i < this.roomList.length; i++){
                       if(this.roomList[i].visit == false) {
                          alert = true;
                          break
                       }
                  }
                  if (alert) this.totalAlert = true;
                  else this.totalAlert = false;
               },
               
               chatListOpen(){
                    this.iconVisible = false;
                     this.chatListVisible = true;
                     this.chatVisible = false;
                     this.homeList = [];
                     this.awayList = [];
                     this.messageList = [];
                     this.roomNo = 0;
               },
               chatClose(){
                   this.iconVisible = true;
                   this.chatListVisible = false;
                   this.chatVisible = false;
                   this.roomNo = 0;
                   this.checkAlert();
               },
               chatOpen(no){
                   this.iconVisible = false;
                   this.chatListVisible = false;
                  this.chatVisible = true;
                  this.loadEntryList(no);
                  this.loadMessageList(no);
                  
                  this.roomNo = no;
                  this.checkVisit(no);
                  this.checkAlert();
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
                     console.log(data);
                     this.messageList.push(data);
                                          
                     if(this.$refs.scrollContainer != null){
                        this.$nextTick(() => {
                             const scrollContainer = this.$refs.scrollContainer;
                             scrollContainer.scrollTo({ top: scrollContainer.scrollHeight, behavior: 'smooth' });
                          });
                     }
                     
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
              },   
        }).mount("#footer");
    </script>
</body>
</html>