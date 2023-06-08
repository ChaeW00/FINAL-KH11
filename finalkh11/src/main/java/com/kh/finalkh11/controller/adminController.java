package com.kh.finalkh11.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
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
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MainImgConnectDto;
import com.kh.finalkh11.dto.MainImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.MainImgRepo;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.service.AdminService;
import com.kh.finalkh11.service.MemberService;
import com.kh.finalkh11.vo.AdminPaginationVO;

import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
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
	private CustomFileuploadProperties fileuploadProperties;
	private File dir;
	
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
		
	}