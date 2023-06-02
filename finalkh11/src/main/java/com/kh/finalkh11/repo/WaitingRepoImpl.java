package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.WaitingDto;
import com.kh.finalkh11.vo.MemberInfoVO;

@Repository
public class WaitingRepoImpl implements WaitingRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(WaitingDto waitingDto) {
		sqlSession.insert("waiting.insert", waitingDto);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("waiting.sequence");
	}

	@Override
	public List<MemberInfoVO> memberInfo(int teamNo) {
		return sqlSession.selectList("waiting.memberInfo", teamNo);
	}

	@Override
	public boolean delete(String memberId) {
		return sqlSession.delete("waiting.remove", memberId) > 0;
	}
}
