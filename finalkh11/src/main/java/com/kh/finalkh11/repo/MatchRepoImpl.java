package com.kh.finalkh11.repo;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.vo.MatchVO;

@Repository
public class MatchRepoImpl implements MatchRepo{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MatchDto matchDto) {
		sqlSession.insert("match.add", matchDto);
	}

	@Override
	public boolean update(MatchDto matchDto) {
		return sqlSession.update("match.update", matchDto) > 0;
	}

	@Override
	public boolean delete(int matchNo) {
		return sqlSession.delete("match.remove", matchNo) > 0;
	}

	@Override
	public MatchDto selectOne(int matchNo) {
		return sqlSession.selectOne("match.selectOne", matchNo);
	}

	@Override
	public List<MatchDto> selectList() {
		return sqlSession.selectList("match.selectList");
	}

	@Override
	public List<MatchDto> selectList(String column, String keyword) {
		Map param = Map.of("column", column, "keyword", keyword);
		return sqlSession.selectList("match.selectList", param);
	}

	@Override
	public int getSequence() {
		return sqlSession.selectOne("match.getSequence");
	}

	@Override
	public int teamNo(String memberId) {
		return sqlSession.selectOne("match.teamNo", memberId);
	}

	@Override
	public MatchDto matchBoardNo(int matchBoardNo) {
		return sqlSession.selectOne("match.matchBoardNo", matchBoardNo);
	}

	@Override
	public List<MatchDto> selectByDate(Date matchDate) {
		return sqlSession.selectList("match.selectByDate",matchDate);
	}

	@Override
	public List<MatchVO> selectByDateWithVO(Date matchDate) {
		return sqlSession.selectList("match.selectByDateWithVO",matchDate);
	}

	@Override
	public List<MatchVO> selectListWithVO() {
		return sqlSession.selectList("match.selectListWtihVO");
	}

	@Override
	public MatchVO selectOneWithVO(int matchNo) {
		return sqlSession.selectOne("match.selectOneWithVO", matchNo);
	}

	@Override
	public MatchDto selectByMatchBoardNo(int matchBoardNo) {
		return sqlSession.selectOne("match.selectByMatchBoardNo",matchBoardNo);
	}

	@Override
	public boolean statusComplete(MatchDto matchDto) {
		return sqlSession.update("match.statusComplete",matchDto) > 0;
	}

	@Override
	public MatchVO selectByMatchBoardNoWithVO(int matchBoardNo) {
		return sqlSession.selectOne("match.selectByMatchBoardNoWithVO",matchBoardNo);
	}

	@Override
	public boolean statusEnd(int matchNo) {
		return sqlSession.update("match.statusEnd",matchNo) > 0;
	}

}
