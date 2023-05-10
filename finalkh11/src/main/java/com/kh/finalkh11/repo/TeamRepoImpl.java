package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.TeamDto;

@Repository
public class TeamRepoImpl implements TeamRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(TeamDto teamDto) {
		sqlSession.insert("team.add", teamDto);
		
	}

	@Override
	public List<TeamDto> selectList() {
		return sqlSession.selectList("team.selectList");
	}

	@Override
	public TeamDto selectOne(int teamNo) {
		return sqlSession.selectOne("team.selectOne", teamNo);
	}

	@Override
	public boolean update(TeamDto teamDto) {
		int result = sqlSession.update("team.edit", teamDto);
		return result > 0;
	}
	@Override
	public boolean delete(int teamNo) {
		int result = sqlSession.delete("team.remove", teamNo);
		return result > 0;
	}


}
