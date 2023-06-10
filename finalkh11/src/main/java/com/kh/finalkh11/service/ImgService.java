package com.kh.finalkh11.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.finalkh11.constant.SessionConstant;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.MemberRepo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ImgService {
	
	@Autowired
	private MemberRepo memberRepo;
	
	@Autowired
	private ImgRepo imgRepo;
	
	public String getHome(HttpSession session, Model model) {   
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
		
		return "home";
	}
	
	public String getMypage(HttpSession session, Model model) {   
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
		
		return "member/mypage";
	}
	
	public String getMatchBoard(HttpSession session, Model model) {   
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
		
		return "/matchBoard/list";
	}
	
	public String getGroundList(HttpSession session, Model model) {   
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
		
		return "reserve/list";
	}

}
