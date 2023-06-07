package com.kh.finalkh11.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.RankDto;
import com.kh.finalkh11.repo.RankRepo;


@RestController
@RequestMapping("/rest/admin")
public class adminRestController {
	
	@Autowired
	private RankRepo rankRepo;
	
	
	// 카테고리별 판매량 평균, 최대값
		@GetMapping("/categorySellCount")
		public Map<String, List<Object>> categorySellCount() {
			List<RankDto> list = rankRepo.selecList();
			List<Object> tags = new ArrayList<>();
			List<Object> avges = new ArrayList<>();
			List<Object> maxs = new ArrayList<>();
			for(RankDto dto : list) {
				tags.add(dto.getTagNo());
				avges.add(dto.getSellAvg());
				maxs.add(dto.getSellMax());
			}
			Map<String, List<Object>> map = Map.of(
					"label", tags, "avges", avges, "maxs", maxs);
			return map;
		}
	
	
}
