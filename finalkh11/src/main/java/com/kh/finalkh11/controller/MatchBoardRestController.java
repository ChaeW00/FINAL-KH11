package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.EntryDto;
import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.repo.EntryRepo;
import com.kh.finalkh11.repo.MatchBoardRepo;
import com.kh.finalkh11.repo.MatchRepo;

@RestController
@RequestMapping("/rest/matchBoard")
public class MatchBoardRestController {
	
	@Autowired
	private MatchBoardRepo matchBoardRepo;
	
	@Autowired
	private MatchRepo matchRepo;

	@Autowired
	private EntryRepo entryRepo;
	
	@GetMapping("/seq")
	public int getMatchBoardSequence() {
		return matchBoardRepo.sequence();
	}
	
	@GetMapping("/match/seq")
	public int getMatchSequence() {
		return matchRepo.getSequence();
	}

	@GetMapping("/entry/seq")
	public int getEntrySequence() {
		return entryRepo.getSequence();
	}
	
	@PostMapping("/")
	public void insertMatchBoard(@RequestBody MatchBoardDto dto) {
		matchBoardRepo.insert(dto);
	}
	
	@PostMapping("/match")
	public void insertMatch(@RequestBody MatchDto dto) {
		matchRepo.insert(dto);
	}
	
	@PostMapping("/entry")
	public void insertEntry(@RequestBody EntryDto dto) {
		entryRepo.insert(dto);
	}
	

}