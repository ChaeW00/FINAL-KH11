package com.kh.finalkh11.vo;

import lombok.Data;

@Data
public class KakaoPayReadyRequestVO {
	private String partner_order_id;
	private String partner_user_id;
	private String item_code;
	private String item_name;
	private int quantity;
	private int total_amount;
}