package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.MemberDto;

public interface MemberRepo {
	MemberDto memberLogin(String memberId);
}