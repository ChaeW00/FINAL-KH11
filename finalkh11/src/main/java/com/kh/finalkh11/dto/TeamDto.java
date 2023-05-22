package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamDto {
	private int teamNo;    
	private String teamLeader;	// memberId fk 
	private String teamName;		
	private String teamInfo;  	 
	private String teamCity;
	private String teamLocation;
	private String teamDay; 
	private String teamTime;
	private String teamGender;
	private String teamAge;
	private int teamWin;
	private int teamLose;
	private Date teamDate;
	
	// (추가)
	//private long imgNo;
	
}
