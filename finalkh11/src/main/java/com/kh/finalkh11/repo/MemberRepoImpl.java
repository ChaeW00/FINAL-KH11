package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MemberDto;

@Repository
public class MemberRepoImpl implements MemberRepo{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto memberLogin(String memberId) {
		return sqlSession.selectOne("member.memberLogin",memberId);
	}




	
	
}
