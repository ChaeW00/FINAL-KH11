package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.component.RandomComponent;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.vo.AdminPaginationVO;

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

	@Override 
	public MemberDto selectEmail(String memberEmail) {
		return	sqlSession.selectOne("member.selectEmail",memberEmail);
	}

	@Override 
	public boolean delete(String memberId) {
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
	public boolean changePw(String memberId, String memberPw) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("memberPw", memberPw);
		
		int changeResult = sqlSession.update("member.changePw",param);
		
		return changeResult>0;
	}

	@Override
	public List<MemberDto> selectList(AdminPaginationVO vo) {
		return sqlSession.selectList("member.memberList",vo);
	}

	

	
	
}
