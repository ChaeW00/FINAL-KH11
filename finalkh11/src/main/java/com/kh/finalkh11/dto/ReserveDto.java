package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReserveDto {
	private int reserveNo;
	private String memberId;
	private int groundNo;
	private Date reserveDate;
	private int scheduleNo;
	private String reserveStatus;
}