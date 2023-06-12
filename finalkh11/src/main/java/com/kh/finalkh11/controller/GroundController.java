package com.kh.finalkh11.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.GroundImageDto;
import com.kh.finalkh11.dto.ScheduleDto;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.ScheduleRepo;
import com.kh.finalkh11.service.ImgService;
import com.kh.finalkh11.service.GroundService;


@Controller
@RequestMapping("/ground")
public class GroundController {

	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired
	private ScheduleRepo scheduleRepo;
	

	@Autowired
	private GroundService groundService;

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
   
	//구장 등록
	@GetMapping("/insert")
	public String write() {
		return "/reserve/insert";
	}
	
	@PostMapping("/insert")
	public String write(
			@ModelAttribute GroundImageDto groundImageDto,
//			@ModelAttribute GroundDto groundDto,
//	        @RequestParam List<String> scheduleStart,
//	        @RequestParam List<String> scheduleEnd,
			RedirectAttributes attr,
			@RequestParam MultipartFile file) throws IllegalStateException, IOException {
//		int groundNo = groundRepo.sequence();
//		int scheduleNo = scheduleRepo.sequence();
		
//		groundImageDto.setGroundNo(groundNo);
		
//		groundService.insert(groundImageDto, file);
//		groundRepo.insert(groundDto);
//
//		List<ScheduleDto> scheduleDtos = new ArrayList<>();
//        for (int i = 0; i < scheduleStart.size(); i++) {
//        	ScheduleDto scheduleDto = new ScheduleDto();
//    		scheduleDto.setScheduleNo(scheduleNo);
//    		scheduleDto.setGroundNo(groundNo);
//            scheduleDto.setScheduleStart(scheduleStart.get(i));
//            scheduleDto.setScheduleEnd(scheduleEnd.get(i));
//            
//            scheduleDtos.add(scheduleDto);
//        }
//        
//		scheduleRepo.insertSchedules(scheduleDtos);
//		
//		attr.addAttribute("groundNo", groundNo);
//		
		return "redirect:detail";
	}
	
	//구장 수정
	@GetMapping("/edit/{groundNo}")
	public String edit(
			@PathVariable int groundNo, 
			Model model) {
		GroundDto groundDto = groundRepo.detail(groundNo);
		List<ScheduleDto> list = scheduleRepo.time(groundNo);
		
//		List<Map<String, Object>> schedules = new ArrayList<>();
//		for (ScheduleDto scheduleDto : list) {
//		    Map<String, Object> scheduleData = new HashMap<>();
//		    scheduleData.put("scheduleStart", scheduleDto.getScheduleStart());
//		    scheduleData.put("scheduleEnd", scheduleDto.getScheduleEnd());
//		    schedules.add(scheduleData);
//		}

		model.addAttribute("groundDto", groundDto);
		model.addAttribute("schedules", list);
	    
	    return "reserve/edit";
	}
	
	@PostMapping("/edit/{groundNo}")
	public String edit(
			@ModelAttribute GroundDto groundDto,
			@ModelAttribute ScheduleDto scheduleDto,
			RedirectAttributes attr,
			HttpSession session,
			Model model) {
//		groundRepo.edit(groundDto);
		scheduleRepo.edit(scheduleDto);
		attr.addAttribute("groundNo",groundDto.getGroundNo());
		
//		String memberLevel = (String)session.getAttribute("memberLevel");
//		attr.addAttribute("memberLevel", memberLevel);
		
		return "redirect:/ground/detail";
	}
	
	//구장 삭제
	@GetMapping("/delete/{groundNo}")
	public String delete(@PathVariable int groundNo,
			RedirectAttributes attr) {
		
		groundRepo.delete(groundNo);
		
		return "redirect:/ground/list";
	}
}