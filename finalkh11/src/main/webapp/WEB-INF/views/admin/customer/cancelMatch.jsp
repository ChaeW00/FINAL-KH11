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
        	<h2 style="margin-bottom:30px;">신청한 경기를 취소하고 싶어요</h2>
        	<pre style="border: none; background-color: transparent; padding: 0; margin: 0; white-space: pre-wrap; border-bottom: 1px solid #ddd;">
신청한 경기는 마이페이지 - 신청내역을 통해 직접 취소할 수 있습니다. 

[매치 참가 취소 시 환불 기준]

-결제 후 30분 이내 : 무료 취소 (하루 1회 / 매치 시작 90분 전까지)
-매치 2일 전 : 무료 취소
-매치 1일 전 : 80% 환급
-매치 시작 90분 전까지: 20% 환급
-매치 시작 90분 이내 : 0% 환급 (환급 불가)

----------------------------------------------

[그 외 취소 기준]

- 기상 악화 매치
매치 시작 90분 전까지 무료 취소 가능(기상악화로 설정되어 메세지가 발송 된 매치만 해당 합니다)

-쿠폰 참가 매치
매치 시작 90분 전까지 취소 시 반환 가능

*결제 후 30분 이내 취소는 매치 시작 90분 전까지만 가능합니다.

*취소 없이 무단 불참하면 서비스 이용에 제한이 있을 수 있습니다.
        	</pre>
      </div>
    </div>  
  </div>
</div>


    </body>
</html>