package com.kh.finalkh11.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@GetMapping("/list")
	public String mangerList() {
		return "manager/list";
	}
	
	@GetMapping("/detail")
	public String managerDetail(
			@RequestParam int matchNo
			) {
		return "manager/detail";
	}
	
}
