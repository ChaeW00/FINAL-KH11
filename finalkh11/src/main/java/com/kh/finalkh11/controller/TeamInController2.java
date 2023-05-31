package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;


@Controller
@RequestMapping("/team_in")
public class TeamInController2 {
	
	@Autowired
	private TeamRepo teamRepo;
	
	@Autowired 
	private TeamMemberRepo teamMemberRepo;
	

	
	
	// 의존성 주입
//	@Autowired
//	private TeamBoardRepo teamBoardRepo;
//	
//	@Autowired
//	private TeamRepo teamRepo;
//	
//	@Autowired
//	private TeamMemberDao teamMemberDao;
//	
//	@Autowired
//	private TeamMemberService teamMemberService;
//	
//	@Autowired
//	private PlanRepo planRepo;
//	
//	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
//	public void prepare() {
//		dir.mkdirs();
//	}

//	private final File dir = new File("D:/upload/kh11fc");
	//private final File dir = new File(System.getProperty("user.home")+"/upload/main");
	
//	// 소모임 홈 화면 Mapping
//	@GetMapping("/{teamNo}")
//	public String home(@PathVariable int teamNo, HttpSession session, Model model) {
//		// HttpSession에서 로그인 중인 회원 아이디 반환
//		String memberId = (String)session.getAttribute("memberId");
//		// 입력받은 팀 번호와 반환한 회원 아이디로 로그인한 회원의 해당 팀 내 회원 정보 조회
//		TeamMemberDto teamMemberDto = teamBoardrepo.searchMemberInfo(teamNo, memberId);
//		// 조회한 정보를 model에 추가
//		model.addAttribute("teamMemberDto", teamMemberDto);
//		//개설한 팀 정보를 조회
//		model.addAttribute("teamVO", teamRepo.selectOne(teamNo));
//
//		
//		//입력받은 팀번호로 연결되는 첨부파일 조회
////		model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
//		
//		//1222 추가: 아지트 번호로 스케줄 rownum<=3 조회하여 model에 추가
//		model.addAttribute("planListRownum",planRepo.planListRownum(teamNo));
//
//		// 편의를 위해 ahzitNo를 model에 추가
//		model.addAttribute("teamNo", teamNo);
//		// 팀 홈 화면(board.jsp)로 연결
//		return "team_in/board";
//	}
	

