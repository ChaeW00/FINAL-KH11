package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.ChatMessageDto;

public interface ChatMessageRepo {
	void add(ChatMessageDto dto);
	List<ChatMessageDto> roomMessageList(String roomName);
}
