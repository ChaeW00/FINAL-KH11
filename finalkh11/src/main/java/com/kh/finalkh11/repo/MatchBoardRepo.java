package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.vo.MatchBoardVO;
import com.kh.finalkh11.vo.MatchInMemberInfoVO;

public interface MatchBoardRepo {
	int sequence();
	void insert(MatchBoardDto matchBoardDto);
	boolean update(MatchBoardDto matchBoardDto);
	boolean delete(int matchBoardNo);
	List<MatchBoardDto> selectList();
	MatchBoardDto selectOne(int matchBoardNo);
	List<MatchBoardDto> selectList(String column, String keyword);
	List<MatchBoardDto> selectNoticeList(int begin, int end);
	boolean updateReadCount(int matchBoardNo);
	boolean updateReplyCount(int matchBoardNo);
	List<Integer> searchTeamNo(String memberId);
	List<String> searchMemberId(int teamNo);
	boolean statusComplete(MatchBoardDto dto);
	List<MatchBoardVO> selectListwithVO();
	MatchBoardVO selectOnewithVO(int matchBoardNo);
	List<MatchInMemberInfoVO> matchWithMember();	
	boolean statusEnd(int matchBoardNo);
	boolean matchVideoUpdate(MatchBoardDto matchBoardDto);
	List<TeamDto> teamList();
}