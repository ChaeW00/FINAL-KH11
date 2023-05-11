package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.ImgDto;

@Repository
public class ImgRepoImpl implements ImgRepo{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("img.sequence");
	}

	@Override
	public void insert(ImgDto dto) {
		sqlSession.insert("img.imgInsert",dto);
	}

}
