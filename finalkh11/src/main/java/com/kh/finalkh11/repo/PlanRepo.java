package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.PlanDto;

public interface PlanRepo {
	List<PlanDto> planList(int teamNo);//tean_no로 일정 테이블 조회
	void insert(PlanDto planDto);//로그인한 회원이 아지트 캘린더에 일정 등록
	void insert2(PlanDto planDto);//일정등록(시퀀스번호미리발행한것을 따로 사용)
	int sequence();//시퀀스 번호 	발행
	boolean delete(int planNo);//일정 삭제
	
	List<PlanDto> planListSysdate(int teamNo);//sysdate보다 시작일이 빠른 스케줄은 포함하지 않는 목록

	List<PlanDto> planListRownum(int teamNo);//sysdate보다 시작일이 빠른 스케줄은 포함하지 않는 목록 rownum<=3
}
