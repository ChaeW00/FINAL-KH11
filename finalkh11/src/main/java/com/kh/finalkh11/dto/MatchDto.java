package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MatchDto {
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
}
