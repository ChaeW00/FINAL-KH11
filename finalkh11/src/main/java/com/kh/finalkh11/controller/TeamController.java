package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalkh11.repo.TeamRepo;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	private TeamRepo teamRepo;
	
	@GetMapping("/insert")
	public String insert() {
		return "team/insert";
	}
	
//	@PostMapping("/insert")
//	public String 
}
  