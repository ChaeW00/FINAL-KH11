<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원목록</title>

    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- bootswatch cdn-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
    
    
    <style>
        
        .top-50 {
            top: 45%!important;
        }
        a{
            text-decoration-line: none;
        }


    </style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	$(function() {
	    // 체크박스 처리
	    $(".check-all").change(function() {
	        var isChecked = $(this).prop("checked");
	        $(".check-all, .check-unit").prop("checked", isChecked);
	    })
	    $(".check-unit").change(function() {
	        var checkboxCount = $(".check-unit").length;
	        var checkedCount = $(".check-unit:checked").length;
	        var isAllChecked = checkboxCount == checkedCount;
	        $(".check-all").prop("checked", isAllChecked);
	    })
	    // 선택 이미지 삭제버튼 경고창
	    $(".delete-btn").click(function() {
	        var checkedCount = $(".check-unit:checked").length;
	        if(checkedCount == 0) {
	            alert("삭제할 이미지를 선택해주세요.");
	            return false;
	        }
	        var result = confirm("이미지를 삭제하시겠습니까?");
	        if(!result) return false;
	    })
	    // 개별 이미지 삭제버튼 경고창
	    $(".single-delete-btn").click(function() {
	        var result = confirm("이미지를 삭제하시겠습니까?");
	        if(!result) return false;
	    })
	})
</script>

</head>
<body>
<div class="container-fluid mt-4">
  <div class="row">
    <div class="offset-md-2 col-md-8 mt-3">
      <!-- 문서 제목 (Jumbotron)-->
      <div class="row text-center">
          <div class="col">
            <a href="mainList"><h2>메인 이미지 리스트</h2></a>
          </div>
      </div>
        
        <form action="/admin/member/mainImgDeleteAll" method="post" class="delete-form">
          <div class="row">
            <div class="col">
             <div class="row right">
             		<button type="submit" class="form-btn small neutral delete-btn"
             		style="width:118px; height:26px; padding-left:0px;">이미지 삭제</button>
                    <a class="form-btn small positive upload-btn" href="upload">이미지 등록</a>
                </div>
              <table class="table table-hover" >
                <thead>
                    <tr>
                        <th>
                           <input type="checkbox" class="check-all">
                        </th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>파일명</th>
                        <th>파일 형식</th>
                        <th>용량</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="list" items="${list}">
                    <tr>
                    	<td>
                          	<input type="checkbox" class="check-unit" name="imgNo" value="${list.imgDto.imgNo}">
                        </td>
                        <td>${list.mainImgDto.mainNo}</td>
                        <td>${list.mainImgDto.mainTitle}</td>
                        <td>${list.imgDto.imgName}</td>
                        <td>${list.imgDto.imgType}</td>
                        <td>${list.imgDto.imgSize} kb</td>
                        <td>
                            <a href="/admin/member/imgDelete?imgNo=${list.imgDto.imgNo}" onclick="return confirm('정말 삭제하겠습니까?')">삭제</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          </form>
        
     </div>
    </div>  

  </div>


    <!-- 부트스트랩 cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>    
    
    <!-- Axios(비동기) CDN -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <!--Lodash cdn-->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

    
</body>
</html>






