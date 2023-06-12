package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.FreeDto;
import com.kh.finalkh11.dto.FreeReplyDto;

@Repository
public class FreeRepoImpl implements FreeRepo {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.sequence");
	}
	
	@Override
	public void insert(FreeDto dto) {
		sqlSession.insert("free.insert", dto);
	}
	
	@Override
	public List<FreeDto> selectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("free.selectAll");
	}
	
	@Override
	public FreeDto selectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.selectOne", no);
	}
	
	@Override
	public List<FreeDto> selectByFilter(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("free.selectByFilter", param);
	}
	
	@Override
	public void delete(int freeNo) {
		sqlSession.delete("free.delete", freeNo);
	}

	@Override
	public List<FreeReplyDto> replyList(int freeReplyOrigin) {
		return sqlSession.selectList("free.replyList", freeReplyOrigin);
	}

	@Override
	public void replyInsert(FreeReplyDto freeReplyDto) {
		sqlSession.insert("free.replyInsert", freeReplyDto);
	}
	
	@Override
	public FreeReplyDto replyFind(int freeReplyNo) {
		return sqlSession.selectOne("free.replyFind", freeReplyNo);
	}
	
	@Override
	public void replyDelete(int freeReplyNo) {
		sqlSession.delete("free.replyDelete", freeReplyNo);
	}
	
	@Override
	public void replyEdit(FreeReplyDto freeReplyDto) {
		sqlSession.update("free.replyEdit", freeReplyDto);
	}
}
