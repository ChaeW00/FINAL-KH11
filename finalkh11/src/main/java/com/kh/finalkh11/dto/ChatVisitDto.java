package com.kh.finalkh11.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatVisitDto {
	private String memberId;
	private int roomNo;
	private Timestamp visitTime;
}
