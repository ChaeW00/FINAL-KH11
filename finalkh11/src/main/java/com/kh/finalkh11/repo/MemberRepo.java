package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.vo.AdminPaginationVO;

public interface MemberRepo {
	MemberDto selectOne(String memberId);//로그인
	void insert(MemberDto memberDto);//회원가입
	MemberDto selectEmail(String memberEmail);//이메일 상세조회
	boolean delete(String memberId);//회원탈퇴
	boolean update(MemberDto memberDto);//회원정보 수정
	String findId(MemberDto memberDto); // 아이디 찾기
	String findPw(MemberDto memberDto);// 아이디와 이메일로 비밀번호 찾기
	boolean changePw(String memberId, String memberPw);//비밀번호 변경 기능
	
	List<MemberDto> selectList(AdminPaginationVO vo);//관리자 전용 회원목록
	int selectCount(AdminPaginationVO vo);//페이징 적용된 조회 및 카운트
	
	boolean updateManner(MemberDto memberDto);
	
	boolean adminChange(MemberDto memberDto);//회원상세목록
}
