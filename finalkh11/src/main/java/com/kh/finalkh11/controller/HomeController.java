package com.kh.finalkh11.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.MemberRepo;

@Controller
public class HomeController {
	
	@Autowired
	private MemberRepo memberRepo;
	
	@Autowired
	private ImgRepo imgRepo;
	


	@GetMapping("/")
	public String home(HttpSession session,Model model ) {   
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
		
		return "home";
	}
	  

}
