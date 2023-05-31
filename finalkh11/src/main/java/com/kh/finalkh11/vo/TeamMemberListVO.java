package com.kh.finalkh11.vo;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamMemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class TeamMemberListVO {
	private TeamMemberDto teamMemberDto;
	private MemberDto memberDto;
}
