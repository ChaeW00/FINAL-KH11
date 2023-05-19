package com.kh.finalkh11.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.EntryDto;
import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.EntryRepo;
import com.kh.finalkh11.repo.MatchRepo;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.repo.TeamMemberRepo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private MemberRepo memberRepo;
	
	@Autowired
	private MatchRepo matchRepo;

	@Autowired
	private TeamMemberRepo teamMemberRepo;
	
	@Autowired
	private EntryRepo entryRepo;
	
	@GetMapping("/")
	public String home(Model model,
			HttpSession session) {
		model.addAttribute("matchList",matchRepo.selectList());
		String memberId = (String)session.getAttribute("memberId");
		
		if (memberId != null) {
			List<EntryDto> entryList = entryRepo.selectList(memberId);
			if (entryList.size() > 0) {
				model.addAttribute("entryList",entryList);
			}
		}
		return "home";
	}
	
	@GetMapping("/create")
	public String create() {
		matchRepo.createTest();
		return "redirect:/chat/";
	}
	
	@PostMapping("/login")
	public String login(
				@ModelAttribute MemberDto memberDto,//사용자가 입력한 정보
				HttpSession session
			) {
		MemberDto findDto = memberRepo.login(memberDto);
		if(findDto != null) {//로그인 성공
			session.setAttribute("memberId", findDto.getMemberId());
			session.setAttribute("memberLevel", findDto.getMemberLevel());
		}
		return "redirect:/chat/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memberId");
		session.removeAttribute("memberLevel");
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
	
	@GetMapping("/groupchat")
	public String groupChat(@RequestParam int room, Model model) {
		List<EntryDto> entryList = entryRepo.selectListMatch(room);
		model.addAttribute("entryList",entryList);
		return "groupchat";
	}
	
	
	
}
