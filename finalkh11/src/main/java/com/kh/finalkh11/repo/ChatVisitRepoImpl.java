package com.kh.finalkh11.repo;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.ChatVisitDto;

@Repository
public class ChatVisitRepoImpl implements ChatVisitRepo{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectVisit(String memberId, int roomNo) {
		Map<String, Object> param = new HashMap<>();
	    param.put("memberId", memberId);
	    param.put("roomNo", roomNo);
	    return sqlSession.selectOne("chatVisit.selectVist", param);
	}

	@Override
	public void insertVisit(ChatVisitDto dto) {
		sqlSession.insert("chatVisit.insertVisit",dto);
		
	}

}