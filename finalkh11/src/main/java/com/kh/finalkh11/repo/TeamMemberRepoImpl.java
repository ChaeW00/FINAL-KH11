package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.TeamMemberDto;

@Repository
public class TeamMemberRepoImpl implements TeamMemberRepo {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TeamMemberDto> selectTeamMember(int teamNo) {
		return sqlSession.selectList("teamMember.selectTeamMember",teamNo);
	}

	@Override
	public TeamMemberDto findTeam(String memberId) {
		return sqlSession.selectOne("teamMember.findTeam",memberId);
	}

}
