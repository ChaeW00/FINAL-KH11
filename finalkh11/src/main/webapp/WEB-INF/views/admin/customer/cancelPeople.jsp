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
        	<h2 style="margin-bottom:30px;">인원이 부족해서 경기가 취소 될 수도 있나요?</h2>
        	<pre style="border: none; background-color: transparent; padding: 0; margin: 0; white-space: pre-wrap;">
플랩 매치는 매치 시작 전 날과 당일에 신청이 많아요. 

진행 여부는 늦어도 매치 시작 1시간 30분 전까지는 안내(카카오톡 혹은 문자)드리고 있고, 
인원 미달로 경기가 취소되는 경우 참가비 전액을 돌려드립니다.
        	</pre>
      </div>
    </div>  
  </div>
</div>


    </body>
</html>