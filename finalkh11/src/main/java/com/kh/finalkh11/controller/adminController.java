package com.kh.finalkh11.controller;

import java.io.IOException;
import java.util.List;

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

import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ImgRepo;
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
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ImgRepo imgRepo;
	
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
			
		}
		ImgDto imgDto = imgRepo.selectOne(imgNo);
		
		model.addAttribute("imgDto", imgDto);	
		
		return "admin/member/mypage";
	}
	
	
	

	@GetMapping("/member/list")//회원 전체 목록
	public String memberList(@ModelAttribute("vo") AdminPaginationVO vo, Model model) {
		int totalCount = memberRepo.selectCount(vo);
		vo.setCount(totalCount);
		
		List<MemberDto>list = memberRepo.selectList(vo);
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
	
	
}





