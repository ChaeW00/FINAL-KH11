package com.kh.finalkh11.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.repo.MatchBoardRepo;
import com.kh.finalkh11.repo.MatchRepo;

@Controller
@RequestMapping("/matchBoard")
public class MatchBoardController {
	@Autowired
	private MatchBoardRepo matchBoardRepo;
	
	@Autowired
	private MatchRepo matchRepo;
	
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false, defaultValue="matchBoardTitle") String column,
			@RequestParam(required = false, defaultValue="") String keyword) {
		if(keyword.equals("")) {
			model.addAttribute("list", matchBoardRepo.selectList());
		}
		else {
			model.addAttribute("column", column);
			model.addAttribute("keyword", keyword);
			model.addAttribute("list", matchBoardRepo.selectList(column, keyword));
		}
		
		model.addAttribute("noticeList", matchBoardRepo.selectNoticeList(1, 3));
		
		return "/matchBoard/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int matchBoardNo,
			Model model, HttpSession session) {
		//사용자가 작성자인지 판정 후 jsp에 전달
		MatchBoardDto matchBoardDto = matchBoardRepo.selectOne(matchBoardNo);
		String boardWriter = (String) session.getAttribute("memberId");
		
		boolean owner = matchBoardDto.getMemberId() != null &&
						matchBoardDto.getMemberId().equals(boardWriter);
		model.addAttribute("owner", owner);
		
		//사용자가 관리자인지 판정 후 jsp에 전달
		String memberLevel = (String) session.getAttribute("memberLevel");
		boolean admin = memberLevel != null && memberLevel.equals("관리자");
		model.addAttribute("admin", admin);
		
		MatchDto matchDto = matchRepo.matchBoardNo(matchBoardNo);
		model.addAttribute("matchDto",matchDto);
		
		//조회수 증가
		if(!owner) { //내가 작성한 글이 아니라면 (시나리오 1번)
			//시나리오 2번 진행
			Set<Integer> memory = (Set<Integer>) session.getAttribute("memory");
			if(memory == null) {
				memory = new HashSet<>();
			}
			
			if(!memory.contains(matchBoardNo)) { //읽었는가의 여부 판단(없음)
				matchBoardRepo.updateReadCount(matchBoardNo);
				matchBoardDto.setMatchBoardRead(matchBoardDto.getMatchBoardRead() + 1);
				memory.add(matchBoardNo); //저장소에 추가
			}
			session.setAttribute("memory", memory); // 저장소 갱신
		}
		model.addAttribute("matchBoardDto", matchBoardDto);
		return "/matchBoard/detail";
	}
	
	@GetMapping("/write")
	public String write() {
		return "/matchBoard/write";
	}
	
	@PostMapping("/write")
	public String write(
			@ModelAttribute MatchBoardDto matchBoardDto,
			HttpSession session, RedirectAttributes attr) {
		int matchBoardNo = matchBoardRepo.sequence();
		String memberId = (String)session.getAttribute("memberId");
		
		matchBoardDto.setMatchBoardNo(matchBoardNo);
		matchBoardDto.setMemberId(memberId);
		
		matchBoardRepo.insert(matchBoardDto);
		
		attr.addAttribute("matchBoardNo", matchBoardNo);
		
		session.setAttribute("matchBoardNo", matchBoardNo);
		return "redirect:/matchBoard/detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int matchBoardNo) {
		matchBoardRepo.delete(matchBoardNo);
		return "redirect:/matchBoard/list";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int matchBoardNo, Model model) {
		model.addAttribute("matchBoardDto", matchBoardRepo.selectOne(matchBoardNo));
		return "/matchBoard/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute MatchBoardDto matchBoardDto,
			RedirectAttributes attr) {
		matchBoardRepo.update(matchBoardDto);
		attr.addAttribute("matchBoardNo", matchBoardDto.getMatchBoardNo());
		return "redirect:/matchBoard/detail";
	}
	
	
	//관리자를 위한 전체 삭제 기능
	public String deleteAll(
			@RequestParam(value="matchBoardNo") List<Integer> list) {
		for(int matchBoardNo : list) {
			matchBoardRepo.delete(matchBoardNo);
		}
		return "redirect:/matchBoard/list";
	}
	
}