package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeDto {
	private int freeNo;
	private String freeWriter;
	private String freeTitle;
	private String freeContent;
	private Date freeDate;
	private int freeAge;
	private String freeGround;
	private String freeGender;
	private int freeSize;
	private int freeFee;
	private String freeSkill;	
}
