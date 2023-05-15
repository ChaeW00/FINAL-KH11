package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MatchDto;

public interface MatchRepo {
	void createTest();
	List<MatchDto> selectList();
	MatchDto selectOne(int matchNo);
}
