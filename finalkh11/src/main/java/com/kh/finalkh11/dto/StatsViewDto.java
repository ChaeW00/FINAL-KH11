package com.kh.finalkh11.dto;

import lombok.Data;

@Data
public class StatsViewDto {
	private int groundNo;
	private String groundBasicAddr;
	private int paymentRemain;
	private int paymentRank;
	
	private String teamNo;
	private String teamName;
	private int totalWins;
	private int totalLosses;
	private int ranking;
	
	private String memberLevel;
	private int count;
}
