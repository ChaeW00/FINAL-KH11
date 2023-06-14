package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.TeamBoardDto;
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
		sqlSession.insert("team.insert", teamDto);
		
	}
 
	@Override //팀 리스트
	public List<TeamDto> selectList() { 
		List<TeamDto> teamList = sqlSession.selectList("team.selectList");
		for(TeamDto dto : teamList) {
			int waitingCount = sqlSession.selectOne("waiting.getWaitingCountByTeamNo", dto.getTeamNo());
			int memberCount = sqlSession.selectOne("teamMember.selectTeamMemberCount", dto.getTeamNo());
			dto.setWaitingCount(waitingCount);
			dto.setTeamMemberCount(memberCount);
		}
		return teamList;
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
    // 추가 모든 팀 조회(팀장인팀+팀원인팀)
    @Override
    public List<TeamDto> selectTeamByLeaderId(String memberId) {
        return sqlSession.selectList("team.selectTeamByLeaderId", memberId);
    }
	@Override
	public boolean plusWin(int teamNo) {
		return sqlSession.update("team.plusWin",teamNo) > 0;
	}
	@Override
	public boolean plusLose(int teamNo) {
		return sqlSession.update("team.plusLose",teamNo) > 0;
	}
	@Override
	public boolean minusWin(int teamNo) {
		return sqlSession.update("team.minusWin",teamNo) > 0;
	}
	@Override
	public boolean minusLose(int teamNo) {
		return sqlSession.update("team.minusLose",teamNo) > 0;
	}

	@Override
	public List<TeamDto> selectByFilter(Map<String, Object> param) {
		// TODO Auto-generated method stub
		List<TeamDto> teamList = sqlSession.selectList("team.selectByFilter", param);
		for(TeamDto dto : teamList) {
			int waitingCount = sqlSession.selectOne("waiting.getWaitingCountByTeamNo", dto.getTeamNo());
			int memberCount = sqlSession.selectOne("teamMember.selectTeamMemberCount", dto.getTeamNo());
			dto.setWaitingCount(waitingCount);
			dto.setTeamMemberCount(memberCount);
		}
		return teamList;
	}
	@Override
	public List<TeamDto> teamList() {
		return sqlSession.selectList("matchboard.teamList");
	}
}
