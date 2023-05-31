package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MatchDto;

public interface MatchRepo {
	void insert(MatchDto matchDto);
	boolean update(MatchDto matchDto);
	boolean delete(int matchNo);
	MatchDto selectOne(int matchNo);
	List<MatchDto> selectList();
	List<MatchDto> selectList(String column, String keyword);
	int getSequence();
	int teamNo(String memberId);
	MatchDto matchBoardNo(int matchBoardNo);
}
