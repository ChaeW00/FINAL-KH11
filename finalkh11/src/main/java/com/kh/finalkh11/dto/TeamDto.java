package com.kh.finalkh11.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamDto {
	private int teamNo;    
	private String teamLeader;	 
	private String teamInfo;  	 
//	private int imgNo;
	private String teamName;		
	private String teamDay; 
	private String teamTime;
	private String teamCity;
	private String teamLocation;
	private String teamGender;
	private String teamAge;
	private int teamWin;
	private int teamLose;
	private Date teamDate;
	// (추가)
	//private int teamAttachmentNo;
	
}
