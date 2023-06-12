package com.kh.finalkh11.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CalendarDto {
	private String memberId;
	private int teamNo;
	private int matchNo;

}