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
      <div class="row text-center">

      </div>
    
     
      <div class="helpMenu">
        <h3 style=" margin-bottom: 30px;">매치 신청</h3>
        <ul>
          
            <li>
              <a href="/admin/customer/cs/application/age">
              <div>나이 제한이 있나요?</div>
              </a>
            </li>

            <li>
              <a href="/admin/customer/cs/application/goalkeeper">
              <div>고정 골키퍼가 가능한가요?</div>
              </a>
            </li>
            
            <li>
              <a href="/admin/customer/cs/application/atmosphere">
              <div>마감된 경기에 대기 신청이 가능한가요?</div>
              </a>
            </li>
            
        </ul>
      </div>
    </div>  
  </div>
</div>

    </body>
</html>