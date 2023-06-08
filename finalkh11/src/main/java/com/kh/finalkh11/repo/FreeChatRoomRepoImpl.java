package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.FreeChatRoomDto;

@Repository
public class FreeChatRoomRepoImpl implements FreeChatRoomRepo {
	@Autowired private SqlSession sqlSession;

	@Override
	public FreeChatRoomDto find(String roomName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("freeChatRoom.find", roomName);
	}

	@Override
	public void insert(String roomName) {
		// TODO Auto-generated method stub
		sqlSession.insert("freeChatRoom.insert", roomName);
	}
	
	
	
}
