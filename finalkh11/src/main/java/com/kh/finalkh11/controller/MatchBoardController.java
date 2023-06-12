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
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.repo.MainImgRepo;
import com.kh.finalkh11.repo.MatchBoardRepo;

import com.kh.finalkh11.vo.MainImgConnectVO;
import com.kh.finalkh11.vo.SearchVO;

@Controller
@RequestMapping("/matchBoard")

public class MatchBoardController {
	@Autowired
	private MatchBoardRepo matchBoardRepo; 
	
	@Autowired
	private MainImgRepo mainImgRepo;
	
	@Autowired
	private GroundRepo groundRepo;
 
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false, defaultValue="matchBoardTitle") String column,
			@RequestParam(required = false, defaultValue="") String keyword) {
		
		List<MainImgConnectVO> mainImgList = mainImgRepo.mainImgList();
		
		if(keyword.equals("")) {
			model.addAttribute("list", matchBoardRepo.selectList());
		}
		else {
			model.addAttribute("column", column);
			model.addAttribute("keyword", keyword);
			model.addAttribute("list", matchBoardRepo.selectList(column, keyword));
		}
		
		model.addAttribute("mainImgList", mainImgList);
		
		
		return "/matchBoard/list";
	}
	
	@GetMapping("/write")
	public String write() {
	    return "/matchBoard/write";
	}
	
	
	@GetMapping("/detail")
	public String detail(@RequestParam int matchBoardNo,HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		MatchBoardDto matchBoardDto = matchBoardRepo.selectOne(matchBoardNo);
		
		boolean owner = matchBoardDto.getMemberId() != null &&
						matchBoardDto.getMemberId().equals(memberId);
		
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
		
		return "/matchBoard/detail";
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
	
	@GetMapping("/search")
	public String totalSearch(@RequestParam String keyword, Model model) {
		
		model.addAttribute("keyword", keyword);
		
		List<SearchVO> searchList = groundRepo.totalSearch(keyword);
		model.addAttribute("searchList", searchList);
		
		return "search";
	}
	
	@GetMapping("/rate")
    public String rate(Model model) {
        List<TeamDto> teamList = matchBoardRepo.teamList();
        model.addAttribute("teamList", teamList);
        return "/matchBoard/rate";
    }
}