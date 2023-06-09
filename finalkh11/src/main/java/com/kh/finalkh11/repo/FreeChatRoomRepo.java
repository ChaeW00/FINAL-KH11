package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.FreeChatRoomDto;

public interface FreeChatRoomRepo {
	FreeChatRoomDto find(String roomName);
	void insert(String roomName);
}