	// 소모임 일정 Mapping
//	@GetMapping("/{teamNo}/calendar")
//	public String calander(@PathVariable int ahzitNo, HttpSession session, Model model) {
//		// HttpSession에서 로그인 중인 회원 아이디 반환
//		String loginId = (String)session.getAttribute("loginId");
//		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
//		TeamMemberDto teamMemberDto = teamBoardRepo.searchMemberInfo(teamNo, memberId);
//		// 조회한 정보를 model에 추가
//		model.addAttribute("teamMemberDto", teamMemberDto);
//		//1219 추가) ahzit_no로 schedule 테이블을 검색한 목록
//		List<PlanDto> scheduleList=planRepo.planList(teamNo);
//		//1219 추가) 검색결과목록을 model에 추가
//		model.addAttribute("planList", planList);
//		
//		//1222 추가)sysdate보다 시작일이 빠른 일정은 제외한 목록
//		List<PlanDto> planListSysdate=planRepo.planListSysdate(teamNo);
//		//1222 추가) 검색결과목록을 model에 추가
//		model.addAttribute("planListSysdate",planListSysdate);
//		
//		//개설한 팀 정보를 조회
//		model.addAttribute("teamVO", teamRepo.selectOne(teamNo));
//		// 편의를 위해 teamNo를 model에 추가
//		model.addAttribute("teamNo", teamNo);
//		//팀 일정 페이지(calendar.jsp)로 연결
//		return "team_in/calendar";
//	}
	

//	// 소모임 멤버 Mapping
//	@GetMapping("/{ahzitNo}/member")
//	public String member(@PathVariable int ahzitNo, @ModelAttribute AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO, HttpSession session, Model model) {
//		// HttpSession에서 로그인 중인 회원 아이디 반환
//		String loginId = (String)session.getAttribute("loginId");
//		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
//		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
//		// 조회한 정보를 model에 추가
//		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
//		//개설한 아지트 정보를 조회
//		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));
//		//입력받은 아지트번호로 연결되는 첨부파일 조회
//		model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
//		// 편의를 위해 ahzitNo를 model에 추가
//		model.addAttribute("ahzitNo", ahzitNo);
//		// 조회 유형에 따른 회원 수 반환
//		int memberCount = ahzitDao.selectMemberCount(ahzitMemberInfoRequestVO);
//		// 조회한 회원 수를 VO에 설정
//		ahzitMemberInfoRequestVO.setCount(memberCount);
//		// 조회 유형에 따른 회원 정보 조회
//		List<AhzitMemberInfoVO> memberInfoList = ahzitDao.selectMemberInfo(ahzitMemberInfoRequestVO);
//		// 조회 결과를 model에 추가
//		model.addAttribute("ahzitMemberList", memberInfoList);	
//		//1222 추가: 아지트 번호로 스케줄 rownum<=3 조회하여 model에 추가
//		model.addAttribute("scheduleListRownum",scheduleDao.scheduleListRownum(ahzitNo));
//		// 소모임 회원 관리 페이지(member.jsp)로 이동
//		return "ahzit_in/member";
//	}
//	
//	//소모임 가입
//	@GetMapping("/{ahzitNo}/insert")
//	public String insert(@PathVariable int ahzitNo, HttpSession session, Model model) {
//		// HttpSession에서 로그인 중인 회원 아이디 반환
//		String loginId = (String)session.getAttribute("loginId");
//		// 반환받은 회원 id를 model에 추가
//		model.addAttribute("loginId",loginId);
//		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
//		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
//		// 조회한 정보를 model에 추가
//		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
//		//개설한 아지트 정보를 조회
//		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));
//
//		
//		//입력받은 아지트번호로 연결되는 첨부파일 조회
//		model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
//
//		// 편의를 위해 ahzitNo를 model에 추가
//		model.addAttribute("ahzitNo", ahzitNo);
//		//소모임 가입 페이지로 model 전달, 이동
//		return "ahzit_in/insert";
//	}
	
	
//	@PostMapping("/{ahzitNo}/insert")
//	public String insert(@PathVariable int ahzitNo, 
//			@RequestParam MultipartFile attachment,
//			@ModelAttribute AhzitMemberDto ahzitMemberDto, 
//			HttpSession session, Model model) throws IllegalStateException, IOException {
//		ahzitMemberService.insert(ahzitMemberDto, attachment);
//		return "redirect:/ahzit_in/" + ahzitMemberDto.getMemberAhzitNo();
//	}
	
//	@GetMapping("/{ahzitNo}/editMyInfo")
//	public String editMyInfo(@PathVariable int ahzitNo, HttpSession session, Model model) {
//		// HttpSession에서 로그인 중인 회원 아이디 반환
//				String loginId = (String)session.getAttribute("loginId");
//				// 반환받은 회원 id를 model에 추가
//				model.addAttribute("loginId",loginId);
//				// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
//				AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
//				// 조회한 정보를 model에 추가
//				model.addAttribute("ahzitMemberDto", ahzitMemberDto);
//				//개설한 아지트 정보를 조회
//				model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));
//
//				
//				//입력받은 아지트번호로 연결되는 첨부파일 조회
//				model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
//				
//				//입력받은 회원번호로 연결되는 첨부파일 조회
//				model.addAttribute("memberAttachmentList", attachmentDao.selectAhzitMemberAttachment(ahzitMemberDto.getMemberNo()));
//
//				// 편의를 위해 ahzitNo를 model에 추가
//				model.addAttribute("ahzitNo", ahzitNo);
//								
//				//개인 프로필 수정 페이지로 model 전달, 이동
//				return "ahzit_in/editMyInfo";
//	}
//	
//	
//	@PostMapping("/{ahzitNo}/editMyInfo")//가입한 아지트에서 사용하는 프로필 수정기능
//	public String editMyInfo(@PathVariable int ahzitNo, 
//			@ModelAttribute AhzitMemberDto ahzitMemberDto, 
//			@RequestParam MultipartFile attachment,
//			HttpSession session, Model model) throws IllegalStateException, IOException {
//			boolean result=ahzitMemberDao.updateMember(ahzitMemberDto);
//			ahzitMemberService.uploadProfile(ahzitMemberDto, attachment);
//			if(result) {
//				return "redirect:/ahzit_in/" + ahzitNo;
//			}
//			else {
//				throw new TargetNotFoundException();
//			}
//	}

//	@GetMapping("/{memberNo}/deleteCommonMember")//팀 탈퇴기능
//	public String deleteCommonMember(@PathVariable int memberNo, Model model, RedirectAttributes attr) {
//		TeamMemberDto findDto=teamMemberDao.findMember(memberNo);//회원고유번호로 ahzitMemberDto조회
//		int teamNo=findDto.getTeamNo();//조회한 teamMemberDto에서 팀 번호 반환
//		boolean result=teamRepo.deleteCommonMember(memberNo);
//		if(result) {
//			teamRepo.updateAhzitHead2(teamNo);//탈퇴 성공시 ahzit_head 변경
//			attr.addAttribute("teamNo",teamNo);
//			return "redirect:/team_in/" + teamNo;
//		}
//		else {
//			throw new TargetNotFoundException();
//		}
//	}
	
}