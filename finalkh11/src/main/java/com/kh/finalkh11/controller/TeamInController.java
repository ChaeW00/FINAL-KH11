package com.kh.finalkh11.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;
import com.kh.finalkh11.repo.WaitingRepo;
import com.kh.finalkh11.vo.MemberInfoVO;
import com.kh.finalkh11.vo.TeamInMemberInfoVO;

@Controller
@RequestMapping("/team_in")
public class TeamInController {

	private final TeamRepo teamRepo;
	private final TeamMemberRepo teamMemberRepo;

	@Autowired
	public TeamInController(TeamRepo teamRepo, TeamMemberRepo teamMemberRepo) {
		this.teamRepo = teamRepo;
		this.teamMemberRepo = teamMemberRepo;
	}
	
	@Autowired
	private WaitingRepo waitingRepo;
	
	@GetMapping("/member/{teamNo}")
	public String memberList(@PathVariable int teamNo, Model model, HttpSession session) {
		// 현재 로그인한 사용자의 정보를 가져옴
		String memberId = (String) session.getAttribute("memberId"); // 세션에서 로그인한 사용자의 ID를 가져옴
		
		// 현재 로그인한 사용자가 해당 팀에 가입한 사용자인지 체크
		boolean isTeamMember = teamMemberRepo.checkIfTeamMember(memberId, teamNo);

		// 접근 권한이 없는 경우에는 에러 페이지로 이동하도록 처리
//		if (!isTeamMember) {
//			return "error"; // 접근 권한이 없을 때 error.jsp로 이동
//		}
		// 팀 멤버 리스트 조회
		TeamDto teamDto = teamRepo.selectOne(teamNo); // teamNo에 해당하는 팀 정보 조회
		int count = teamMemberRepo.selectTeamMemberCount(teamNo);
		List<TeamMemberDto> teamMemberList = teamMemberRepo.getTeamMemberList(teamNo); // teamNo에 해당하는 팀 멤버 리스트 조회
		
		//가입 신청 리스트 조회
		List<MemberInfoVO> memberInfo = waitingRepo.memberInfo(teamNo);
		
		//팀 멤버 정보 조회
		List<TeamInMemberInfoVO> teamMemberInfoVO = teamMemberRepo.teamMemberInfo(teamNo);
		
		model.addAttribute("teamMemberInfo", teamMemberInfoVO);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("teamDto", teamDto);
		model.addAttribute("teamMemberList", teamMemberList);
		model.addAttribute("count", count);
		
		return "team_in/member";
	}
	
	//가입 수락
    @PostMapping("/member/joinAccept")
    public String joinAccept(
    		@ModelAttribute TeamMemberDto teamMemberDto,
    		@RequestParam int teamNo,
    		RedirectAttributes attr) {
    	int teamMemberNo = teamMemberRepo.sequence();
    	teamMemberDto.setTeamMemberNo(teamMemberNo);
    	
    	teamMemberRepo.insert2(teamMemberDto);
    	waitingRepo.delete(teamMemberDto.getMemberId());
    	attr.addAttribute("teamNo", teamNo);
    	
    	return "redirect:{teamNo}";
    }
    
    //가입 거절
	@PostMapping("/member/joinReject")
	public String joinReject(
			@RequestParam String memberId,
			@RequestParam int teamNo,
    		RedirectAttributes attr) {
		waitingRepo.delete(memberId);
		
		attr.addAttribute("teamNo", teamNo);
		
		return "redirect:{teamNo}";
	}
	
	//팀 추방
	@GetMapping("/member/kick")
	public String delete(
			@RequestParam int teamMemberNo,
			@RequestParam(required = false) int teamNo,
			RedirectAttributes attr) {
		teamMemberRepo.deleteTeamMember(teamMemberNo);

		attr.addAttribute("teamNo", teamNo);
		
		return "redirect:{teamNo}";
	}	
}