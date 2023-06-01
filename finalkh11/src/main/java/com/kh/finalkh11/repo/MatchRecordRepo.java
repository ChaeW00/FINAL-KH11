package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.MatchRecordDto;

public interface MatchRecordRepo {
	void insert(MatchRecordDto dto);
	MatchRecordDto selectOne(int matchNo);
	boolean update(MatchRecordDto dto);
}
