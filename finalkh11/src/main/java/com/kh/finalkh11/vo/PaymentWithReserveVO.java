package com.kh.finalkh11.vo;

import com.kh.finalkh11.dto.PaymentDto;
import com.kh.finalkh11.dto.ReserveDto;

import lombok.Data;

@Data
public class PaymentWithReserveVO {
	private PaymentDto paymentDto;
	private ReserveDto reserveDto;
}