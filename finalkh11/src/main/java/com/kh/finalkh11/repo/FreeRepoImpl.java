package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.FreeDto;

@Repository
public class FreeRepoImpl implements FreeRepo {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.sequence");
	}
	
	@Override
	public void insert(FreeDto dto) {
		// TODO Auto-generated method stub
		dto.setFreeNo(this.sequence());
		sqlSession.insert("free.insert", dto);
	}
	
	@Override
	public List<FreeDto> selectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("free.selectAll");
	}
	
	@Override
	public FreeDto selectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.selectOne", no);
	}
	
	@Override
	public List<FreeDto> selectByFilter(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("free.selectByFilter", param);
	}
}
