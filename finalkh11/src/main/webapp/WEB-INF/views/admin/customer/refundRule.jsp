<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/sandstone/bootstrap.min.css" rel="stylesheet" >
      <link rel="stylesheet" type="text/css" href="/static/css/cs.css">
      <!-- 부트스트랩 테마 cdn -->
              <!-- 폰트 css -->
     <link rel="stylesheet" type="text/css" href="/static/css/font.css">
      <style>
      	h1{
      		color:#212121;
      	}
      </style>
    </head>
    <body>

          
<div class="container-fluid mt-4 main-content">
  <div class="row">
    <div class="offset-md-2 col-md-8">
      <div class="row text-center" style="margin-top:10px;">

      </div>
    
     
      <div class="helpMenu">
        <h3 style=" margin-bottom: 30px; ">환불</h3>
        	<p style="border-top: 1px solid #ddd;"></p>
        	<h2 style="margin-bottom:30px;">구장 예약 환불 규정이 궁금해요</h2>
        	<pre style="border: none; background-color: transparent; padding: 0; margin: 0; white-space: pre-wrap; ">
구장 예약은 취소 시 아래 기준에 따라 환불됩니다. 

[일반]
-결제 후 30분 이내 취소 시 100% 환불 (하루 1회)
-7일 전 취소 시 100% 환불
-5일 전 취소 시 80% 환불
-3일 전 취소 시 50% 환불
-2일 전 ~ 대관 당일 환불 불가
(캐시는 규정에 따라 자동 환급되고, 계좌 환불은 충전 내역에서 잔액 환불 버튼을 눌러주세요.)

[특수]
천재지변
-당일 천재지변으로 인해 구장 이용이 불가한 경우 100% 환불
(적용기준: 호우경보,대설경보,태풍주의보,태풍경보)

우천
-시간 당 5mm 이상 시 날짜 변경 가능
(기준: 당일 이용 2시간 전 기상청 날씨누리 해당 주소지 기준)
단순 변심에 의한 날짜 변경은 불가
        	</pre>
      </div>
    </div>  
  </div>
</div>

    </body>
</html>