package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.TeamRepo;
import com.kh.finalkh11.vo.SearchVO;

@Controller
public class HomeController {
	
	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired TeamRepo teamRepo;
	
	@GetMapping("/")
	public String home() {   
		return "home";
	}
	  
	@GetMapping("/search")
	public String totalSearch(@RequestParam String keyword, Model model) {
		
		model.addAttribute("keyword", keyword);
		
		List<SearchVO> searchList = groundRepo.totalSearch(keyword);
		model.addAttribute("searchList", searchList);
		
		return "search";
	}
}
