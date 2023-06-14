package com.kh.finalkh11.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.StatsViewDto;
import com.kh.finalkh11.repo.StatsViewRepo;

@CrossOrigin
@RestController
@RequestMapping("/rest/admin")
public class adminRestController {
	
	@Autowired
	private StatsViewRepo statsViewRepo;
	
		@GetMapping("/member/groundStatsView")
		public Map<String, List<Object>> statsView() {
			List<StatsViewDto> list = statsViewRepo.selecList();
			
			List<Object> groundBasicAddr = new ArrayList<>();
			List<Object> paymentRemain = new ArrayList<>();
			List<Object> paymentRank = new ArrayList<>();
			
			for(StatsViewDto dto : list) {
				groundBasicAddr.add(dto.getGroundBasicAddr());
				paymentRemain.add(dto.getPaymentRemain());
				paymentRank.add(dto.getPaymentRank());
			}
			
			Map<String, List<Object>> map = Map.of(
					"label", groundBasicAddr, "remain", paymentRemain, "rank", paymentRank);
			
			return map;
		}
		
		@GetMapping("/member/teamStatsView")
		public Map<String, List<Object>> statsTeam() {
			List<StatsViewDto> list = statsViewRepo.selecListTeam();
			
			List<Object> teamName = new ArrayList<>();
			List<Object> totalWins = new ArrayList<>();
			List<Object> totalLosses = new ArrayList<>();
			List<Object> ranking = new ArrayList<>();
			
			
			for(StatsViewDto dto : list) {
				teamName.add(dto.getTeamName());
				totalWins.add(dto.getTotalWins());
				totalLosses.add(dto.getTotalLosses());
				ranking.add(dto.getRanking());
			}
			
			Map<String, List<Object>> map = Map.of(
					"label", teamName,"rank", ranking, "win", totalWins, "loss", totalLosses);
			
			return map;
		}
		
		@GetMapping("/member/memberStatsView")
		public Map<String, List<Object>> memberStatsView() {
			List<StatsViewDto> list = statsViewRepo.selectListMemberLevel();
			
			List<Object> memberLevel = new ArrayList<>();
			List<Object> count = new ArrayList<>();
			
			
			for(StatsViewDto dto : list) {
				memberLevel.add(dto.getMemberLevel());
				count.add(dto.getCount());
			}
			
			Map<String, List<Object>> map = Map.of(
					"label", memberLevel,"count", count);
			
			return map;
		}
}