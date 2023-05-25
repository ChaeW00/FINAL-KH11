package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.vo.AdminPaginationVO;

import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
@RequestMapping("/admin")
public class adminController {
	
	@Autowired
	private MemberRepo memberRepo;

	
	
	
}





