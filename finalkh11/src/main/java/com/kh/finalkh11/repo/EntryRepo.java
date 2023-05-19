package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.EntryDto;

public interface EntryRepo {
	int sequence();
	void insert(EntryDto dto);
	List<EntryDto> selectList(String memberId); 
	List<EntryDto> selectListMatch(int matchNo);
}
