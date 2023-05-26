package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.PaymentDetailDto;

public interface PaymentDetailRepo {
	void save(PaymentDetailDto paymentDetailDto);
	void cancelPaymentDetail(int paymentNo);
	PaymentDetailDto find(int paymentDetailNo);
	void cancelPaymentDetailItem(int paymentDetailNo);
	
}