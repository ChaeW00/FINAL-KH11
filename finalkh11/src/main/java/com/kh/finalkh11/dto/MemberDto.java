package com.kh.finalkh11.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDto {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberLevel;
	private String memberEmail;
	private String memberGender;
	private double memberManner;
	private String memberBirth;
	private long imgNo;
}
