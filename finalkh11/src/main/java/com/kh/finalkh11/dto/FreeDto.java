package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeDto {
	private int freeNo;
	private String freeWriter;
	private String freeTitle;
	private String freeContent;
	private int teamNo;
	private Date writeTime;
}
