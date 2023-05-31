package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.PaymentDto;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.repo.PaymentRepo;

import lombok.extern.slf4j.Slf4j;

//회원아이디와 관련된 비동기 처리(아이디 중복검사)
@Slf4j
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
	
	@GetMapping("/paymentHistory/{memberId}")
	public List<PaymentDto> paymentHistory(
			@PathVariable String memberId) {
		
		return paymentRepo.selectByMember(memberId);
	}
}