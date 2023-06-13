package com.kh.finalkh11.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.repo.PaymentRepo;
import com.kh.finalkh11.vo.PaymentWithReserveVO;

//회원아이디와 관련된 비동기 처리(아이디 중복검사)
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	
	@Autowired
	private MemberRepo memberRepo;
	
	@Autowired
	private PaymentRepo paymentRepo;
	
	//사용가능하면(없으면) Y
	//사용불가하면(있으면) N
	@GetMapping("/memberId/{memberId}")//아이디 중복검사
	public String findId(@PathVariable String memberId) {
		//log.debug("result = {}, {}", memberRepo.selectOne(memberId), memberRepo.selectOne(memberId) == null);
		String tep = memberRepo.selectOne(memberId) == null ? "Y":"N";
		return tep;
	}
	
	@GetMapping("/memberEmail/{memberEmail}")//이메일 중복검사
	public String findEmail(@PathVariable String memberEmail) {
		//log.debug("result = {}, {}", memberRepo.selectEmail(memberEmail), memberRepo.selectEmail(memberEmail) == null);
		String email = memberRepo.selectEmail(memberEmail) == null ? "Y":"N";
		return email;
	}
	
	@PatchMapping("/update/manner/{memberId}")
	public boolean updateManner(@PathVariable String memberId, @RequestBody Map<String, Object> requestBody) {
		Number memberMannerObj = (Number)requestBody.get("memberManner");
		double memberManner = memberMannerObj.doubleValue();
		
		MemberDto dto = new MemberDto();
		dto = memberRepo.selectOne(memberId);
		dto.setMemberManner(memberManner);
		return memberRepo.updateManner(dto);
	}
	
	//결제 내역 조회
	@GetMapping("/paymentHistory/member/{memberId}")
	public List<PaymentWithReserveVO> paymentHistory(
			@PathVariable String memberId) {
		
		return paymentRepo.reserveInfo(memberId);
	}
}