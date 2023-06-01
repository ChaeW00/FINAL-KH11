package com.kh.finalkh11.dto;

import lombok.Data;

@Data
public class WaitingDto {
	private int waitingNo;
	private String memberId;
	private int teamNo;
	private String memberStatus;
	private String introduction;
}