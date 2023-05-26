package com.kh.finalkh11.vo;

import java.sql.Date;

import lombok.Data;

//카카오페이 승인 요청의 결과 데이터
@Data
public class KakaoPayApproveResponseVO {
	private String aid; //요청 고유 번호
	private String tid; //거래번호
	private String cid; //가맹점코드
	private String sid; ///정기결제코드(정기 결제 시)
	private String partner_order_id; //주문번호
	private String partner_user_id; //주문자
	private String payment_method_type; //결제수단(Card/Money)

	private KakaoPayAmountVO amount; //결제 승인 금액 정보
	private KakaoPayCardInfoVO CardInfo;//결제 카드 정보(카드 결제 시)
	
	private String item_name; //상품 이름
	private String item_code; //상품 코드
	
	private int quantity; //상품 수량
	private Date created_at; //준비 요청 시각
	private Date approved_at; //승인 완료 시각
	private String payload; //메모
}