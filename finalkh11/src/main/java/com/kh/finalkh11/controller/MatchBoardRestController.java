package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.EntryDto;
import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.repo.EntryRepo;
import com.kh.finalkh11.repo.MatchBoardRepo;
import com.kh.finalkh11.repo.MatchRepo;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.repo.TeamRepo;
import com.kh.finalkh11.vo.EntryVO;
import com.kh.finalkh11.vo.MatchBoardVO;
import com.kh.finalkh11.vo.MatchInMemberInfoVO;
import com.kh.finalkh11.vo.MatchVO;

@RestController
@RequestMapping("/rest/matchBoard")
public class MatchBoardRestController {
	
	@Autowired
	private MatchBoardRepo matchBoardRepo;
	
	@Autowired
	private MatchRepo matchRepo;

	@Autowired
	private EntryRepo entryRepo;
	
	@Autowired
	private MemberRepo memberRepo;
	
	@Autowired
	private TeamRepo teamRepo;
	
	@GetMapping("/seq")
	public int getMatchBoardSequence() {
		return matchBoardRepo.sequence();
	}
	
	@GetMapping("/match/seq")
	public int getMatchSequence() {
		return matchRepo.getSequence();
	}

	@GetMapping("/entry/seq")
	public int getEntrySequence() {
		return entryRepo.getSequence();
	}
	
	@PostMapping("/")
	public void insertMatchBoard(@RequestBody MatchBoardDto dto) {
		matchBoardRepo.insert(dto);
	}
	
	@PostMapping("/match")
	public void insertMatch(@RequestBody MatchDto dto) {
		matchRepo.insert(dto);
	}
	
	@PostMapping("/entry")
	public void insertEntry(@RequestBody EntryDto dto) {
		entryRepo.insert(dto);
	}
	
	@GetMapping("/{matchBoardNo}")
	public MatchBoardVO selectMatchBoard(@PathVariable int matchBoardNo) {
		return matchBoardRepo.selectOnewithVO(matchBoardNo);
	}
	
	@GetMapping("/match/{matchBoardNo}")
	public MatchVO selectMatch(@PathVariable int matchBoardNo) {
		return matchRepo.selectByMatchBoardNoWithVO(matchBoardNo);
	}
	
	@GetMapping("/entry/{matchNo}")
	public List<EntryVO> selectEntry(@PathVariable int matchNo){
		return entryRepo.selectByMatchNoWithVO(matchNo);
	}
	
	@PutMapping("/entry/away")
	public boolean updateAway(@RequestBody EntryDto dto) {
		return entryRepo.updateAway(dto);
	}
	
	@PutMapping("/entry")
	public boolean updateEntry(@RequestBody EntryDto dto) {
		return entryRepo.update(dto);
	}
	
	@DeleteMapping("/entry/{matchNo}")
	public boolean deleteAllWait(@PathVariable int matchNo) {
		return entryRepo.deleteAllWait(matchNo);
	}
	
	@DeleteMapping("/entry/{matchNo}/{teamNo}/{teamType}")
	public boolean deleteGroup(@PathVariable int matchNo, @PathVariable int teamNo, @PathVariable String teamType) {
		return entryRepo.deleteGroup(matchNo,teamNo, teamType);
	}
	
	
	@PutMapping("/status")
	public boolean boardStatusComplete(@RequestBody MatchBoardDto dto) {
		return matchBoardRepo.statusComplete(dto);
	}
	
	@PutMapping("/match/status")
	public boolean matchStatusComplete(@RequestBody MatchDto dto) {
		return matchRepo.statusComplete(dto);
	}
	
	@PutMapping("/match")
	public boolean matchUpdate(@RequestBody MatchDto dto) {
		return matchRepo.update(dto);
	}
	
	@PutMapping("/")
	public boolean matchBoardUpdate(@RequestBody MatchBoardDto dto) {
		return matchBoardRepo.update(dto);
	}
	
	@PutMapping("/video")
	public boolean matchVideoUpdate(@RequestBody MatchBoardDto dto) {
		return matchBoardRepo.matchVideoUpdate(dto);
	}
	
	@GetMapping("/member/{memberId}")
	public MemberDto selectMember(@PathVariable String memberId) {
		return memberRepo.selectOne(memberId);
	}
	
	@GetMapping("/team/{memberId}")
	public TeamDto selectTeam(@PathVariable int teamNo) {
		return teamRepo.selectOne(teamNo);
	}
	
	@GetMapping("/list")
	public List<MatchBoardDto> selectList() {
		return matchBoardRepo.selectList();
	}
	
	@GetMapping("/selectList")
	public List<MatchBoardVO> selectListwithVO(){
		return matchBoardRepo.selectListwithVO();
	}
	
	@GetMapping("/teamList")
	public List<TeamDto> teamList(){
		return matchBoardRepo.teamList();
	}

}
