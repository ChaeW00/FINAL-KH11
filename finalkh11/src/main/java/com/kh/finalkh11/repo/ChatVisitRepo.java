package com.kh.finalkh11.repo;

import java.sql.Timestamp;

import com.kh.finalkh11.dto.ChatVisitDto;

public interface ChatVisitRepo {
	Timestamp selectVisitTime(String memberId, int roomNo);
	void insertVisitTime(ChatVisitDto dto);
	boolean updateVisitTime (ChatVisitDto dto);
}
