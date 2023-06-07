package com.kh.finalkh11.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.StatDto;
import com.kh.finalkh11.repo.StatRepo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest/admin")
public class adminRestController {
	
	@Autowired
	private StatRepo statRepo;
	
	//전체 구장 결제 순위
	@GetMapping("/categoryCount")
	public Map<String, List<Object>> categoryCount(){
		List<StatDto> list = statRepo.list();
		List<Object> groundNo = new ArrayList<>();
		List<Object> account = new ArrayList<>();
		for(StatDto dto : list) {
			groundNo.add(dto.getGroundNo());
			account.add(dto.getAccount());
		}
		Map<String, List<Object>> map = Map.of("groundNo", groundNo, "account", account);
		return map;
	}
	
	
}
