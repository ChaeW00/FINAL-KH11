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

      </div>
    
     
      <div class="helpMenu">
        <h3 style=" margin-bottom: 30px;">매치 취소</h3>
        <ul>
          
            <li>
              <a href="#">
              <div>신청한 경기를 취소하고 싶어요</div>
              </a>
            </li>

            <li>
              <a href="#">
              <div>비(눈)이 와서 취소하고 싶어요</div>
              </a>
            </li>
          
            <li>
              <a href="#">
              <div>인원이 부족해서 경기가 취소 될 수도 있나요?</div>
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