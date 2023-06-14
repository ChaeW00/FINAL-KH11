package com.kh.finalkh11.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.MatchRecordDto;
import com.kh.finalkh11.repo.EntryRepo;
import com.kh.finalkh11.repo.MatchRecordRepo;
import com.kh.finalkh11.repo.MatchRepo;
import com.kh.finalkh11.vo.EntryVO;
import com.kh.finalkh11.vo.MatchVO;

@RestController
@RequestMapping("/rest/manager")
public class ManagerRestController {

	@Autowired
	private MatchRepo matchRepo;
	
	@Autowired
	private EntryRepo entryRepo;
	
	@Autowired
	private MatchRecordRepo matchRecordRepo;

	@GetMapping("/list")
	public List<MatchVO> managerList(){
		return matchRepo.selectListWithVO();
	}
	
	@GetMapping("/list/{matchDate}")
	public List<MatchVO> managerDateList(
			@PathVariable Date matchDate){
		return matchRepo.selectByDateWithVO(matchDate);
	}
	
	@GetMapping("/detail/{matchNo}")
	public MatchVO matchDetail(@PathVariable int matchNo) {
		return matchRepo.selectOneWithVO(matchNo);
	}
	
	@GetMapping("/entry/{matchNo}")
	public List<EntryVO> entryList(@PathVariable int matchNo){
		return entryRepo.selectByMatchNoWithVO(matchNo);
	}
	
	@GetMapping("/record/{matchNo}")
	public MatchRecordDto selectRecord(@PathVariable int matchNo) {
		return matchRecordRepo.selectOne(matchNo);
	}
	
	@PutMapping("/record")
	public boolean updateRecord(
			@RequestBody MatchRecordDto dto) {
		return matchRecordRepo.update(dto);
	}
	
}
