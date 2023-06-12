package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeDto {
	private int freeNo;
	private String freeWriter;
	private int groundNo;
	private int scheduleNo;
	private String freeTitle;
	private String freeContent;
	private Date freeDate;
	private String freeGender;
	private String freeSize;
	private int freeFee;
	private int freeNeedNum;
	private String freeLevel;	
}
