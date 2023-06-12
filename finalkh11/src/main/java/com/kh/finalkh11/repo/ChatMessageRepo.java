package com.kh.finalkh11.repo;

import java.sql.Timestamp;
import java.util.List;

import com.kh.finalkh11.dto.ChatMessageDto;

public interface ChatMessageRepo {
	int sequence();
	void add(ChatMessageDto dto);
	List<ChatMessageDto> roomMessageList(int roomNo);
}