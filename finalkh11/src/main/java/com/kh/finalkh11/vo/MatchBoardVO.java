package com.kh.finalkh11.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MatchBoardVO {
	private int matchBoardNo;
	private String memberId;
	private String matchBoardTitle;
	private String matchBoardContent;
	private Date matchBoardTime;
	private int matchBoardRead;
	private String matchBoardCity;
	private String matchBoardLocation;
	private Date matchBoardDate;
	private String matchBoardTime2;
	private String matchBoardAge;
	private String matchBoardSize;
	private String matchBoardStatus;
	private int matchBoardVideo;
	
	private String memberName;
	
}
