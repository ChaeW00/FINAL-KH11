package com.kh.finalkh11.vo;

import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.dto.MemberDto;

import lombok.Data;

@Data
public class MatchInMemberInfoVO {
	private MemberDto memberDto;
	private MatchBoardDto matchBoardDto;
}
