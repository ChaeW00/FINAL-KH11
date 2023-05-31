package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MatchRecordDto;

@Repository
public class MatchRecordRepoImpl implements MatchRecordRepo {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MatchRecordDto dto) {
		sqlSession.insert("matchRecord.insert",dto);
	}

	@Override
	public MatchRecordDto selectOne(int matchNo) {
		return sqlSession.selectOne("matchRecord.selectOne",matchNo);
	}

	@Override
	public boolean update(MatchRecordDto dto) {
		return sqlSession.update("matchRecord.update",dto) > 0;
	}
	
}
