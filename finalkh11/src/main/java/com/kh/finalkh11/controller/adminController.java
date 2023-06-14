package com.kh.finalkh11.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.configuration.CustomFileuploadProperties;
import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MainImgConnectDto;
import com.kh.finalkh11.dto.MainImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.dto.StatsViewDto;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.MainImgRepo;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.repo.StatsViewRepo;
import com.kh.finalkh11.service.AdminService;
import com.kh.finalkh11.vo.AdminPaginationVO;
import com.kh.finalkh11.vo.GroundPaginationVO;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Autowired
	private MemberRepo memberRepo;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MainImgRepo mainImgRepo;
	
	@Autowired
	private ImgRepo imgRepo;
	
	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired
	private CustomFileuploadProperties fileuploadProperties;
	private File dir;
	
	@Autowired
	private StatsViewRepo statsViewRepo;
	
	@PostConstruct
	public void init() {
		dir = new File(fileuploadProperties.getPath());
		dir.mkdirs();
	}
	
	//관리자 홈
	@GetMapping("/member/home")
	public String home(HttpSession session,Model model) {
		
		String memberId = (String) session.getAttribute(SessionConstant.memberId);
		if(memberId == null) {
			return "redirect:/login";
		}
		MemberDto dto = memberRepo.selectOne(memberId);
		model.addAttribute("dto", dto);
		
		int imgNo = (int) dto.getImgNo();
		if(imgNo != 0) {
			ImgDto imgDto = imgRepo.selectOne(imgNo);
			model.addAttribute("imgDto", imgDto);	
			
		}
		
		return "admin/member/mypage";
	}
	
	@GetMapping("/member/list")//회원 전체 목록
	public String memberList(@ModelAttribute("vo") AdminPaginationVO vo, Model model) {
		int totalCount = memberRepo.selectCount(vo);
		vo.setCount(totalCount);
		
		List<MemberDto> list = memberRepo.selectList(vo);
		model.addAttribute("list",list);
		
		return "admin/member/list";
	}
	
	@GetMapping("/member/detail")//회원 상세 목록
	public String memberDetail(Model model, @RequestParam String memberId) {
		MemberDto dto = memberRepo.selectOne(memberId);
		model.addAttribute("dto",dto);
		
		int imgNo = (int) dto.getImgNo();
		if(imgNo != 0) {
			
		}
		ImgDto imgDto = imgRepo.selectOne(imgNo);
		
		model.addAttribute("imgDto", imgDto);	
		
		
		return "admin/member/detail";
	}
	
	@GetMapping("/member/edit")//회원 정보 수정
	public String memberEdit(Model model, @RequestParam String memberId) {
		MemberDto memberDto = memberRepo.selectOne(memberId);
		MemberDto findDto = memberRepo.selectOne(memberId);
		int imgNo = (int) findDto.getImgNo();
		model.addAttribute("img",imgRepo.selectOne(imgNo));
		
		model.addAttribute("memberDto",memberDto);
		return "admin/member/edit";
	}

	@PostMapping("/member/edit")
	public String memberEdit(@ModelAttribute MemberDto memberDto, @RequestParam MultipartFile file, 
			RedirectAttributes attr, @RequestParam String memberId) throws IllegalStateException, IOException {
		memberDto.setMemberId(memberId);
		
		attr.addAttribute("memberId",memberDto.getMemberId());
		adminService.update(memberDto, file);
		
		return "redirect:detail";
	}
	
	@GetMapping("/member/delete") //회원 탈퇴
	public String memberDelete(
			@RequestParam String memberId,
			@RequestParam(required = false, defaultValue = "1") int page,
			RedirectAttributes attr) {
		MemberDto memberDto = memberRepo.selectOne(memberId);
		memberRepo.delete(memberId);

		attr.addAttribute("page", page);
		return "redirect:/admin/member/list";
	}	

	@GetMapping("/member/upload")//메인 이미지 등록
	public String upload() {
		return "admin/member/upload";
	}
	
	@PostMapping("/member/upload")
	public String upload(
			@ModelAttribute MainImgDto mainImgDto,
			@ModelAttribute ImgDto imgDto,
			MultipartFile img) throws IllegalStateException, IOException {
		// 메인 이미지 정보 등록
		int mainNo = mainImgRepo.sequence();
		mainImgDto.setMainNo(mainNo);
		
		// 대표사진 번호 뽑기
		int imgNo = imgRepo.sequence();
		
		// 대표사진 파일 이름 설정
		File target = new File(dir, String.valueOf(imgNo));
		img.transferTo(target);
		
		// 대표사진 db에 저장
		imgRepo.insert(ImgDto.builder()
					.imgNo(imgNo)
					.imgName(img.getOriginalFilename())
					.imgType(img.getContentType())
					.imgSize(img.getSize())
				.build());
		
		// 상품 번호와 대표사진 번호 연결
		mainImgRepo.insert(MainImgDto.builder()
					.mainNo(mainNo)
					.imgNo(imgNo)
					.mainTitle(mainImgDto.getMainTitle())
				.build());
		
		imgRepo.insert(MainImgConnectDto.builder()
				.imgNo(imgNo)
				.mainNo(mainNo)
				.build()
				);
		
		// 정보 등록
		return "redirect:mainList";
	}
	
	
	@GetMapping("/member/mainList")// 메인 이미지 리스트
	public String list(Model model) {
		
		model.addAttribute("list", mainImgRepo.mainImgList());
		
		return "admin/member/mainList";
	}
	
	// 메인 이미지 삭제
	@GetMapping("/member/imgDelete")
	public String mainImgDelete(@RequestParam int imgNo) {
		imgRepo.delete(imgNo);
		return "redirect:mainList";
	}
	
	// 선택 이미지 삭제
	@PostMapping("/member/mainImgDeleteAll")
	public String mainImgDeleteAll(@RequestParam(value="imgNo") List<Integer> list) {
		
		for(int imgNo : list) {
			imgRepo.delete(imgNo);
		}
		
		return "redirect:mainList";
	}
	

	//구장 리스트(관리자)
	@GetMapping("/member/groundList")
	public String groundList(
			@ModelAttribute("vo") GroundPaginationVO vo,
			Model model) {
		int totalCount = groundRepo.selectCount(vo);
		vo.setCount(totalCount);
		List<GroundDto> list = groundRepo.adminList(vo);
		
		model.addAttribute("list", list);
		
		return "admin/member/groundList";
	}
	
	//구장 삭제(관리자)
	@GetMapping("/member/groundDelete")
	public String adminGroundDelete(
			@RequestParam int groundNo,
			@RequestParam(required = false, defaultValue = "1") int page,
			RedirectAttributes attr) {
		groundRepo.delete(groundNo);

		attr.addAttribute("page", page);
		
		return "redirect:/admin/member/groundList";
	}
	
	//구장 결제 순위 통계(RestController는 Data 송수신에만 필요한 컨트롤러이기 때문에 화면으로 보이는 View가 없다)
	@GetMapping("/member/statsView")
	public String groundView(Model model) {
		List<StatsViewDto> dto = statsViewRepo.selecListTeam();

		model.addAttribute("list", dto);
		
		return "admin/member/statsView";
	}
	
	//고객센터
	@GetMapping("/customer/cs")
	public String cs() {
		return "admin/customer/cs";
	}
	
	@GetMapping("/customer/cs/cancel")
	public String cancel() {
		return "admin/customer/cancel";
	}
	
	@GetMapping("/customer/cs/cancel/match")
	public String cancelMatch() {
		return "admin/customer/cancelMatch";
	}
	
	@GetMapping("/customer/cs/cancel/season")
	public String cancelSeason() {
		return "admin/customer/cancelSeason";
	}
	
	@GetMapping("/customer/cs/cancel/people")
	public String cancelPeople() {
		return "admin/customer/cancelPeople";
	}
	
	@GetMapping("/customer/cs/progress")
	public String progress() {
		return "admin/customer/progress";
	}
	
	@GetMapping("/customer/cs/progress/weather")
	public String progressWeather() {
		return "admin/customer/progressWeather";
	}
	
	@GetMapping("/customer/cs/progress/people")
	public String progressPeople() {
		return "admin/customer/progressPeople";
	}
	
	@GetMapping("/customer/cs/progress/how")
	public String progressHow() {
		return "admin/customer/progressHow";
	}
	
	@GetMapping("/customer/cs/reservation")
	public String reservation() {
		return "admin/customer/reservation";
	}
	
	@GetMapping("/customer/cs/reservation/refund")
	public String reservationRefund() {
		return "admin/customer/reservationRefund";
	}
	
	@GetMapping("/customer/cs/reservation/when")
	public String reservationWhen() {
		return "admin/customer/reservationWhen";
	}
	
	@GetMapping("/customer/cs/service")
	public String service() {
		return "admin/customer/service";
	}
	
	@GetMapping("/customer/cs/service/smoking")
	public String serviceSmoking() {
		return "admin/customer/serviceSmoking";
	}
	
	@GetMapping("/customer/cs/service/secession")
	public String serviceSecession() {
		return "admin/customer/serviceSecession";
	}
	
	@GetMapping("/customer/cs/service/temperature")
	public String serviceTemperature() {
		return "admin/customer/serviceTemperature";
	}
	
	@GetMapping("/customer/cs/application")
	public String application() {
		return "admin/customer/application";
	}
	
	@GetMapping("/customer/cs/application/age")
	public String applicationAge() {
		return "admin/customer/applicationAge";
	}
	
	@GetMapping("/customer/cs/application/goalkeeper")
	public String applicationGoalkeeper() {
		return "admin/customer/applicationGoalkeeper";
	}
	
	@GetMapping("/customer/cs/application/atmosphere")
	public String applicationAtmosphere() {
		return "admin/customer/applicationAtmosphere";
	}
	
	@GetMapping("/customer/cs/facility")
	public String facility() {
		return "admin/customer/facility";
	}
	
	@GetMapping("/customer/cs/facility/shower")
	public String facilityShower() {
		return "admin/customer/facilityShower";
	}
	
	@GetMapping("/customer/cs/facility/shoes")
	public String facilityShoes() {
		return "admin/customer/facilityShoes";
	}
	
	
	@GetMapping("/customer/cs/facility/parking")
	public String facilityParking() {
		return "admin/customer/facilityParking";
	}
	
	@GetMapping("/customer/cs/refund")
	public String refund() {
		return "admin/customer/refund";
	}
	
	@GetMapping("/customer/cs/refund/refundRule")
	public String refundRule() {
		return "admin/customer/refundRule";
	}
}