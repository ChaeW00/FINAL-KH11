package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MemberDto;

@Repository
public class MemberRepoImpl implements MemberRepo {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto findDto = sqlSession.selectOne("member.find", memberDto);
		if(findDto == null) return null;//아이디 없음
		
		if(findDto.getMemberPw().equals(memberDto.getMemberPw())) {
			return findDto;//정보 일치
		}
		return null;//비밀번호 불일치
	}
	
}