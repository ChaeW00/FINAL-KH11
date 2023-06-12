package com.kh.finalkh11.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamBoardVO {
	
	// 필드
	// - TeamBoardDto 관련
	private int boardNo;
	private int boardWriterNo;
	private String boardContent;
	private int boardLike; // 좋아요 갯수
	private Date boardWritedate;
	
	// - TeamMemberDto 관련
	private int TeamMemberNo;
	private String TeamMemberName;
	private String TeamMemberLevel;
	
	// - 댓글 갯수
	private int replyCount;
	
	// - 좋아요 여부
	private int isLike;
	
	// - 회원 프로필 번호
	private int imgNo;
}


