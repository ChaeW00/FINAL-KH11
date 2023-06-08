package com.kh.finalkh11.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MatchVO {
	private int matchNo;
	private String matchCity;
	private String matchLocation;
	private Date matchDate;
	private String matchTime;
	private String matchAge;
	private String matchSize;
	private String matchStatus;
	private int teamNo;
	private Integer opposingNo;
	private int matchBoardNo;
	
	private String matchBoardTitle;
	private String homeName;
	private String awayName;
}
