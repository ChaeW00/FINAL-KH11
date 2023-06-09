package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.FreeChatMessageDto;

@Repository
public class FreeChatMessageRepoImpl implements FreeChatMessageRepo {
	@Autowired private SqlSession sqlSession;

	@Override
	public void add(FreeChatMessageDto dto) {
		// TODO Auto-generated method stub
		
	}
	
	
}
