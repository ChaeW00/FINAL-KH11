package com.kh.finalkh11.vo;

import lombok.Data;

@Data
public class KakaoPayCardInfoVO {
	private String purchase_corp, purchase_corp_code;//매입 카드사 정보
	private String issuer_corp, issuer_corp_code;//카드 발급사 정보
	private String kakaopay_purchase_corp, kakaopay_purchase_corp_code;//카카오페이 카드사 정보
	private String kakaopay_issuer_corp, kakaopay_issuer_corp_code;// 카카오페이 카드 발급사 정보
	private String bin;//카드 BIN 코드
	private String card_type;//카드 유형
	private String install_month;//할부 개월 수
	private String approved_id;//카드 승인 번호
	private String card_mid;//카드 가맹점 번호
	private String interest_free_install;//무이자 할부 여부(Y/N)
	private String card_item_code;//카드 상품 코드
}