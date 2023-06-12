package com.kh.finalkh11.repo;

import java.sql.Date;
import java.util.List;

import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.vo.MatchVO;

public interface MatchRepo {
	void insert(MatchDto matchDto);
	boolean update(MatchDto matchDto);
	boolean delete(int matchNo);
	MatchDto selectOne(int matchNo);
	MatchDto selectByMatchBoardNo(int matchBoardNo);
	MatchVO selectOneWithVO(int matchNo);
	List<MatchDto> selectList();
	List<MatchDto> selectList(String column, String keyword);
	List<MatchDto> selectByDate(Date matchDate);
	List<MatchVO> selectListWithVO();
	List<MatchVO> selectByDateWithVO(Date matchDate);
	int getSequence();
	int teamNo(String memberId);
	MatchDto matchBoardNo(int matchBoardNo);
	boolean statusComplete(MatchDto matchDto);
	boolean statusEnd(int matchNo);
	MatchVO selectByMatchBoardNoWithVO(int matchBoardNo);
}
