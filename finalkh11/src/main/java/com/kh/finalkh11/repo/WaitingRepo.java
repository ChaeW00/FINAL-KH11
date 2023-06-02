package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.WaitingDto;
import com.kh.finalkh11.vo.MemberInfoVO;

public interface WaitingRepo {
	int sequence();
	void insert(WaitingDto waitingDto);
	List<MemberInfoVO> memberInfo(int teamNo);
	boolean delete(String memberId);
}