package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.PaymentDto;
import com.kh.finalkh11.vo.PaymentListVO;

public interface PaymentRepo {
	int sequence();
	void save(PaymentDto dto);
	List<PaymentDto> selectAll();
	List<PaymentDto> selectByMember(String memberId);
	PaymentDto find(int no);
	
	List<PaymentListVO> treeSelect();
	List<PaymentListVO> treeSelect(String memberId);
	
	void cancelRemain(int paymentNo);//전체 취소
	void cancelRemain(int paymentNo, int itemTotal);//금액 차감
}