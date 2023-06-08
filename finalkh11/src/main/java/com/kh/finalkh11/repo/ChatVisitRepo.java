package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.ChatVisitDto;

public interface ChatVisitRepo {
	int selectVisit(String memberId, int roomNo);
	void insertVisit(ChatVisitDto dto);
}