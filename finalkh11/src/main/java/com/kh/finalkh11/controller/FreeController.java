package com.kh.finalkh11.controller;


import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.FreeDto;
import com.kh.finalkh11.dto.FreeReplyDto;
import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.ScheduleDto;
import com.kh.finalkh11.repo.FreeRepo;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.ScheduleRepo;
import com.kh.finalkh11.vo.FreeFilterVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/free")
public class FreeController {
	@Autowired
	private FreeRepo freeRepo;
	
	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired
	private ScheduleRepo scheduleRepo;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<FreeDto> list = freeRepo.selectAll();
		model.addAttribute("FreeList", list);
		return "free/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "free/write";
	}
	
	@GetMapping("/ground-search")
	@ResponseBody
	public List<GroundDto> groundSearch(@RequestParam("term") String term) {
		return groundRepo.selectList(term);
	}
	
	@GetMapping("/schedule-search")
	@ResponseBody
	public List<ScheduleDto> scheduleSearch(@RequestParam("groundNo") String groundNo, @RequestParam("reserveDate") Date reserveDate) {
		int no = Integer.parseInt(groundNo);
		return scheduleRepo.availableSchedules(reserveDate, no);
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute FreeDto dto, HttpSession session, RedirectAttributes attr) {
//		dto.setFreeWriter((String)session.getAttribute("memberId"));
		dto.setFreeWriter("testuser999");
		log.debug("memberId = {}", dto.getFreeWriter());

		freeRepo.insert(dto);
		return "redirect:/";
	}
	
	@GetMapping("/detail/{freeNo}")
	public String detail(@PathVariable int freeNo, Model model)  {
		FreeDto dto = freeRepo.selectOne(freeNo);
		model.addAttribute("freeDto", dto);
		model.addAttribute("freeNo", freeNo);
		return "free/detail";
	}
	
	@PostMapping("/filter")
	@ResponseBody
	public List<FreeDto> filterSearch(@RequestBody FreeFilterVO filters) {
		Map<String, Object> param = new HashMap<>();
		List<String> freeLevelList = new ArrayList<>();
		List<String> freeGenderList = new ArrayList<>();
		if(filters.isHigh()) freeLevelList.add("상");
		if(filters.isLow()) freeLevelList.add("중");
		if(filters.isNormal()) freeLevelList.add("일반");
		if(filters.isXm()) freeGenderList.add("남자");
		if(filters.isXw()) freeGenderList.add("여자");
		if(filters.isXu()) freeGenderList.add("남녀모두");
		
		param.put("freeLevelList", freeLevelList);
		param.put("freeGenderList", freeGenderList);
		param.put("region", filters.getRegion());
		return freeRepo.selectByFilter(param);
	}
	
	@GetMapping("/basic")
	public String basic() {
		return "/free/basic";
	}
	
	//댓글 관련 REST 작업(강사 추가)
	@GetMapping("/replyList/{freeReplyOrigin}")
	@ResponseBody
	public List<FreeReplyDto> replyList(@PathVariable int freeReplyOrigin) {
		return freeRepo.replyList(freeReplyOrigin);
	}
	
	@PostMapping("/replyInsert")
	@ResponseBody
	public void replyInsert(@RequestBody FreeReplyDto freeReplyDto, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		freeReplyDto.setFreeReplyWriter(memberId);
		
		freeRepo.replyInsert(freeReplyDto); 
	}
	
	@DeleteMapping("/replyDelete/{freeReplyNo}")
	@ResponseBody
	public void replyDelete(@PathVariable int freeReplyNo, HttpSession session) throws NoHandlerFoundException {
		String memberId = (String)session.getAttribute("memberId");
		
		FreeReplyDto freeReplyDto = freeRepo.replyFind(freeReplyNo);
		if(freeReplyDto == null) 
			throw new NoHandlerFoundException(null, null, null);
		if(!freeReplyDto.getFreeReplyWriter().equals(memberId))
			throw new NoHandlerFoundException(null, null, null);
		
		freeRepo.replyDelete(freeReplyNo);
	}
	
	@PutMapping("/replyEdit")
	@ResponseBody
	public void replyEdit(@RequestBody FreeReplyDto freeReplyDto, HttpSession session) throws NoHandlerFoundException {
		FreeReplyDto findDto = freeRepo.replyFind(freeReplyDto.getFreeReplyNo());
		if(findDto == null) throw new NoHandlerFoundException(null, null, null);
		
		String memberId = (String)session.getAttribute("memberId");
		if(!findDto.getFreeReplyWriter().equals(memberId))
			throw new NoHandlerFoundException(null, null, null);
		
		freeRepo.replyEdit(freeReplyDto);
	}
}
