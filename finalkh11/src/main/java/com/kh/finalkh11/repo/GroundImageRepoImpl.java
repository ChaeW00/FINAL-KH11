package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroundImageRepoImpl implements GroundImageRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int groundNo, int imgNo) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("groundNo", groundNo);
		param.put("imgNo", imgNo);
		
		sqlSession.insert("img.groundImageInsert", param);
	}
}