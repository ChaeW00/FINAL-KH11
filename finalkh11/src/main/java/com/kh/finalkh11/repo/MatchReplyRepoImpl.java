package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MatchReplyDto;

@Repository
public class MatchReplyRepoImpl implements MatchReplyRepo{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("matchreply.sequence");
	}

	@Override
	public void insert(MatchReplyDto matchReplyDto) {
		sqlSession.insert("matchreply.add", matchReplyDto);
	}

	@Override
	public boolean update(MatchReplyDto matchReplyDto) {
		return sqlSession.update("matchreply.edit", matchReplyDto) > 0;
	}

	@Override
	public boolean delete(int matchReplyNo) {
		return sqlSession.delete("matchreply.remove", matchReplyNo) > 0;
	}

	@Override
	public List<MatchReplyDto> selectList(int matchBoardNo) {
		return sqlSession.selectList("matchreply.selectList", matchBoardNo);
	}

	@Override
	public MatchReplyDto selectOne(int matchReplyNo) {
		return sqlSession.selectOne("matchreply.selectOne", matchReplyNo);
	}

}
