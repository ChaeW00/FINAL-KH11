<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
      <link rel="stylesheet" type="text/css" href="/static/css/cs.css">
      <!-- 부트스트랩 테마 cdn -->
      
      <style>
      	h1{
      		color:#212121;
      	}
      </style>
    </head>
    <body>

          
<div class="container-fluid mt-4">
  <div class="row">
    <div class="offset-md-2 col-md-8">
      <div class="row text-center" style="margin-top:110px;">
        <div class="col bg-warning text-light p-4 rounded">
          <h1>MATCH-UP 고객센터</h1>
        </div>
      </div>
    
      <div class="helpMenu">
        <h3>카테고리</h3>
        <ul>
          
            <li>
              <a href="#">
              <div>매치 취소</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>매치 진행</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>구장 예약</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>서비스</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>공지사항</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>매치 신청</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>시설</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>매너/제재</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>환불</div>
              </a>
            </li>
          
          
        </ul>
      </div>
      <div class="helpMenu">
        <h3>자주 묻는 질문</h3>
        <ul>
          
            <li>
              <a href="#">
              <div>매치 신청은 어떻게 하나요?</div>
              </a>
            </li>

            <li>
              <a href="#">
              <div>공지사항</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>눈, 비 오는 날 MATCH-UP은?</div>
              </a>
            </li>
          
        </ul>
      </div>
    </div>  
  </div>
</div>








        

        

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>    
    </body>
</html>