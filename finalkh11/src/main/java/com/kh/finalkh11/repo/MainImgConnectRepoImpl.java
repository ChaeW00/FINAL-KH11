package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainImgConnectRepoImpl implements MainImgConnectRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int imgNo, int mainNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("imgNo", imgNo);
		param.put("mainNo", mainNo);
		
		sqlSession.insert("img.insertConnect", param);
	}
}
