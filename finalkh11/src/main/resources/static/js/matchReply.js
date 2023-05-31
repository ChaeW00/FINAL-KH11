		//댓글 처리 자바스크립트 파일
	$(function(){
		var params = new URLSearchParams(location.search);
		var matchBoardNo = params.get("matchBoardNo");
		
		//댓글 목록 불러오기
		loadList();
		
		$(".reply-insert-btn").click(function(){
			var content = $("[name=matchReplyContent]").val(); // 입력값 불러오기
			if(content.trim().length == 0) return; //의미없는 값 차단
			
			var matchReplyGroup = $(this).data("match-reply-group");
			
			$.ajax({
				url: "/rest/reply/",
				method:"post",
				data:{
					matchBoardNo: matchBoardNo,
					matchReplyGroup: matchReplyGroup,
					matchReplyContent: content
				},
				success:function(response){
					loadList();
					$("[name=matchReplyContent]").val("");
				},
				error:function(){
					alert("통신 오류 발생\n잠시 후 다시 시도하세요.");
				}
			});
		});
		
		//목록을 불러오는 함수
		function loadList() {
    $(".reply-list").empty(); // 목록 구역을 청소

    $.ajax({
        url: "/rest/reply/" + matchBoardNo,
        method: "get",
        success: function(response) {
            $(".reply-count").text(response.length); // 댓글 갯수 변경

            for (var i = 0; i < response.length; i++) {
                var template = $("#reply-template").html(); // 템플릿 불러와서
                var html = $.parseHTML(template); // 사용할 수 있게 변환

                $(html).find(".memberId").text(response[i].memberId);
                $(html).find(".matchReplyContent").text(response[i].matchReplyContent);
                $(html).find(".matchReplyTime").text(moment(response[i].matchReplyTime).format('YY-MM-DD HH:mm'));

                if (sessionId == response[i].memberId && sessionId == boardWriter) { // 세션 아이디가 댓글 작성자이면서 보드 작성자일 때
    var author = $("<span>").addClass("author ms-10").text("작성자");
    $(html).find(".memberId").append(author);
    var editButton = $("<i>").addClass("fa-solid fa-edit ms-20")
        .attr("data-match-reply-no", response[i].matchReplyNo)
        .attr("data-match-reply-content", response[i].matchReplyContent)
        .click(editReply);
    var deleteButton = $("<i>").addClass("fa-solid fa-trash ms-10")
        .attr("data-match-reply-no", response[i].matchReplyNo)
        .click(deleteReply);
    $(html).find(".memberId").append(editButton).append(deleteButton);
} else if (sessionId != response[i].memberId && sessionId == boardWriter) { // 세션 아이디가 댓글 작성자가 아니면서 보드 작성자일 때
    var adoptButton = $("<i>").addClass("fa-solid fa-check ms-10")
        .click(adoptReply);
    $(html).find(".memberId").append(adoptButton);
} else if (sessionId == response[i].memberId && sessionId != boardWriter) { // 세션 아이디가 댓글 작성자이면서 보드 작성자가 아닐 때
    var author = $("<span>").addClass("author ms-10").text("작성자");
    $(html).find(".memberId").append(author);
    var editButton = $("<i>").addClass("fa-solid fa-edit ms-20")
        .attr("data-match-reply-no", response[i].matchReplyNo)
        .attr("data-match-reply-content", response[i].matchReplyContent)
        .click(editReply);
    var deleteButton = $("<i>").addClass("fa-solid fa-trash ms-10")
        .attr("data-match-reply-no", response[i].matchReplyNo)
        .click(deleteReply);
    $(html).find(".memberId").append(editButton).append(deleteButton);
}
                		$(".reply-list").append(html); // 목록 영역에 추가
        		}
        	},
        	error: function() {
            	alert("통신 오류 발생");
        	}
    	});
	}
	
	function deleteReply() {
		var choice = window.confirm("정말 삭제하시겠습니까?\n 삭제 후 복구는 불가능합니다.");
		if (choice == false) return;

		var matchReplyNo = $(this).data("match-reply-no");
	
		$.ajax({
			url: "/rest/reply/"+matchReplyNo,
			method:"delete",
			success:function(response){
				loadList();
			},
			error:function(){
				alert("통신 오류 발생\n잠시 후에 다시 시도해 주세요");
			},
		});
	}
	
	function editReply(){
		var matchReplyNo = $(this).data("match-reply-no");
	var matchReplyContent = $(this).data("match-reply-content");

	// 새로운 textarea 요소를 생성하여 변경 내용을 입력받을 수 있도록 합니다.
	var textarea = $("<textarea>").addClass("form-input w-100").attr("placeholder", "변경 내용 작성").val(matchReplyContent);

	// 수정 버튼을 클릭할 때 실행되는 함수를 작성합니다.
	var confirmButton = $("<button>").addClass("btn btn-dark ms-10").text("수정")
		.click(function() {
			$.ajax({
				url: "/rest/reply/",
				method: "patch",
				data: {
					matchReplyNo: matchReplyNo,
					matchReplyContent: textarea.val()
				},
				success: function(response) {
					loadList();
				},
				error: function() {
					alert("통신 오류 발생\n잠시 후에 다시 시도하세요");
				}
			});
		});

	// 취소 버튼을 클릭할 때 실행되는 함수를 작성합니다.
	var cancelButton = $("<button>").addClass("btn btn-secondary").text("취소")
		.click(function() {
			$(this).parents(".reply-item").prev(".reply-item").show();
			$(this).parents(".reply-item").remove();
		});

	// 수정을 위한 입력 영역과 버튼을 감싸는 div 요소를 생성합니다.
	var div = $("<div>").addClass("reply-item right");
	div.append(textarea).append(cancelButton).append(confirmButton);

	// 현재 댓글 아이템의 이전 아이템 뒤에 수정 영역을 추가합니다.
	$(this).parents(".reply-item").hide().after(div);
	}

	function adoptReply() {
    	var matchReplyNo = $(this).data("match-reply-no");
    	var matchReplyContent = $(this).data("match-reply-content");

    	// Prepare the data for submission
    	var formData = {
        	matchReplyNo: matchReplyNo,
        	matchReplyContent: matchReplyContent
    };

    // Redirect to the adoption site with the data as query parameters
    var url = "http://localhost:8080/match/write";
    url += "?matchReplyNo=" + encodeURIComponent(formData.matchReplyNo);
    url += "&matchReplyContent=" + encodeURIComponent(formData.matchReplyContent);
    window.location.href = url;
	}
	});