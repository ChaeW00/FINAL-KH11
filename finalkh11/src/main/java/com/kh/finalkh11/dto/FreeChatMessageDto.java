package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeChatMessageDto {
	private int messageNo;
	private String memberId;
	private String roomName;
	private String messageBody;
	private Date messageTime;
}
