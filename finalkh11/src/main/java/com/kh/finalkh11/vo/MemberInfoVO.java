package com.kh.finalkh11.vo;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.WaitingDto;

import lombok.Data;

@Data
public class MemberInfoVO {
	private MemberDto memberDto;
	private WaitingDto waitingDto;
}