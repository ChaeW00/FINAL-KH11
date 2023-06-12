package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.vo.AdminPaginationVO;

@Repository
public class MemberRepoImpl implements MemberRepo{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;
	

	@Override
	public MemberDto selectOne(String memberId) {
		return sqlSession.selectOne("member.memberLogin",memberId);
	}

	@Override //암호화된 회원가입
	public void insert(MemberDto memberDto) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();	
		String encrypt = encoder.encode(memberDto.getMemberPw());
		memberDto.setMemberPw(encrypt);
		sqlSession.insert("member.memberJoin",memberDto);
	}

	@Override 
	public MemberDto selectEmail(String memberEmail) {
		return	sqlSession.selectOne("member.selectEmail",memberEmail);
	}

	@Override 
	public boolean delete(String memberId) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String encrypt = encoder.encode(memberId);
		
		return sqlSession.delete("member.memberDelete",memberId)>0;
	}

	@Override
	public boolean update(MemberDto memberDto) {
		return sqlSession.update("member.memberUpdate",memberDto)>0;
	}

	@Override
	public String findId(MemberDto memberDto) {
		return sqlSession.selectOne("member.findId",memberDto);
	}

	@Override
	public String findPw(MemberDto memberDto) {
		return sqlSession.selectOne("member.findPw",memberDto);
	}

	@Override
	public boolean changePw(String memberId, String memberPw) {// String memberPw(변경할 비밀번호)
		Map<String, Object> param = new HashMap<>();
		
		PasswordEncoder encoder = new BCryptPasswordEncoder();	
		String encrypt = encoder.encode((CharSequence)memberPw);
		
		param.put("memberId", memberId);
		param.put("memberPw", encrypt);
		
		int changeResult = sqlSession.update("member.changePw", param);
		
		return changeResult > 0;
	}

	@Override
	public List<MemberDto> selectList(AdminPaginationVO vo) {
		return sqlSession.selectList("member.memberList", vo);
	}

	@Override
	public int selectCount(AdminPaginationVO vo) {
		return sqlSession.selectOne("member.countSearchMembers",vo);
	}

	@Override
	public boolean updateManner(MemberDto memberDto) {
		return sqlSession.update("member.mannerUpdate",memberDto) > 0;
	}
	
	@Override
	public boolean adminChange(MemberDto memberDto) {
		return sqlSession.update("member.adminMemberListChange",memberDto)>0;
	}
}
