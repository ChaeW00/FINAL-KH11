package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.repo.MemberRepo;

import lombok.extern.slf4j.Slf4j;

//회원과 관련된 비동기 처리
@Slf4j
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	
	@Autowired
	private MemberRepo memberRepo;
	
	//사용가능하면(없으면) Y
	//사용불가하면(있으면) N
	@GetMapping("/{memberId}")
	public String findId(@PathVariable String memberId) {
//		log.debug("result = {}, {}", memberRepo.selectOne(memberId), memberRepo.selectOne(memberId) == null);
		return memberRepo.selectOne(memberId) == null ? "Y":"N";
	}
}