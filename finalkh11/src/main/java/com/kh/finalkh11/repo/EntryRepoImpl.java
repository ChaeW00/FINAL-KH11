package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.EntryDto;

@Repository
public class EntryRepoImpl implements EntryRepo{

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void insert(EntryDto dto) {
		sqlSession.insert("entry.insert",dto);
	}


	@Override
	public int sequence() {
		return sqlSession.selectOne("entry.sequence");
	}


	@Override
	public List<EntryDto> selectList(String memberId) {
		return sqlSession.selectList("entry.selectList",memberId);
	}


	@Override
	public List<EntryDto> selectListMatch(int matchNo) {
		return sqlSession.selectList("entry.selectListMatch",matchNo);
	}

}
