package com.kh.finalkh11.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamBoardDto;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.dto.WaitingDto;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;
import com.kh.finalkh11.repo.WaitingRepo;
import com.kh.finalkh11.service.MemberService;
import com.kh.finalkh11.service.TeamService;
import com.kh.finalkh11.vo.TeamFilterVO;

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
    
    @Autowired
    private MemberRepo memberRepo;
    
    @Autowired
    private WaitingRepo waitingRepo;
    
    @Autowired
    private MemberService memberService;
    
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
    	else { //팀 삭제 취소하면 제자리
    		return "redirect:/team_in/member/" +teamNo;
    	}
    }
    @GetMapping("/myTeam")
    public String myTeam(HttpSession session, Model model) {
        String memberId = (String) session.getAttribute(SessionConstant.memberId);
        List<TeamDto> teams = teamService.getTeamByMemberId(memberId);

        if (teams.isEmpty()) {
            return "redirect:/team/myTeamFail";
        }

        for (TeamDto teamDto : teams) {
            String teamLeaderName = memberRepo.selectOne(teamDto.getTeamLeader()).getMemberName();
            teamDto.setTeamLeaderName(teamLeaderName);
        }
        
        model.addAttribute("teams", teams);
        return "team/myTeam";
    }

    
    @GetMapping("/myTeamFail") 
    public String myTeamFail() {
    	return "team/myTeamFail";
    }
    
    @GetMapping("/detail/{teamNo}")
    public String showTeamDetail(
    		@PathVariable("teamNo") int teamNo,
    		HttpSession session,
    		Model model) {
    	String memberId = (String) session.getAttribute(SessionConstant.memberId);
    	MemberDto memberDto = memberRepo.selectOne(memberId);
    	
        TeamDto teamDto = teamService.getTeamByNo(teamNo);
        int count = teamMemberRepo.selectTeamMemberCount(teamNo);
        if (teamDto != null) {
            // 팀 리더의 이름 설정
            String teamLeaderName = memberService.getMemberNameById(teamDto.getTeamLeader());
            teamDto.setTeamLeaderName(teamLeaderName);
            
            model.addAttribute("memberDto", memberDto);
            model.addAttribute("teamDto", teamDto);
            model.addAttribute("count", count);
            
            return "team/detail";
        }
        else {
            // handle error
            return "redirect:/member/login";
        }
    }
    
    @PostMapping("/detail/teamJoin")
    public String teamJoin(
    		@ModelAttribute WaitingDto waitingDto,
    		@RequestParam int teamNo,
    		RedirectAttributes attr) {
    	int waitingNo = waitingRepo.sequence();
    	waitingDto.setWaitingNo(waitingNo);
    	
    	waitingRepo.insert(waitingDto);
    	
    	attr.addAttribute("teamNo", teamNo);
    	
    	return "redirect:{teamNo}";
    }

  @GetMapping("/recruit-member")
  public String recruit(Model model) {
	  List<TeamDto> list = teamRepo.selectList();
	  model.addAttribute("TeamList", list);
	  return "team/recruit-member";
  }
  @PostMapping("/filter")
	@ResponseBody
	public List<TeamDto> filterSearch(@RequestBody TeamFilterVO filters) {
		Map<String, Object> param = new HashMap<>();
		List<String> teamAgeList = new ArrayList<>();
		List<String> teamGenderList = new ArrayList<>();
		List<String> teamDayList = new ArrayList<>();
		List<String> teamTimeList = new ArrayList<>();
		if(filters.isAge10()) teamAgeList.add("10대");
		if(filters.isAge20()) teamAgeList.add("20대");
		if(filters.isAge30()) teamAgeList.add("30대");
		if(filters.isAge40()) teamAgeList.add("40대");
		if(filters.isAge50()) teamAgeList.add("50대 이상");
		if(filters.isDawn()) teamTimeList.add("아침(06~10시)");
		if(filters.isMorning()) teamTimeList.add("낮(10시~18시)");
		if(filters.isNoon()) teamTimeList.add("저녁(18~24시)");
		if(filters.isLate()) teamTimeList.add("심야(24시~06시)");
		if(filters.isXm()) teamGenderList.add("남자");
		if(filters.isXw()) teamGenderList.add("여자");
		if(filters.isXu()) teamGenderList.add("남녀모두");
		if(filters.isMon()) teamDayList.add("월요일");
		if(filters.isTue()) teamDayList.add("화요일");
		if(filters.isWed()) teamDayList.add("수요일");
		if(filters.isThi()) teamDayList.add("목요일");
		if(filters.isFri()) teamDayList.add("금요일");
		if(filters.isSat()) teamDayList.add("토요일");
		if(filters.isSun()) teamDayList.add("일요일");
	
		param.put("teamAgeList", teamAgeList);
		param.put("teamDayList", teamDayList);
		param.put("teamTimeList", teamTimeList);
		param.put("teamGenderList", teamGenderList);
		param.put("region", filters.getRegion());
		return teamRepo.selectByFilter(param);
	}
	@GetMapping("/rate")
    public String rate(Model model) {
        List<TeamDto> teamList = teamRepo.teamList();
        model.addAttribute("teamList", teamList);
        return "/team/rate";
    }
}

