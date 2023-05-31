package com.kh.finalkh11.service;

import java.net.URISyntaxException;

import com.kh.finalkh11.vo.KakaoPayApproveRequestVO;
import com.kh.finalkh11.vo.KakaoPayApproveResponseVO;
import com.kh.finalkh11.vo.KakaoPayCancelRequestVO;
import com.kh.finalkh11.vo.KakaoPayCancelResponseVO;
import com.kh.finalkh11.vo.KakaoPayOrderRequestVO;
import com.kh.finalkh11.vo.KakaoPayOrderResponseVO;
import com.kh.finalkh11.vo.KakaoPayReadyRequestVO;
import com.kh.finalkh11.vo.KakaoPayReadyResponseVO;

public interface KakaoPayService {
	//준비 : ready
	KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO vo) throws URISyntaxException;
	
	//승인 : approve
	KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO vo) throws URISyntaxException;
	
	//조회 : order
	KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO vo) throws URISyntaxException;
	
	//취소 : cancel
	KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO vo) throws URISyntaxException;

}