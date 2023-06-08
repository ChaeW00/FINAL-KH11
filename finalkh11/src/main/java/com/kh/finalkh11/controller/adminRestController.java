package com.kh.finalkh11.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.GroundPaymentViewDto;
import com.kh.finalkh11.repo.GroundPaymentViewRepo;

@CrossOrigin
@RestController
@RequestMapping("/rest/admin")
public class adminRestController {
	
	@Autowired
	private GroundPaymentViewRepo groundPaymentViewRepo;
	
		
			@GetMapping("/member/groundPaymentView")
			public Map<String, List<Object>> groundPaymentView() {
				List<GroundPaymentViewDto> list = groundPaymentViewRepo.selecList();
				
				List<Object> groundBasicAddr = new ArrayList<>();
				List<Object> paymentRemain = new ArrayList<>();
				List<Object> paymentRank = new ArrayList<>();
				
				for(GroundPaymentViewDto dto : list) {
					groundBasicAddr.add(dto.getGroundBasicAddr());
					paymentRemain.add(dto.getPaymentRemain());
					paymentRank.add(dto.getPaymentRank());
				}
				Map<String, List<Object>> map = Map.of(
						"label", groundBasicAddr, "remain", paymentRemain, "rank", paymentRank);
				return map;
			}
}