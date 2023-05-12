package com.kh.finalkh11.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatchDto {
	private int matchNo;
	private String memberId;
	private String matchTitle;
	private String matchCity;
	private String matchLocation;
	private Date matchDate;
	private String matchTime;
	private String matchAge;
	private String matchSize;
	private String matchStatus;
	private Integer teamNo;
	private Integer opposingNo;
	
	public Date getMatchDate() {
        return matchDate;
    }
	
	 @DateTimeFormat(pattern = "yy-MM-dd")
	    public void setMatchDate(Date matchDate) {
	        this.matchDate = matchDate;
	  }
}
