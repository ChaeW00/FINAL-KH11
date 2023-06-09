package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.StatsViewDto;
@Repository
public class StatsViewRepoImpl implements StatsViewRepo{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StatsViewDto> selecList() {
		return sqlSession.selectList("ground.selectRank");
	}

	@Override
	public List<StatsViewDto> selecListTeam() {
		return sqlSession.selectList("team.selectTeamStats");
	}

	@Override
	public List<StatsViewDto> selectListMemberLevel() {
		return sqlSession.selectList("member.selectMemberLevel");
	}


}
