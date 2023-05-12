package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.EntryDto;

@Repository
public class EntryRepoImpl implements EntryRepo{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getSequence() {
		return sqlSession.selectOne("entry.getSequence");
	}
	
	@Override
	public void insert(EntryDto entryDto) {
		sqlSession.insert("entry.add", entryDto);
	}

	@Override
	public boolean delete(int entryNo) {
		return sqlSession.delete("entry.remove", entryNo) > 0;
	}

	@Override
	public EntryDto selectOne(int entryNo) {
		return sqlSession.selectOne("entry.selectOne", entryNo);
	}
}
