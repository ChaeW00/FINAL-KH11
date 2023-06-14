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
        <h3 style=" margin-bottom: 30px; ">매치 취소</h3>
        	<p style="border-top: 1px solid #ddd;"></p>
        	<h2 style="margin-bottom:30px;">비(눈)이 와서 취소하고 싶어요</h2>
        	<pre style="border: none; background-color: transparent; padding: 0; margin: 0; white-space: pre-wrap; border-bottom: 1px solid #ddd;">
1mm 이상의 강수 예보가 있다면 [강수 안내] 알림톡(카카오톡 혹은 문자)을 발송합니다.

알림톡을 받으신 경우, 매치 시작 1시간 30분 전까지 취소하면 전액 환불합니다.

당일 예보 변동이 심한 점을 고려해 실시간으로 예보를 확인하고 매치 시작  4시간 전까지는 알림톡을 발송해드립니다. 

*매치 시작 1시간 30분 내에 취소하거나 무단 불참하면 이용이 제한될 수 있습니다.

▶취소 방법: 마이 페이지 > '신청 내역'에서 직접 취소
▶환불 규정: 매치 시작 1시간 30분 전까지 취소했을 경우
▶기준 강수: 기상청 날씨 누리 기준 해당 지역 1mm 이상 예보가 있는 경우
        	</pre>
      </div>
    </div>  
  </div>
</div>



    </body>
</html>