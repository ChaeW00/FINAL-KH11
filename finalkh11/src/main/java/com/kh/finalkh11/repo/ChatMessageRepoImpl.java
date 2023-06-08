package com.kh.finalkh11.repo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.ChatMessageDto;

@Repository
public class ChatMessageRepoImpl implements ChatMessageRepo{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void add(ChatMessageDto dto) {
		sqlSession.insert("chatMessage.add", dto);
	}
	
	@Override
	public List<ChatMessageDto> roomMessageList(int roomNo) {
		return sqlSession.selectList("chatMessage.roomMessage", roomNo);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("chatMessage.sequence");
	}
	
}