package com.kh.finalkh11.vo;

import lombok.Data;

@Data
public class TeamVO {
	
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
	private int teamMemberCount;
	private int imgNo;

	
	//팀가입 관련
	private String memberId;
	

}


