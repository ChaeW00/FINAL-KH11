package com.kh.finalkh11.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MatchReplyDto {
	private int matchReplyNo;
	private String memberId;
	private String matchReplyContent;
	private Date matchReplyTime;
	private int matchReplyGroup;
	private int matchBoardNo;
	
	public String getMatchReplyTimeAuto() {
	    // 현재 시각을 java.sql.Date 형태로 구한다
	    java.util.Date now = new java.util.Date();
	    java.util.Date write = new java.util.Date(matchReplyTime.getTime());
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
}
