package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MatchReplyDto;

public interface MatchReplyRepo {
	int sequence();
	void insert(MatchReplyDto matchReplyDto);
	boolean update(MatchReplyDto matchReplyDto);
	boolean delete(int matchReplyNo);
	List<MatchReplyDto> selectList(int matchBoardNo);
	MatchReplyDto selectOne(int matchReplyNo);
}
