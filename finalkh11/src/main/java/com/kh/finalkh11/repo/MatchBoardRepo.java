package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.dto.MatchWaitDto;

public interface MatchBoardRepo {
	int sequence();
	void insert(MatchBoardDto matchBoardDto);
	boolean update(MatchBoardDto matchBoardDto);
	boolean delete(int matchBoardNo);
	List<MatchBoardDto> selectList();
	MatchBoardDto selectOne(int matchBoardNo);
	List<MatchBoardDto> selectList(String column, String keyword);
	boolean updateReadCount(int matchBoardNo);
	boolean updateReplyCount(int matchBoardNo);
	List<Integer> searchTeamNo(String memberId);
	List<String> searchMemberId(int teamNo);
	void addWait(MatchWaitDto matchWaitDto);
}
