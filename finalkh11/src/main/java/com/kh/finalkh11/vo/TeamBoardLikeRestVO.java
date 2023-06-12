package com.kh.finalkh11.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamBoardLikeRestVO {
	
	// 필드
	// - 요청 및 응답 관련
	private int boardNo; // 게시글 번호
	private int teamMemberNo; // 회원 번호
	private int isLike; // 좋아요 여부
	
	// - 응답 관련
	private int boardLike; // 좋아요 갯수
}

