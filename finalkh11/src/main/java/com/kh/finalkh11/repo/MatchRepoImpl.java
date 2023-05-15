package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MatchDto;

@Repository
public class MatchRepoImpl implements MatchRepo{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void createTest() {
		sqlSession.insert("match.createTest");
	}

	@Override
	public List<MatchDto> selectList() {
		return sqlSession.selectList("match.selectList");
	}

	@Override
	public MatchDto selectOne(int matchNo) {
		return sqlSession.selectOne("match.selectOne",matchNo);
	}

}
