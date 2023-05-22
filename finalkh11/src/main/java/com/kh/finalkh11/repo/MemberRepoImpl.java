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
	public MemberDto selectOne(String memberId) {
		return sqlSession.selectOne("member.memberLogin",memberId);
	}

	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.memberJoin",memberDto);
		
	}

	@Override //이메일 상세 조회
	public MemberDto selectEmail(String memberEmail) {
		return	sqlSession.selectOne("member.selectEmail",memberEmail);
	}

	@Override //회원탈퇴
	public boolean delete(String memberId) {
		return sqlSession.delete("member.memberDelete",memberId)>0;
	}

	@Override
	public boolean update(MemberDto memberDto) {
		return sqlSession.update("member.memberUpdate",memberDto)>0;
	}








	
	
}
