package com.kh.finalkh11.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.EntryDto;
import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.repo.EntryRepo;
import com.kh.finalkh11.repo.MatchRepo;
import com.kh.finalkh11.repo.TeamMemberRepo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private MatchRepo matchRepo;

	@Autowired
	private TeamMemberRepo teamMemberRepo;
	
	@Autowired
	private EntryRepo entryRepo;
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("matchList",matchRepo.selectList());
		
		return "home";
	}
	
	@GetMapping("/create")
	public String create() {
		matchRepo.createTest();
		return "redirect:/chat/";
	}
	
	@GetMapping("/match")
	public String match(@RequestParam int matchNo,
			Model model) {
		MatchDto dto = matchRepo.selectOne(matchNo);
		model.addAttribute("matchTitle",dto.getMatchTitle());
		model.addAttribute("matchNo",dto.getMatchNo());
		model.addAttribute("homeList",teamMemberRepo.selectTeamMember(dto.getTeamNo()));
		model.addAttribute("awayList",teamMemberRepo.selectTeamMember(dto.getOpposingNo()));
		return "match";
	}
	
	@PostMapping("/createChat")
	public String createChat(
			@RequestParam String homeMember0,
			@RequestParam String homeMember1,
			@RequestParam String homeMember2,
			@RequestParam String awayMember0,
			@RequestParam String awayMember1,
			@RequestParam String awayMember2,
			@RequestParam int matchNo,
			RedirectAttributes attr
			) {
		
		String[] homeList = {homeMember0, homeMember1, homeMember2};
		String[] awayList = {awayMember0, awayMember1, awayMember2};
		int homeNo = teamMemberRepo.findTeam(homeMember0).getTeamNo();
		int awayNo = teamMemberRepo.findTeam(awayMember0).getTeamNo();
		
		for(int i = 0; i <3; i++) {
			EntryDto dto = new EntryDto();
			dto.setEntryNo(entryRepo.sequence());
			dto.setMatchNo(matchNo);
			dto.setMemberId(homeList[i]);
			dto.setTeamNo(homeNo);
			dto.setTeamType("home");
			entryRepo.insert(dto);
		}
		
		for(int i = 0; i <3; i++) {
			EntryDto dto = new EntryDto();
			dto.setEntryNo(entryRepo.sequence());
			dto.setMatchNo(matchNo);
			dto.setMemberId(awayList[i]);
			dto.setTeamNo(awayNo);
			dto.setTeamType("away");
			entryRepo.insert(dto);
		}
		
		return "redirect:/chat/";
	}

	
	
}
