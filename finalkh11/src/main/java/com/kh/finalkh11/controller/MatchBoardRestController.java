package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.MatchWaitDto;
import com.kh.finalkh11.repo.MatchBoardRepo;

@RestController
@RequestMapping("/rest")
public class MatchBoardRestController {

	@Autowired
	private MatchBoardRepo matchBoardRepo;
	
	@GetMapping("/memberId")
	public List<String> memberId(int teamNo) {
		return matchBoardRepo.searchMemberId(teamNo);
	}
	
	@PostMapping("/matchWait")
	public void matchWait(MatchWaitDto matchWaitDto) {
		matchBoardRepo.addWait(matchWaitDto);
	}
}
