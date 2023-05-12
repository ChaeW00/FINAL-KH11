package com.kh.finalkh11.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.repo.MatchRepo;

@Controller
public class MatchController {
	
	@Autowired
	private MatchRepo matchRepo;

	@GetMapping("/match")
	public String match(Model model,
			@RequestParam(required = false, defaultValue = "matchTitle") String column, 
			@RequestParam(required = false, defaultValue = "") String keyword) {
		if(keyword.equals("")) {
			model.addAttribute("match.selectList", matchRepo.selectList());
		} else {
			model.addAttribute("column", column);
			model.addAttribute("keyword", keyword);
			model.addAttribute("match.selectList", matchRepo.selectList(column, keyword));
		}
		return "match";
	}
	
	@GetMapping("/match/write")
	public String write() {
		return "/match/write";
	}
	
	@PostMapping("/match/write")
	public String write(@ModelAttribute @DateTimeFormat(pattern = "yy-MM-dd")MatchDto matchDto,
			HttpSession session, RedirectAttributes attr) {
		int matchNo = matchRepo.getSequence();
//		String memberId = (String)session.getAttribute("memberId");
		String memberId = "testuser1";
		
		matchDto.setMatchNo(matchNo);
		matchDto.setMemberId(memberId);
		
		matchRepo.insert(matchDto);
		
		attr.addAttribute("matchNo", matchNo);
		return "redirect:/match/detail";
	}
	
	@GetMapping("/match/detail")
	public String detail(@RequestParam int matchNo,
			Model model, HttpSession session) {
		MatchDto matchDto = matchRepo.selectOne(matchNo);
		String memberId = (String) session.getAttribute("memberId");
		
		boolean owner = matchDto.getMemberId() != null
				&& matchDto.getMemberId().equals(memberId);
		model.addAttribute("owner", owner);
		
		String memberLevel = (String) session.getAttribute("memberLevel");
		boolean admin = memberLevel != null && memberLevel.equals("관리자");
		model.addAttribute("admin", admin);
		
		model.addAttribute("matchDto", matchDto);
		return "/match/detail";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int matchNo, Model model) {
		model.addAttribute("matchDto", matchRepo.selectOne(matchNo));
		return "/match/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute MatchDto matchDto,
			RedirectAttributes attr) {
		matchRepo.update(matchDto);
		attr.addAttribute("matchNo", matchDto.getMatchNo());
		return "redirect:/match/detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int matchNo) {
		matchRepo.delete(matchNo);
		return "redirect:match";
	}
	
	@PostMapping("/manyDelete")
	public String manyDelete(@RequestParam(value="matchNo") List<Integer> list) {
		for(int matchNo : list) {
			matchRepo.delete(matchNo);
		}
		return "redirect:match";
	}
}
