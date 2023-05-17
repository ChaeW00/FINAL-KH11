package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.FreeDto;

public interface FreeRepo {
	int sequence();
	void insert(FreeDto dto);
	List<FreeDto> selectAll();
	FreeDto selectOne(int no);
}
