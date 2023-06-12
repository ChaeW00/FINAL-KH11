package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BoardDto {
	// 필드
	private int boardNo;
	private int boardWriterNo;
	private int boardTeamNo;
	private String boardContent;
	private int boardLike;
	private Date boardWritedate;
	private Date boardUpdatedate;
	private String boardState;

}
 