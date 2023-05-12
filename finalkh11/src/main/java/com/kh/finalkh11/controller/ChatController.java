package com.kh.finalkh11.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ChatRoomRepo;
import com.kh.finalkh11.repo.MemberRepo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatRoomRepo chatRoomRepo;
	
	@Autowired
	private MemberRepo memberRepo;
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("chatRoomList", chatRoomRepo.list());
		
		//return "/WEB-INF/views/home.jsp";
		return "home";
	}
	
	@PostMapping("/login")
	public String login(
				@ModelAttribute MemberDto memberDto,//사용자가 입력한 정보
				HttpSession session, RedirectAttributes attr
			) {
		MemberDto findDto = memberRepo.login(memberDto);
		if(findDto != null) {//로그인 성공
			session.setAttribute("memberId", findDto.getMemberId());
			attr.addAttribute("teamName",memberRepo.findTeam(findDto.getMemberId()));
		}
		return "redirect:/chat/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memberId");
		return "redirect:/chat/";
	}
	@GetMapping("/channel")
	public String channel() {
		return "channel";
	}
	
	
}
