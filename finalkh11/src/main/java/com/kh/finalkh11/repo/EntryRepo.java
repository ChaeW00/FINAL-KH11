package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.EntryDto;

public interface EntryRepo {
	int sequence();
	void insert(EntryDto dto);
}
