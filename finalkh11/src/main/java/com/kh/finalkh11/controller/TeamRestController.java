package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;

@RestController
@RequestMapping("/rest/team")
public class TeamRestController {
	
	@Autowired
	private TeamRepo teamRepo;
	
	@Autowired
	private TeamMemberRepo teamMemberRepo;
	
	@PatchMapping("/plusWin/{teamNo}")
	public void plusWin(@PathVariable int teamNo) {
		teamRepo.plusWin(teamNo);
	}
	
	@PatchMapping("/minusWin/{teamNo}")
	public void minusWin(@PathVariable int teamNo) {
		teamRepo.minusWin(teamNo);
	}
	
	@PatchMapping("/plusLose/{teamNo}")
	public void plusLose(@PathVariable int teamNo) {
		teamRepo.plusLose(teamNo);
	}
	
	@PatchMapping("/minusLose/{teamNo}")
	public void minusLose(@PathVariable int teamNo) {
		teamRepo.minusLose(teamNo);
	}
	
	@GetMapping("/memberList/{teamNo}")
	public List<TeamMemberDto> getTeamMemberList(@PathVariable int teamNo) {
		return teamMemberRepo.getTeamMemberList(teamNo);
	}
	
	@GetMapping("/teamList/{memberId}")
	public List<Integer> selectTeamByMemberId(@PathVariable String memberId){
		return teamMemberRepo.selectTeamByMemberId(memberId);
	}
}
