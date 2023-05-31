package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.GroundDto;

@Repository
public class GroundRepoImpl implements GroundRepo {
	@Autowired SqlSession sqlSession;
	@Override
	public List<GroundDto> selectList(String term) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ground.selectList", term);
	}
}
