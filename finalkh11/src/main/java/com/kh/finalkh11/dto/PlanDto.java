package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PlanDto {
	private int planNo;
	private int teamMemberNo;
	private int teamNo;
	private String planTitle;
	private String planStart;
	private String planEnd;
	private boolean planAllday;

}
