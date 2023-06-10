package com.kh.finalkh11.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.ScheduleDto;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.ScheduleRepo;
import com.kh.finalkh11.service.ImgService;

@Controller
@RequestMapping("/ground")
public class GroundController {

	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired
	private ScheduleRepo scheduleRepo;
	

   //구장 목록
   @GetMapping("/list")
   public String list(Model model) {
      List<GroundDto> list = groundRepo.list();
      
	  model.addAttribute("list", list);
	  
	  
      return "reserve/list";
   }
   
   //구장 상세
   @GetMapping("/detail")
   public String detail(@RequestParam int groundNo,
		   Model model) {
	   List<ScheduleDto> scheduleList = scheduleRepo.time(groundNo);
	   
	   Collections.sort(scheduleList, Comparator.comparingInt(ScheduleDto::getScheduleNo));
	   
	   model.addAttribute("groundDto", groundRepo.detail(groundNo));
	   model.addAttribute("scheduleList", scheduleList);
	   
	   return "reserve/detail";
   }
}