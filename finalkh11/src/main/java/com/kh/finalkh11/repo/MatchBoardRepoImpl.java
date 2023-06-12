package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.vo.MatchBoardVO;
import com.kh.finalkh11.vo.MatchInMemberInfoVO;
import com.kh.finalkh11.vo.TeamInMemberInfoVO;

@Repository
public class MatchBoardRepoImpl implements MatchBoardRepo{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("matchboard.sequence");
	}

	@Override
	public void insert(MatchBoardDto matchBoardDto) {
		sqlSession.insert("matchboard.add", matchBoardDto);
	}

	@Override
	public boolean update(MatchBoardDto matchBoardDto) {
		return sqlSession.update("matchboard.edit", matchBoardDto) > 0;
	}

	@Override
	public boolean delete(int matchBoardNo) {
		return sqlSession.delete("matchboard.remove", matchBoardNo) > 0;
	}

	@Override
	public List<MatchBoardDto> selectList() {
		return sqlSession.selectList("matchboard.selectList");
	}

	@Override
	public MatchBoardDto selectOne(int matchBoardNo) {
		return sqlSession.selectOne("matchboard.selectOne", matchBoardNo);
	}

	@Override
	public List<MatchBoardDto> selectList(String column, String keyword) {
		Map param = Map.of("column", column, "keyword", keyword);
		return sqlSession.selectList("matchboard.search", param);
	}

	@Override
	public List<MatchBoardDto> selectNoticeList(int begin, int end) {
		Map param = Map.of("begin", 1, "end", 3);
		return sqlSession.selectList("matchboard.selectNoticeList", param);
	}

	@Override
	public boolean updateReadCount(int matchBoardNo) {
		return sqlSession.update("matchboard.updateReadCount", matchBoardNo) > 0;
	}

	@Override
	public boolean updateReplyCount(int matchBoardNo) {
		return sqlSession.update("matchboard.updateReplyCount", matchBoardNo) > 0;
	}

	@Override
	public List<Integer> searchTeamNo(String memberId) {
		return sqlSession.selectList("matchboard.searchTeamNo", memberId);
	}

	@Override
	public List<String> searchMemberId(int teamNo) {
		return sqlSession.selectList("matchboard.searchMemberId", teamNo);
	}

	@Override
	public boolean statusComplete(MatchBoardDto dto) {
		return sqlSession.update("matchboard.statusComplete",dto) > 0;
	}

	@Override
	public List<MatchBoardVO> selectListwithVO() {
		return sqlSession.selectList("matchboard.selectListwithVO");
	}

	@Override
	public MatchBoardVO selectOnewithVO(int matchBoardNo) {
		return sqlSession.selectOne("matchboard.selectOnewithVO",matchBoardNo);
	}

	@Override
	public List<MatchInMemberInfoVO> matchWithMember() {
		return sqlSession.selectList("matchboard.matchWithMember");
	}

	@Override
	public boolean statusEnd(int matchBoardNo) {
		return sqlSession.update("matchboard.statusEnd",matchBoardNo) > 0;
	}

	@Override
	public boolean matchVideoUpdate(MatchBoardDto matchBoardDto) {
		return sqlSession.update("matchboard.matchVideoUpdate",matchBoardDto) > 0;
	}
	
	@Override
	public List<TeamDto> teamList() {
		return sqlSession.selectList("matchboard.teamList");
	}

}