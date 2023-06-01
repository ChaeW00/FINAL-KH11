package com.kh.finalkh11.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;
import com.kh.finalkh11.service.TeamService;

@Controller
@RequestMapping("/team")

public class TeamController {
    private final TeamService teamService;
    private final ImgRestController imgRestController;

    @Autowired
    public TeamController(TeamService teamService, ImgRestController imgRestController) {
        this.teamService = teamService;
        this.imgRestController = imgRestController;
    }

    @Autowired
    private TeamRepo teamRepo;

    @Autowired
    private TeamMemberRepo teamMemberRepo;

    @GetMapping("/insert")
    public String showInsertTeamForm(Model model) {
        model.addAttribute("teamDto", new TeamDto());
        return "team/insert"; // 팀 생성 폼을 위한 jsp 파일
    }

    @PostMapping("/insert")
    public String insertTeam(@ModelAttribute TeamDto teamDto, HttpSession session, @RequestParam("logoImage") MultipartFile logoImage) throws IOException {
        // 업로드된 이미지를 ImgRestController를 통해 처리하여 ImgDto를 얻어옴
        ImgDto imgDto = imgRestController.upload(logoImage);
        if (imgDto != null) {
            teamDto.setImgNo(imgDto.getImgNo()); // 이미지 번호를 TeamDto에 설정
        }

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
        teamMemberRepo.insert(teamLeader);

        return "redirect:/team/insertFinish";
    }
	@GetMapping("/insertFinish")
	public String insertFinish() {
		return "team/insertFinish";
	}

	//팀 수정
	@GetMapping("/edit")
	public String teamEdit(@RequestParam int teamNo, Model model) {
	    TeamDto teamDto = teamRepo.selectOne(teamNo);
	    model.addAttribute("teamDto", teamDto);
	    return "team/edit";
	}

	@PostMapping("/edit")
	public String teamEdit(@ModelAttribute TeamDto teamDto, @RequestParam("logoImage") MultipartFile logoImage, HttpSession session) throws IOException {
	    String memberId = (String) session.getAttribute(SessionConstant.memberId);

	    // 팀 로고 이미지 업로드 처리
	    if (!logoImage.isEmpty()) {
	        ImgDto imgDto = imgRestController.upload(logoImage);
	        if (imgDto != null) {
	            teamDto.setImgNo(imgDto.getImgNo());
	        }
	    }

	    teamDto.setTeamLeader(memberId);

	    boolean result = teamRepo.update(teamDto);

	    if (result) {
	        return "redirect:/team_in/member/" + teamDto.getTeamNo();
	    } else {
	        // handle error
	        return "redirect:/team/edit?teamNo=" + teamDto.getTeamNo();
	    }
	}

    @GetMapping("/delete")
    public String delete(@RequestParam int teamNo) {
    	boolean result = teamRepo.delete(teamNo);
    	if(result) {
    		return "redirect:/";
    	}
    	else { //소모임 삭제 취소하면 제자리
    		return "redirect:/team_in/member/" +teamNo;
    	}
    }
    @GetMapping("/myTeam2")
    public String myTeam(HttpSession session, Model model) {
        String memberId = (String) session.getAttribute(SessionConstant.memberId);
        List<TeamDto> teams = teamService.getTeamByMemberId(memberId);
        model.addAttribute("teams", teams);
        return "team/myTeam2";  // 
    }
    @GetMapping("/detail/{teamNo}")
    public String showTeamDetail(@PathVariable("teamNo") int teamNo, Model model) {
        TeamDto teamDto = teamService.getTeamByNo(teamNo);
        int count = teamMemberRepo.selectTeamMemberCount(teamNo);
        if (teamDto != null) {
            model.addAttribute("teamVO", teamDto);
            model.addAttribute("count", count);
            return "team/detail";
        } else {
            // handle error
            return "redirect:/team/list";
        }
    }

}