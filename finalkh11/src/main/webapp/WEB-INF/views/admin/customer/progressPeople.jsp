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
        <h3 style=" margin-bottom: 30px; ">매치 진행</h3>
        	<p style="border-top: 1px solid #ddd;"></p>
        	<h2 style="margin-bottom:30px;">신청하려는 매치의 인원이 궁금해요</h2>
        	<pre style="border: none; background-color: transparent; padding: 0; margin: 0; white-space: pre-wrap;">
인원 현황이 궁금한 매치를 클릭하면 상세 페이지에서 아래 기준에 따라 확인할 수 있어요. 

*신청하기 버튼 좌측 문구

마감까지 N자리 남았어요! - 신청 마감까지 N자리가 남았음을 의미해요. 
진행 확정까지 N자리 남음 - N명이 더 신청하면 진행이 확정됨을 의미해요. 
지금 신청하면 진행 확정이 빨라져요!  - 신청자가 6명 미만임을 의미해요.
        	</pre>
      </div>
    </div>  
  </div>
</div>





    </body>
</html>