package com.kh.finalkh11.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;

@Service
public class TeamService {

	@Autowired
    private TeamMemberRepo teamMemberRepo;
	
	public int insert(TeamMemberDto teamLeader) {
		
		
		return 0;
	}

}
