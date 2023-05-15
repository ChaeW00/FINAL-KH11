package com.kh.finalkh11.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;

@RestController
@RequestMapping("/rest")
public class ChatRestController {
	@Autowired
	private TeamMemberRepo repo;
	
	@GetMapping("/member/{teamNo}")
	public List<TeamMemberDto> teamMember(@PathVariable int teamNo){
		return repo.selectTeamMember(teamNo);
	}
}
