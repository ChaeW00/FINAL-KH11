package com.kh.finalkh11;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.MemberRepo;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class test01 {

	@Autowired
	private MemberRepo memberRepo;
	
	
	@Test
	public void test(@ModelAttribute MemberDto dto) {
		String id = "testuser1";
		MemberDto findDto = memberRepo.selectOne(id);
		
		log.debug("findDto={}",findDto);
	}
}
