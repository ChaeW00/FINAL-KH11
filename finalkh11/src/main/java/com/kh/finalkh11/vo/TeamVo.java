package com.kh.finalkh11.vo;

import lombok.Data;

@Data
public class TeamVo {
	
	//팀 정보 관련
	private int teamNo;
	private int teamName;
	private String teamInfo;
	private String teamLeader;
	private String teamDay; 
	private String teamTime;
	private String teamCity;
	private String teamLocation;
	private String teamGender;
	private String teamAge;
	
//	private int attachmentNo;

	
	//아지트 가입 관련
	private String memberId;
	

}


