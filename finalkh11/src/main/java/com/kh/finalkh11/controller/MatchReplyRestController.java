package com.kh.finalkh11.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.MatchReplyDto;
import com.kh.finalkh11.repo.MatchBoardRepo;
import com.kh.finalkh11.repo.MatchReplyRepo;

@RestController
@RequestMapping("/rest/reply")
public class MatchReplyRestController {
	
	@Autowired
	private MatchReplyRepo matchReplyRepo;
	
	@Autowired
	private MatchBoardRepo matchBoardRepo;
	
	@GetMapping("/{matchBoardNo}")
	public List<MatchReplyDto> list(@PathVariable int matchBoardNo) {
	    return matchReplyRepo.selectList(matchBoardNo);
	}
	
	@PostMapping("/")
	public void write(HttpSession session, @ModelAttribute MatchReplyDto matchReplyDto) {
		int matchReplyNo = matchReplyRepo.sequence();
		
		// 작성자 설정
		String memberId = (String) session.getAttribute("memberId");

		matchReplyDto.setMatchReplyNo(matchReplyNo);
		matchReplyDto.setMemberId(memberId);
		
		// 등록
		matchReplyRepo.insert(matchReplyDto);
		
		// 댓글 수 갱신
		matchBoardRepo.updateReplyCount(matchReplyDto.getMatchBoardNo());
	}
	
	@DeleteMapping("/{matchReplyNo}")
	public void delete(@PathVariable int matchReplyNo) {
		MatchReplyDto matchReplyDto = matchReplyRepo.selectOne(matchReplyNo);
		matchReplyRepo.delete(matchReplyNo);
		matchBoardRepo.updateReplyCount(matchReplyDto.getMatchBoardNo());
	}
	
	@PatchMapping("/")
	public void edit(@ModelAttribute MatchReplyDto matchReplyDto) {
		matchReplyRepo.update(matchReplyDto);
	}
		
}
