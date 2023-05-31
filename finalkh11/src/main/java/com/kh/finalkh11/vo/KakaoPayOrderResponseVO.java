package com.kh.finalkh11.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class KakaoPayOrderResponseVO {
	private String tid;//거래 번호
	private String cid;//가맹점 코드
	private String status;//결제 상태
	private String partner_order_id;//주문 번호
	private String partner_user_id;//주문자
	private String payment_method_type;//결제 수단
	
	private KakaoPayAmountVO amount;//결제 금액
	private KakaoPayAmountVO canceled_amount;//취소 금액
	private KakaoPayAmountVO cancel_available_amount;//취소 가능 금액
	
	private String item_name;//상품 이름
	private String item_code;//상품 코드
	private int quantity;//상품 수량
	
	private Date created_at;//결제 준비 요청 시각
	private Date approved_at;//결제 승인 시각
	private Date canceled_at;//결제 취소 시각
	
	private KakaoPaySelectedCardInfoVO selected_card_info;//카드 정보
	private List<PaymentActionDetailsVO> payment_action_details;//결제 취소/상세
}