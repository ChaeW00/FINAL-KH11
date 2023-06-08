package com.kh.finalkh11.dto;

import lombok.Data;

@Data
public class GroundPaymentViewDto {
	private int groundNo;
	private String groundBasicAddr;
	private int paymentRemain;
	private int paymentRank;
}
