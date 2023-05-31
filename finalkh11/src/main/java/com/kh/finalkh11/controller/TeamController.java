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

import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;
import com.kh.finalkh11.service.TeamService;

@Controller
@RequestMapping("/team")
//public class TeamController {
//    private final TeamService teamService;
//
//    @Autowired
//    public TeamController(TeamService teamService) {
//        this.teamService = teamService;
//    }
//
//
//	
//    @Autowired
//    private TeamRepo teamRepo;
//
//    @Autowired
//    private TeamMemberRepo teamMemberRepo;
//
//    @GetMapping("/insert")
//    public String showInsertTeamForm(Model model) {
//        model.addAttribute("teamDto", new TeamDto());
//        return "team/insert"; // 이것은 팀 생성 폼을 위한 jsp 파일
//    }
//
//    @PostMapping("/insert")
//    public String insertTeam(@ModelAttribute TeamDto teamDto, HttpSession session) {
//    	// 로그 출력
//        System.out.println(teamDto);
//
//    	String memberId = (String) session.getAttribute("memberId");
//        int teamNo = teamRepo.sequence();
//        teamDto.setTeamNo(teamNo);
//        teamDto.setTeamLeader(memberId);
//        teamRepo.insert(teamDto);
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
        if (teamDto != null) {
            model.addAttribute("teamVO", teamDto);
            return "team/detail";
        } else {
            // handle error
            return "redirect:/team/list";
        }
    }
	// 가입한 팀 없을 때 
//	@GetMapping("/myTeamFail") 
//	public String myTeamFail() {
//		return "team/myTeamFail";
//	}

//    @GetMapping("/detail/{no}")
//    public String detailTeam(@PathVariable("no") int teamNo, Model model) {
//    	TeamDto teamDto = teamRepo.selectOne(teamNo);
//    	model.addAttribute("team", teamDto);
//    	return "team/detail"; // 
//    }
//    // 팀 상세
// 	@GetMapping("/detail/{teamNo}")
// 	public String home(@PathVariable int teamNo, Model model, HttpSession session) {
// 		// HttpSession에서 로그인 중인 회원 아이디 반환
//		String memberId = (String)session.getAttribute("memberId");
//		if(memberId == null) { // 비로그인인지
//			model.addAttribute("attachmentList", attachmentRepo.selectTeamAttachment(teamNo));
//			// 팀 정보를 조회
//		 	model.addAttribute("teamVO", teamRepo.selectOne(teamNo));
//		 	// 편의를 위해 teamNo를 model에 추가
//		 	model.addAttribute("teamVO", teamNo);
//		 	// 팀 상세 페이지(board.jsp)로 연결	
//		 	return "team/detail";
//		} else { // 로그인 상태인 경우
//			// 내가 가입한 팀인지 반환
//			boolean isMember = teamRepo.alreadyJoin(memberId, teamNo);
//			if(isMember) {
//				model.addAttribute("attachmentList", attachmentRepo.selectTeamAttachment(teamNo));
//				// 팀 정보를 조회
//			 	model.addAttribute("teamVO", teamRepo.selectOne(teamNo));
//				// 편의를 위해 teamNo를 model에 추가
//			 	model.addAttribute("teamVO", teamNo);
//				// 홈 Mapping으로 강제 이동
//				return "redirect:/team_in/" + teamNo;
//			}
//			else {
//				model.addAttribute("attachmentList", attachmentDao.selectTeamAttachment(teamNo));
//				// 소모임 정보를 조회
//			 	model.addAttribute("teamVO", teamRepo.selectOne(teamNo));
//			 	// 편의를 위해 teamNo를 model에 추가
//			 	model.addAttribute("teamVO", teamNo);
//			 	//  상세 
//			 	return "team/detail";
//			}
//		}
// 	}
}