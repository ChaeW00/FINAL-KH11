package com.kh.finalkh11.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.GroundImageDto;
import com.kh.finalkh11.dto.ScheduleDto;
import com.kh.finalkh11.repo.GroundImageRepo;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.ScheduleRepo;
import com.kh.finalkh11.service.GroundService;
import com.kh.finalkh11.vo.GroundImageVO;

@RestController
@CrossOrigin
@RequestMapping("/rest/ground")
public class GroundRestController {

	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired
	private ScheduleRepo scheduleRepo;
	
	@Autowired
	private GroundService groundService;
	
	@Autowired
	private ImgRepo imgRepo;
	
	@Autowired
	private GroundImageRepo groundImageRepo;
	
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
	
	//구장에 따른 스케쥴 목록
	@GetMapping("/groundSchedule/{groundNo}")
	public List<ScheduleDto> groundSchedule(@PathVariable int groundNo) {
		return scheduleRepo.time(groundNo);
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
	
	//구장 시퀀스 생성
	@GetMapping("/groundNo")
	public int getGroundNo() {
		return groundRepo.sequence();
	}
	
	//스케쥴 시퀀스 생성
	@GetMapping("/scheduleNo")
	public int getScheduleNo() {
		return scheduleRepo.sequence();
	}
	
	//구장 등록
	@PostMapping("/insertGround")
	public void insertGround(@RequestBody GroundDto groundDto) {
		groundRepo.insert(groundDto);
	}
	
	//스케쥴 등록
	@PostMapping("/insertSchedule")
	public void insertSchedule(@RequestBody ScheduleDto scheduleDto) {
		scheduleRepo.insert(scheduleDto);
	}
	
	//구장 수정
	@PutMapping("/editGround")
	public boolean editGround(@RequestBody GroundDto groundDto) {
		return groundRepo.edit(groundDto);
	}
	
	//스케쥴 수정
	@PutMapping("/editSchedule")
	public boolean editSchedule(@RequestBody ScheduleDto scheduleDto) {
		return scheduleRepo.edit(scheduleDto);
	}
	
	//스케쥴 삭제
	@DeleteMapping("/removeSchedule/{scheduleNo}")
	public boolean removeSchedule(@PathVariable int scheduleNo) {
		return scheduleRepo.deleteSchedule(scheduleNo);
	}
	
	//구장 이미지 등록
	@PostMapping(value = "/insertGroundImage/{groundNo}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public void insertGroundImage(
			@ModelAttribute GroundImageDto groundImageDto,
			@PathVariable int groundNo,
			@RequestPart List<MultipartFile> files) throws IllegalStateException, IOException {
		groundService.insert(groundImageDto, groundNo, files);
	}
	
	//구장 이미지 리스트
	@GetMapping("/groundImageList/{groundNo}")
	public List<GroundImageVO> groundImageList(@PathVariable int groundNo) {
		return groundImageRepo.groundImageList(groundNo);
	}
	
	//구장 이미지 삭제
	@DeleteMapping("/deleteGroundImage/{imgNo}")
	public boolean deleteGroundImage(@PathVariable int imgNo) {
		return imgRepo.deleteGroundImage(imgNo);
	}
}