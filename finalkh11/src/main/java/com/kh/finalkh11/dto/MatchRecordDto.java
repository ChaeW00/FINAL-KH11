package com.kh.finalkh11.dto;

import lombok.Data;

@Data
public class MatchRecordDto {
	private int recordNo;
	private int matchNo;
	private int homeNo;
	private int awayNo;
	private int homeScore;
	private int awayScore;
}
