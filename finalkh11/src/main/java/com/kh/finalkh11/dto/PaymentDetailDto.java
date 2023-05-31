package com.kh.finalkh11.dto;

import lombok.Data;

@Data
public class PaymentDetailDto {
	private int paymentDetailNo;		//결제 상세 고유번호
	private int paymentNo;				//결제 고유번호
	private int itemNo;					//상품 고유번호
	private String itemName;			//상품 이름
	private int itemPrice;				//상품 개당 가격
	private int itemQty;				//상품 구매 수량
	private String paymentDetailStatus;	//상품 결제 상태(완료/취소)
	
	public int getItemTotal() {			//전체 구매 금액
		return itemPrice * itemQty;
	}
}