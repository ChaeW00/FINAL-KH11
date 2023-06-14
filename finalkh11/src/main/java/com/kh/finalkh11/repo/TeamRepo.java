package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;

import com.kh.finalkh11.dto.TeamBoardDto;
import com.kh.finalkh11.dto.TeamDto;
//import com.kh.finalkh11.vo.MyTeamVO;

public interface TeamRepo {
	int sequence();//team_no 시퀀스 번호 발행
	void insert(TeamDto teamDto); // 팀 생성
	List<TeamDto> selectList();
//	List<TeamDto> selecList(String column, String keyword);
	TeamDto selectOne(int teamNo);
	boolean delete(int teamNo);
	boolean update(TeamDto teamdto);
	List<TeamDto> selectTeamByLeaderId(@Param("memberId")String memberId);

	boolean plusWin(int teamNo);
	boolean plusLose(int teamNo);
	boolean minusWin(int teamNo);
	boolean minusLose(int teamNo);
	List<TeamDto> teamList();
	List<TeamDto> selectByFilter(Map<String, Object> param);
}
