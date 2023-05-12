package com.kh.finalkh11.Repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MatchDto;

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

	

}