package com.kh.finalkh11.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.finalkh11.service.ImgService;

@Controller
public class HomeController {
	
	@Autowired
	private ImgService imgService;

	@GetMapping("/")
	public String home(HttpSession session, Model model) {   
		return imgService.getHome(session, model);
	}
	  

}
