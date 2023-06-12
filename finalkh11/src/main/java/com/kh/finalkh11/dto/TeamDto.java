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
	private int teamMemberCount;
	private long imgNo;
	private String teamLeaderName;
	private String imgUrl;
	private int teamRead;
	private Date teamUpdate;
	private int waitingCount;


	public String getImageURL() {
		return "/img/download/"+imgNo;
	}
}
