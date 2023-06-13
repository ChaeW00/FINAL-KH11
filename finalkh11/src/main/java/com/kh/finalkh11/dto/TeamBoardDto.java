package com.kh.finalkh11.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TeamBoardDto {
	private int boardNo;
	private int boardWriterNo;
	private int boardTeamNo;
	private String boardTitle;
	private String boardContent;
	private int boardRead;
	private int boardLike;
	private Date boardWriteDate;
	private Date boardUpdateDate;
}
