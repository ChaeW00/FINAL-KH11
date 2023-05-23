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

import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;
import com.kh.finalkh11.service.TeamService;
import com.kh.finalkh11.vo.MyTeamVO;

@Controller
@RequestMapping("/team")
public class TeamController {

	@Autowired
	private TeamService teamService;
	
    @Autowired
    private TeamRepo teamRepo;

    @Autowired
    private TeamMemberRepo teamMemberRepo;

    @GetMapping("/insert")
    public String showInsertTeamForm(Model model) {
        model.addAttribute("teamDto", new TeamDto());
        return "team/insert"; // 이것은 팀 생성 폼을 위한 jsp 파일
    }

    @PostMapping("/insert")
//    public String insertTeam(@ModelAttribute TeamDto teamDto, @RequestParam String memberId) {
    public String insertTeam(@ModelAttribute TeamDto teamDto, HttpSession session) {
    	// 로그 출력
        System.out.println(teamDto);

    	String memberId = (String) session.getAttribute("memberId");
        int teamNo = teamRepo.sequence();
        teamDto.setTeamNo(teamNo);
        teamDto.setTeamLeader(memberId);
        teamRepo.insert(teamDto);

        // 팀장설정
        TeamMemberDto teamLeader = new TeamMemberDto();
        teamLeader.setTeamMemberNo(teamMemberRepo.sequence());
        teamLeader.setTeamNo(teamNo);
        teamLeader.setMemberId(memberId);
        teamLeader.setTeamMemberLevel("팀장");
//        int result = teamService.insert(teamLeader);
        teamMemberRepo.insert(teamLeader);

        return "redirect:/team/insertFinish";
    }
	@GetMapping("/insertFinish")
	public String insertFinish() {
		return "team/insertFinish";
	}
//    @GetMapping("/list2")
//    public String listTeams(Model model) {
//        List<TeamDto> teamList = teamRepo.selectList();
//        model.addAttribute("teamList", teamList);
//        return "team/list"; // 
//    }

    @GetMapping("/detail/{no}")
    public String detailTeam(@PathVariable("no") int teamNo, Model model) {
        TeamDto teamDto = teamRepo.selectOne(teamNo);
        model.addAttribute("team", teamDto);
        return "team/detail"; // 
    }

    @PostMapping("/update")
    public String updateTeam(@ModelAttribute TeamDto teamDto) {
        boolean result = teamRepo.update(teamDto);
        if (result) {
            return "redirect:/team/detail/" + teamDto.getTeamNo();
        } else {
            // handle error
            return "redirect:/team/detail/" + teamDto.getTeamNo();
        }
    }

    @PostMapping("/delete/{no}")
    public String deleteTeam(@PathVariable("no") int teamNo) {
        boolean result = teamRepo.delete(teamNo);
        if (result) {
            return "redirect:/team/list";
        } else {
            // handle error
            return "redirect:/team/detail/" + teamNo;
        }
    }
	// 내가 가입한 팀
	@GetMapping("/myTeam")
	public String myTeam(Model model, HttpSession session, @ModelAttribute MyTeamVO myTeamVO) {
		String memberId = (String) session.getAttribute(SessionConstant.memberId);
	
		List<MyTeamVO> myTeam = teamRepo.myTeam(memberId);
		if(myTeam.get(0) == null) {
		return "redirect:myTeamFail";
		}
		model.addAttribute("MyTeam", myTeam); 
		return "team/list";
	}
	
	// 가입한 없을 때 
	@GetMapping("/myTeamFail")
	public String myTeamFail() {
		return "team/myTeamFail";
	}

}