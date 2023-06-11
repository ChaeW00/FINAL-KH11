package com.kh.finalkh11.dto;

import java.text.SimpleDateFormat;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatchBoardDto {
	private int matchBoardNo;
	private String memberId;
	private String matchBoardTitle;
	private String matchBoardContent;
	private Date matchBoardTime;
	private int matchBoardReply;
	private int matchBoardRead;
	private String matchBoardCity;
	private String matchBoardLocation;
	private Date matchBoardDate;
	private String matchBoardTime2;
	private String matchBoardAge;
	private String matchBoardSize;
	private String matchBoardStatus;
	private int matchBoardVideo;
	
	public String getMatchBoardTimeAuto() {
	    // 현재 시각을 java.sql.Date 형태로 구한다
	    java.util.Date now = new java.util.Date();
	    java.util.Date write = new java.util.Date(matchBoardTime.getTime());
	    SimpleDateFormat f = new SimpleDateFormat("yy-MM-dd HH:mm");

	    String nowStr = f.format(now); // 형식이 변환된 현재시각
	    String writeStr = f.format(write); // 형식이 변환된 작성시각

	    if (nowStr.substring(0, 8).equals(writeStr.substring(0, 8))) {
	        // 현재일자 == 작성일자
	        return writeStr.substring(9); // "HH:mm"
	    } else {
	        return writeStr.substring(0, 8); // "yy-MM-dd"
	    }
	}
	
	public Date getMatchBoardDate() {
        return matchBoardDate;
    }
	
	@DateTimeFormat(pattern = "yy-MM-dd")
	public void setMatchBoardDate(Date matchBoardDate) {
		this.matchBoardDate = matchBoardDate;
	}

}
