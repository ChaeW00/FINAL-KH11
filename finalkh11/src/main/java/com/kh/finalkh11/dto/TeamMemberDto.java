package com.kh.finalkh11.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class TeamMemberDto {

	private int teamMemberNo;
	private int teamNo;
	private String memberId;
	private String teamMemberLevel;
}
