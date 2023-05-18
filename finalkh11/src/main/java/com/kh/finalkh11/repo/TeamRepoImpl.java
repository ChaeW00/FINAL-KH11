package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.TeamDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class TeamRepoImpl implements TeamRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	//팀 시퀀스번호
	@Override
	public int sequence() {
		return sqlSession.selectOne("team.sequence");
	}
	@Override //팀 생성
	public void insert(TeamDto teamDto) {
		sqlSession.insert("team.add", teamDto);
		
	}
 
	@Override //팀 리스트
	public List<TeamDto> selectList() { 
		return sqlSession.selectList("team.selectList");
	}

	@Override //팀 상세
	public TeamDto selectOne(int teamNo) {
		return sqlSession.selectOne("team.selectOne", teamNo);
	}

	@Override // 팀 정보수정
	public boolean update(TeamDto teamDto) {
		int result = sqlSession.update("team.edit", teamDto);
		return result > 0;
	}
	@Override // 팀 삭제
	public boolean delete(int teamNo) {
		int result = sqlSession.delete("team.remove", teamNo);
		return result > 0;
	}
//	@Override  //전적기록
//	public void record(TeamDto teamdto) {
//		sqlSession.update("team.record", teamdto);
//	}

//	@Override //팀 일정 업데이트
//	public void schedule(TeamDto teamdto) {
//		sqlSession.update("team.schedule", teamdto);
//	}

}
