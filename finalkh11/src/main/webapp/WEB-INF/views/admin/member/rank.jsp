<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function() {
	// 카테고리별 판매량
	$.ajax({
		url:contextPath + "/rest/admin/categorySellCount",
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
						label: '평균 판매량',
						data: response.avges,
						borderWidth: 1,
						backgroundColor: ['rgba(173, 166, 255, 0.5)'],
                        borderColor: ['rgba(173, 166, 255, 1)'],
                        yAxisID: 'y1',
					},
					{
						label: '최다 판매량',
						type: 'line',
						fill: 'false',
						pointRadius: 1,
						data: response.maxs,
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
						y2 : {
							beginAtZero: true,
							type: 'linear',
			                display: true,
			                position: 'right',
						}
                    }
                },
                error:function() {
                	alert("오류가 발생했습니다.\n잠시 후 다시 시도해주세요.")
                }
			})
		}
	})
</script>

<div class="w-100">
	<div class="row center pb-30">
		<h1>카테고리별 상품 통계</h1>
	</div>

	<div class="row">
		<h2>카테고리별 판매량</h2>
	</div>
	<div class="row pb-50">
		<canvas id="categorySellCount"></canvas>
	</div>
	
</div>