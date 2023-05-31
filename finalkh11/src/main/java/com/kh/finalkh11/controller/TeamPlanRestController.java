package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.PlanDto;
import com.kh.finalkh11.repo.PlanRepo;
import com.kh.finalkh11.repo.TeamMemberRepo;


@CrossOrigin
@RestController
@RequestMapping("/rest/teamPlan")
public class TeamPlanRestController {
	
	@Autowired
	private TeamMemberRepo teamMemberRepo;
	
	@Autowired
	private PlanRepo planRepo;
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/planInsert")
	public void planInsert(@RequestBody PlanDto planDto) {
		int planNo=planRepo.sequence();
		planDto.setPlanNo(planNo);
		planRepo.insert2(planDto);
	}
	
	@ResponseBody
	@RequestMapping("/planDelete")
	public void planDelete(@RequestBody int planNo) {
		planRepo.delete(planNo);
	}

}
