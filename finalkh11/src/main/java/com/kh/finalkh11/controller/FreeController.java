package com.kh.finalkh11.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.FreeDto;
import com.kh.finalkh11.repo.FreeRepo;

@Controller
@RequestMapping("/free")
public class FreeController {
	@Autowired
	private FreeRepo freeRepo;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("FreeList", freeRepo.selectAll());
		return "free/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "free/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute FreeDto dto, HttpSession session, RedirectAttributes attr) {
		dto.setFreeWriter((String)session.getAttribute("memberId"));
		freeRepo.insert(dto);
		return "redirect:/";
	}
	
	@GetMapping("/detail/{freeNo}")
	public String detail(@PathVariable int freeNo, Model model) {
		model.addAttribute("freeDto", freeRepo.selectOne(freeNo));
		return "free/detail";
	}
}
