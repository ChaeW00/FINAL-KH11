package com.kh.finalkh11.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.ScheduleDto;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.ScheduleRepo;

@RestController
@CrossOrigin
@RequestMapping("/ground")
public class GroundRestController {

	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired
	private ScheduleRepo scheduleRepo;
	
	//구장 목록
	@GetMapping("/list/")
	public List<GroundDto> list() {
	      
		return groundRepo.list();
   }
 
	//구장 목록(무한 스크롤)
	@GetMapping("/list/page/{page}")
	public List<GroundDto> paging(@PathVariable int page) {
		return groundRepo.selectByPaging(page);
	}
	
	//구장 상세(스케쥴 리스트)
	@GetMapping("/list/{reserveDate}/{groundNo}")
	public List<ScheduleDto> shceduleList(
			@PathVariable Date reserveDate,
			@PathVariable int groundNo){
		List<ScheduleDto> scheduleList = scheduleRepo.availableSchedules(reserveDate, groundNo);
		
		return scheduleList;
	}
	
	//구장 상세(스케쥴 리스트)
	@GetMapping("/detail/{reserveDate}/{groundNo}")
	public List<ScheduleDto> completedSchedules(
			@PathVariable int groundNo,
			@PathVariable Date reserveDate) {
		
		return scheduleRepo.availableSchedules(reserveDate, groundNo);
	}
}