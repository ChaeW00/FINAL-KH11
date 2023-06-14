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
        <h3 style=" margin-bottom: 30px;">매치 진행</h3>
        <ul>
          
            <li>
              <a href="/admin/customer/cs/progress/weather">
              <div>경기 중에 비가 많이 오면 어떻게 되나요?</div>
              </a>
            </li>

            <li>
              <a href="/admin/customer/cs/progress/people">
              <div>신청하려는 매치의 인원이 궁금해요</div>
              </a>
            </li>
          
            <li>
              <a href="/admin/customer/cs/progress/how">
              <div>Match-Up의 진행 방식이 궁금해요</div>
              </a>
            </li>
          
        </ul>
      </div>
    </div>  
  </div>
</div>

    </body>
</html>