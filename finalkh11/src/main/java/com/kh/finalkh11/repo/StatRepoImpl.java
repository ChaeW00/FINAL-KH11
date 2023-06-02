package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.StatDto;

@Repository
public class StatRepoImpl implements StatRepo{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StatDto> list() {
		return sqlSession.selectList("ground.goundCount");
	}
	
}
