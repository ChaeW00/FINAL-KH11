package com.kh.finalkh11.vo;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamMemberDto;

import lombok.Data;

@Data
public class TeamInMemberInfoVO {
	private MemberDto memberDto;
	private TeamMemberDto teamMemberDto;
}