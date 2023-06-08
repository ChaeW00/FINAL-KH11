package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.FreeChatUserDto;

@Repository
public class FreeChatUserRepoImpl implements FreeChatUserRepo {
	@Autowired private SqlSession sqlSession;

	@Override
	public void insert(FreeChatUserDto dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("freeChatUser.insert", dto);
	}

	@Override
	public boolean check(FreeChatUserDto dto) {
		// TODO Auto-generated method stub
		FreeChatUserDto findUser = sqlSession.selectOne("freeChatUser.selectOne", dto);
		if(findUser == null) return false;
		else return true;
	}

	@Override
	public void delete(FreeChatUserDto dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("freeChatUser.delete", dto);
		
	}
	
	
	
}
