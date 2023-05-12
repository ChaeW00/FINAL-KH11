package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.EntryDto;

public interface EntryRepo {
	int getSequence();
	void insert(EntryDto entryDto);
	EntryDto selectOne(int entryNo);
	boolean delete(int entryNo);
}
