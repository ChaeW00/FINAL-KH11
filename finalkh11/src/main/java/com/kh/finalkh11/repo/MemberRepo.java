package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.MemberDto;

public interface MemberRepo {
	MemberDto selectOne(String memberId);//로그인
	void insert(MemberDto memberDto);//회원가입
	MemberDto selectEmail(String memberEmail);//이메일 상세조회
	boolean delete(String memberId);//회원탈퇴
}
