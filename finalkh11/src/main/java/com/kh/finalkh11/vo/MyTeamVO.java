package com.kh.finalkh11.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MyTeamVO {

	//내가 가입한 아지트
	private int teamNo;
//	private int ahzitAttachmentNo;
	private String teamLeader;
	private String teamName;
	private String teamCity;
//	private String teamLocation;
	private String memberName;
}