<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- 폰트 css -->
     <link rel="stylesheet" type="text/css" href="/static/css/font.css">
    
    <style>
        
        .top-50 {
            top: 45%!important;
        }
        a{
            text-decoration-line: none;
        }
        h3{
        	font-size:small;
        }


    </style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function() {
	  // 체크박스 처리
	  $(".check-all").change(function() {
	    var isChecked = $(this).prop("checked");
	    $(".check-all, .check-unit").prop("checked", isChecked);
	    checkCheckboxCount();
	  });

	  $(".check-unit").change(function() {
	    var checkboxCount = $(".check-unit").length;
	    var checkedCount = $(".check-unit:checked").length;
	    var isAllChecked = checkboxCount === checkedCount;
	    checkCheckboxCount();
	    $(".check-all").prop("checked", isAllChecked);
	  });

	  // 전체 삭제 버튼 클릭 시 최소 한 개의 .check-unit이 선택되어 있는지 확인
	  $(".delete-form").submit(function() {
	    var checkedCount = $(".check-unit:checked").length;
	    var totalItemCount = $(".check-unit").length;
	    if (checkedCount === totalItemCount) {
	      alert("이미지 한개는 남겨주세요.	");
	      return false;
	    }
	    var result = confirm("선택한 이미지를 삭제하시겠습니까?");
	    if (!result) return false;
	  });
	  
	  $(".delete-form").submit(function() {
		    var checkedCount = $(".check-unit:checked").length;
		    if (checkedCount === 0) {
		      alert("체크된 이미지가 없습니다.");
		      return false;
		    }
		    var totalItemCount = $(".check-unit").length;
		    if (checkedCount === totalItemCount) {
		      alert("이미지 한 개는 남겨주세요.");
		      return false;
		    }
		  });

	  function checkCheckboxCount() {
	    var checkedCount = $(".check-unit:checked").length;
	    if (checkedCount > 3) {
	      $("#mainUp").prop("disabled", true);
	    } else {
	      $("#mainUp").prop("disabled", false);
	    }
	  }
    
	  
	});

</script>

</head>
<body>
<div class="container-fluid mt-1 main-content">
  <div class="row">
    <div class="offset-md-2 col-md-8 mt-3">
      <!-- 문서 제목 (Jumbotron)-->
      <div class="row text-center" style="margin-top:10px;">
          <div class="col">
            <a href="mainList"><h2>메인 이미지 리스트</h2></a>
            <h3>등록된 이미지가 갯수에 상관없이 메인화면 리스트에 올라갑니다.</h3>
          </div>
      </div>
        
        <form action="/admin/member/mainImgDeleteAll" method="post" class="delete-form">
          <div class="row">
            <div class="col">
             <div class="row right">
             		<button type="submit" class="form-btn small neutral delete-btn" id="onlyOneDelete"
             		style="width: 112px; height:26px; padding-left:0px; border:none; color:red; background:none;">이미지 삭제</button>
                    <a class="form-btn small positive upload-btn ms-1" href="upload">이미지 등록</a>
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
                        <td>${list.imgDto.imgSize} bytes</td>
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

    <!-- Axios(비동기) CDN -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <!--Lodash cdn-->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

    
</body>
</html>