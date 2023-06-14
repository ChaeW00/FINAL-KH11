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
        <div class="col bg-light text-light p-4 rounded">
          <h1>MATCH-UP 궁금증 해결!</h1>
        </div>
      </div>
    
      <div class="helpMenu">
        <h3>카테고리</h3>
        <ul>
          
            <li>
              <a href="/admin/customer/cs/cancel">
              <div>매치 취소</div>
              </a>
            </li>
          
            <li>
              <a href="/admin/customer/cs/progress">
              <div>매치 진행</div>
              </a>
            </li>
          
            <li>
              <a href="/admin/customer/cs/reservation">
              <div>구장 예약</div>
              </a>
            </li>
          
            <li>
              <a href="/admin/customer/cs/service">
              <div>서비스</div>
              </a>
            </li>
          
          
            <li>
              <a href="/admin/customer/cs/application">
              <div>매치 신청</div>
              </a>
            </li>
          
            <li>
              <a href="/admin/customer/cs/facility">
              <div>시설</div>
              </a>
            </li>
          
          
            <li>
              <a href="/admin/customer/cs/refund">
              <div>환불</div>
              </a>
            </li>
          
          
        </ul>
      </div>
      <div class="helpMenu">
        <h3>자주 묻는 질문</h3>
        <ul>
          
            <li>
              <a href="/admin/customer/cs/cancel/match">
              <div>신청한 경기를 취소하고 싶어요</div>
              </a>
            </li>

            <li>
              <a href="/admin/customer/cs/reservation/refund">
              <div>환불하고 싶어요</div>
              </a>
            </li>
          
            <li>
              <a href="/admin/customer/cs/cancel/season">
              <div>눈, 비 오는 날 MATCH-UP은?</div>
              </a>
            </li>
          
        </ul>
      </div>
    </div>  
  </div>
</div>


    </body>
</html>