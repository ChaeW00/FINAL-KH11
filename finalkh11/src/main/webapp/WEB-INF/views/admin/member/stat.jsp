<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function() {
	// 카테고리별 개수
	$.ajax({
		url:contextPath + "/rest/admin/categoryCount",
		method:"get",
		success:function(response) {
			var ctx = document.querySelector('#categoryCount');
			new Chart(ctx, {
				type: 'bar',
				data: {
					/*labels: response.label,*/
					labels: ['피부', '다이어트', '여성', '활력', '남성', '눈', '치아', '관절/뼈'],
					datasets: [{
						label: '상품 개수',
						data: response.cnts,
						borderWidth: 1,
						backgroundColor: ['rgba(173, 166, 255, 0.5)'],
                        borderColor: ['rgba(173, 166, 255, 1)'],
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
</script>

<div class="w-100">
	<div class="row center pb-30">
		<h1>카테고리별 상품 통계</h1>
	</div>
	<div class="row">
		<h2>카테고리별 상품 개수</h2>
	</div>
	<div class="row pb-50">
		<canvas id="categoryCount"></canvas>
	</div>
	<div class="row">
		<h2>카테고리별 판매량</h2>
	</div>
	<div class="row pb-50">
		<canvas id="categorySellCount"></canvas>
	</div>
	<div class="row">
		<h2>카테고리별 가격</h2>
	</div>
	<div class="row">
		<canvas id="categoryPrice"></canvas>
	</div>
</div>