<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <!-- 폰트 css -->
     <link rel="stylesheet" type="text/css" href="/static/css/font.css">
<!-- chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">

	// 카테고리별 판매량
	$(function() {
	$.ajax({
		url: contextPath + "/rest/admin/member/groundStatsView",
		method:"get",
		success:function(response) {
			var ctx = document.querySelector('#categorySellCount');
			new Chart(ctx, {
				type: 'bar',
				data: {
					/*labels: response.label,*/
					labels: [
						'서울특별시','인천광역시','대전광역시','광주광역시','대구광역시',
						'울산광역시','부산광역시','경기도','강원도','충청북도','충청남도',
						'전라북도','전라남도','경상북도','경상남도','제주도'
					],
					datasets: [{
						label: '구장 결제 금액',
						data: response.remain,
						borderWidth: 1,
						backgroundColor: ['rgba(248, 236, 201, 0.5)'],
                        borderColor: ['rgba(248, 236, 201, 1)'],
                        yAxisID: 'y1',
					},
					{
						label: '구장 결제 순위',
						type: 'line',
						fill: 'false',
						pointRadius: 1,
						data: response.rank,
						borderWidth: 2,
						backgroundColor: ['rgba(255, 72, 72, 0.5)'],
                        borderColor: ['rgba(255, 72, 72, 0.5)'],
                        yAxisID: 'y2',
					}]
				},
				options: {
                    scales: {
                        y1: {
                            beginAtZero: true,
                            type: 'linear',
                            display: true,
                            position: 'left',
                        },
                        y2: {
                        	  beginAtZero: true,
                        	  type: 'linear',
                        	  display: true,
                        	  position: 'right',
                        	  ticks: {
                        	    precision: 0, // 숫자를 정수로 표시
                        	  },
                        	},
                    }
                },
                error:function() {
                	alert("오류가 발생했습니다.\n잠시 후 다시 시도해주세요.")
                }
			})
		}
	})
	
	$.ajax({
		url:contextPath + "/rest/admin/member/memberStatsView",
		method:"get",
		success:function(response) {
			var ctx = document.querySelector('#memberStatsView');
			new Chart(ctx, {
				type: 'bar',
				data: {
					/*labels: response.label,*/
					labels: ['일반회원','관리자','매니저'],
					datasets: [{
						label: '인원 수',
						data: response.count,
						borderWidth: 1,
						backgroundColor: ['rgba(248, 236, 201, 0.5)'],
                        borderColor: ['rgba(248, 236, 201, 1)'],
					}]
				},
				options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                },
                error:function() {
                	alert("오류가 발생했습니다.\n잠시 후 다시 시도해주세요.")
                }
			})
		}
	})
	
	
	})
</script>

<div class="container-fluid mt-4" >
  <div class="row">
    <div class="offset-md-2 col-md-8 mt-3"> 
      <div class="w-100" style="margin-top: 100px;">
        <div class="row text-center">
          <h1>통계</h1>
        </div>
        
        <div class="row" style="margin-top: 50px">
          <h2>구장별 결제</h2>
        </div>
        <div class="row">
          <div class="col text-center">
            <canvas id="categorySellCount"></canvas>
          </div>
        </div>
        
        <div class="row" style="margin-top: 50px">
          <h2>회원 등급</h2>
        </div>
        <div class="row pb-50">
          <div class="col text-center">
            <canvas id="memberStatsView" width="758" height="379" style="display:block; box-sizing:border-box; height:379px; width:758px;"></canvas>
          </div>
        </div>
      </div>
      
      <div class="row mt-4">
        <div class="col">
          <table class="table table-hover">
            <h2>팀 순위(1~5th)</h2>
            <thead>
              <tr>
                <th>팀 이름</th>
                <th>승리</th>
                <th>패배</th>
                <th>순위</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="teamStatsDto" items="${list}">
                <tr>
                  <td>${teamStatsDto.teamName}</td>
                  <td>${teamStatsDto.totalWins}</td>
                  <td>${teamStatsDto.totalLosses}</td>
                  <td>${teamStatsDto.ranking}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
      
    </div>
  </div>
</div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>