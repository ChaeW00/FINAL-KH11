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
	public MemberDto login(MemberDto dto) {
		MemberDto findDto = sqlSession.selectOne("member.find",dto);
		if (findDto == null) return null;
		if (findDto.getMemberPw().equals(dto.getMemberPw())) {
			return findDto;
		}
		return null;
	}

	@Override
	public String findTeam(String memberId) {
		return sqlSession.selectOne("member.findTeam",memberId);
	}

}
