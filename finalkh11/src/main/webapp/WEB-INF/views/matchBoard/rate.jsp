<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 	<style>
		.center-align {
  			text-align: center;
		}
		
		.tableBody {
			text-align: center;
			text-decoration: none;
  			color: black;
		}
		
		.profile {
    		width : 80px;
    		height : 80px;
    	}
    	
    	.profile2 {
    		width : 40px;
    		height : 40px;
    	}
    	
    	.custom-container {
			width:66.67%;
			margin: 0 auto;
		}
		
		.tag {
  			margin-left: 10px;
  			text-decoration: none;
  			color: black;
  			font-weight: bold;
  			border: 1px solid black;
  			padding: 5px 10px;
  			display: inline-block;
  			text-align: center;
  			border-radius: 10px;
  			margin-bottom: 10px;
		}
		
		.tag-row {
  			display: flex;
  			justify-content: flex-end;
		}
	</style>
 
 <div id="app" class="custom-container" style="margin-top:150px;">
 	<div class="row mt-5">
 		<h1 class="center-align">팀매치 순위</h1>
 	</div>
 	<div class="row mt-4">
 		<div class="tag-row">
			<button class="tag" v-on:click="clickHandler('gamesPlayed')">최다 경기 팀</button>
      		<button class="tag" v-on:click="clickHandler('teamWin')">최다 승리 팀</button>
      		<button class="tag" v-on:click="clickHandler('points')">최다 포인트 팀</button>
      		<button class="tag" v-on:click="clickHandler('winRate')">최다 승률 팀</button>
		</div>
 		<div class="col">
            <table class="table table-bordered">
            	<thead>
                	<tr>
                		<th><p class="boardInfo2" style="text-align: center;">순위</p></th>
                  		<th><p class="boardInfo2" style="text-align: center;">팀 이름</p></th>
                  		<th><p class="boardInfo2" style="text-align: center;">경기 수</p></th>
                  		<th><p class="boardInfo2" style="text-align: center;">승</p></th>
                  		<th><p class="boardInfo2" style="text-align: center;">패</p></th>
                  		<th><p class="boardInfo2" style="text-align: center;">승률</p></th>
                  		<th><p class="boardInfo2" style="text-align: center;">포인트 (승리 시 +3점, 패배 시 -1점)</p></th>
                	</tr>
              	</thead>
              	<tbody>
              		<tr v-for="(team, index) in teamList" :key="team.teamNo">
              			<td class="center-align"><img :src="team.profile" class="profile"> {{ index + 1 }}위<img :src="getRankImage(index + 1)" class="profile2"></td>
              			<td class="center-align"><a class="tableBody" :href="'/team/detail/' + team.teamNo">{{ team.teamName }} ({{ team.teamGender }}팀)</a></td>
              			<td class="center-align">{{ team.teamWin + team.teamLose }}</td>
              			<td class="center-align">{{ team.teamWin }}</td>
              			<td class="center-align">{{ team.teamLose }}</td>
              			<td class="center-align tableBody">{{ calculateWinRate(team) }}</td>
              			<td class="center-align">{{ calculatePoints(team) }}</td>
              		</tr>
              	</tbody>
             </table>
 		</div>
 		<a :href="'list'" style="text-decoration: none; color: black; font-weight: bold; text-align: center;">매치 신청하러 가기</a>
 	</div>
 </div>
 
 <script>
  Vue.createApp({
    data() {
      return {
        memberId: memberId,
        teamList: [],
        sortKey: '',
      };
    },

    computed: {
      sortedTeamList() {
        const key = this.sortKey;
        let sortedList = [...this.teamList];

        if (key === 'gamesPlayed') {
          sortedList.sort((a, b) => {
            const totalGamesA = a.teamWin + a.teamLose;
            const totalGamesB = b.teamWin + b.teamLose;

            return totalGamesB - totalGamesA || a.teamName.localeCompare(b.teamName);
          });
        } else if (key === 'teamWin') {
          sortedList.sort((a, b) => b.teamWin - a.teamWin || a.teamName.localeCompare(b.teamName));
        } else if (key === 'points') {
          sortedList.sort((a, b) => b.points - a.points || a.teamName.localeCompare(b.teamName));
        } else if (key === 'winRate') {
          sortedList.sort((a, b) => parseFloat(b.winRate) - parseFloat(a.winRate) || a.teamName.localeCompare(b.teamName));
        }

        return sortedList;
      },
    },

    methods: {
      calculateWinRate(team) {
        const gamesPlayed = team.teamWin + team.teamLose;
        if (gamesPlayed === 0) {
          return '0%';
        } else {
          const winRate = (team.teamWin / gamesPlayed) * 100;
          return winRate.toFixed(0) + '%';
        }
      },
      
      calculatePoints(team) {
        const points = (team.teamWin * 3) + (team.teamLose * -1);
        return points;
      },

      async loadTeamList() {
        const url = contextPath + "/rest/matchBoard/teamList";
        const resp = await axios.get(url);

        resp.data.forEach(team => {
          team.profile = (team.imgNo === 0) ? contextPath + "/static/image/profile.png" : contextPath + "/img/download/" + team.imgNo;
          team.winRate = this.calculateWinRate(team);
          team.points = this.calculatePoints(team);
        });

        resp.data.sort((a, b) => parseFloat(b.winRate) - parseFloat(a.winRate)); // winRate를 기준으로 내림차순 정렬

        this.teamList = resp.data;
        this.sortKey = 'winRate';
      },

      clickHandler(key) {
        if (key !== this.sortKey) {
          this.sortKey = key;
          this.teamList = this.sortedTeamList;
        }
      },
      
      getRankImage(rank) {
        if (rank === 1) {
          return "/static/image/first.png";
        } else if (rank === 2) {
          return "/static/image/second.png";
        } else if (rank === 3) {
          return "/static/image/third.png";
        }

        return "/static/image/white.png";
      }
    },

    watch: {

    },

    mounted() {
      this.loadTeamList();
    },

    created() {

    },
  }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>