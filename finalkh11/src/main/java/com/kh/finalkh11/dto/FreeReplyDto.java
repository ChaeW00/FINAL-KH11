package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class FreeReplyDto {
	private int freeReplyNo;//댓글번호
	private String freeReplyWriter;//댓글작성자
	private String freeReplyContent;//댓글내용
	private Date freeReplyCtime;//작성시각
	private Date freeReplyUtime;//수정시각
	private int freeReplyOrigin;//용병글번호
}
