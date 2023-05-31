package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.FreeChatUserDto;

public interface FreeChatUserRepo {
	void insert(FreeChatUserDto dto);
	boolean check(FreeChatUserDto dto);
	void delete(FreeChatUserDto dto);
}
