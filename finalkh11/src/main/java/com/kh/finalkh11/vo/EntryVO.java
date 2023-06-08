package com.kh.finalkh11.vo;

import lombok.Data;

@Data
public class EntryVO {
	private int entryNo;
	private int matchNo;
	private int teamNo;
	private String memberId;
	private String teamType;
	private String memberName;
	private String teamName;
	private long imgNo;
	private double memberManner;
	private int teamWin;
	private int teamLose;
}
