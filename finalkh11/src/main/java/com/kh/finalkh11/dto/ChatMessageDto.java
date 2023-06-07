package com.kh.finalkh11.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatMessageDto {
	private int messageNo;
	private String memberId;
	private int roomNo;
	private String messageBody;
	private Timestamp messageTime;
}