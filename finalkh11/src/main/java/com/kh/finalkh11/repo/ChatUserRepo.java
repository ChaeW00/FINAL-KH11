package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.ChatUserDto;

public interface ChatUserRepo {
	void add(ChatUserDto dto);
	List<ChatUserDto> find(String memberId);
	boolean check(ChatUserDto dto);
}
