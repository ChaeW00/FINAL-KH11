<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/cosmo/bootstrap.min.css">
<!-- summernote cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script type="text/javascript">
    $(function(){
        $('#matchBoardContent').summernote({
            placeholder: '내용 작성',
            tabsize: 4,//탭키를 누르면 띄어쓰기 몇 번 할지
            height: 250,//최초 표시될 높이(px)
            toolbar: [//메뉴 설정
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']]
            ],
            callbacks: {
				onImageUpload: function(files) {
					//console.log(files);
					if(files.length != 1) return;
					
					//console.log("비동기 파일 업로드 시작");
					//[1] FormData [2] processData [3] contentType
					var fd = new FormData();
					fd.append("attach", files[0]);
					
					$.ajax({
						url:contextPath+"/rest/attachment/upload",
						method:"post",
						data:fd,
						processData:false,
						contentType:false,
						success:function(response){
							//console.log(response);
							
							//서버로 전송할 이미지 번호 정보 생성
							var input = $("<input>").attr("type", "hidden")
																.attr("name", "attachmentNo")
																.val(response.attachmentNo);
							$("form").prepend(input);
							
							//에디터에 추가할 이미지 생성
							var imgNode = $("<img>").attr("src", "/rest/attachment/download/"+response.attachmentNo);
							//var imgNode = $("<img>").attr("src", "/rest/attachment/download?attachmentNo="+response.attachmentNo);
							$("#matchBoardContent").summernote('insertNode', imgNode.get(0));
						},
						error:function(){}
					});
					
				}
			}
        });
    });
</script>

<form action="edit" method="post" autocomplete="off">
<input type="hidden" name="matchBoardNo" value="${matchBoardDto.matchBoardNo}">

	<div class="container-fluid mt-4">

		<!-- 제목 -->
		<div class="row mt-4">
			<div class="offset-md-2 col-md-8">
				<h2>기존글 수정</h2>
			</div>
		</div>
	
		<div class="row mt-2">
			<div class="offset-md-2 col-md-8">
				<label class="form-label w-100">말머리</label>
				<input name="matchBoardHead" class="form-control" value="모집글" readonly>
				<c:if test="${memberLevel == '관리자'}">
					<select name="matchBoardHead" class="form-select">
						<option value="모집글">모집글</option>
						<option value="공지">공지</option>
					</select>
				</c:if>
			</div>
		</div>
	
		<div class="row mt-2">
			<div class="offset-md-2 col-md-8">
				<label>제목<i class="fa-solid fa-asterisk"></i></label>
				<input name="matchBoardTitle" required class="form-control">
			</div>
		</div>
	
		<div class="row mt-4">
			<div class="offset-md-2 col-md-8">
				<label>내용<i class="fa-solid fa-asterisk"></i></label>
				<textarea name="matchBoardContent" id="matchBoardContent" required class="form-control w-100" style="min-height: 300px;"></textarea>
			</div>
		</div>
	
		<div class="row mt-3">
			<div class="offset-md-2 col-md-8">
				<button type="submit" class="btn btn-primary w-100">변경하기</button>
			</div>
		</div>
		
		<div class="row mt-1">
			<div class="offset-md-2 col-md-8">
				<a href="/matchBoard/list" class="btn btn-light w-100">목록으로</a>
			</div>
		</div>
	</div>

</form> 