package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.PaymentDto;
import com.kh.finalkh11.vo.PaymentWithReserveVO;

@Repository
public class PaymentRepoImpl implements PaymentRepo{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("payment.sequence");
	}

	@Override
	public void save(PaymentDto dto) {
		sqlSession.insert("payment.save", dto);
	}

	@Override
	public List<PaymentDto> selectAll() {
		return sqlSession.selectList("payment.selectAll");
	}

	@Override
	public List<PaymentDto> selectByMember(String memberId) {
		return sqlSession.selectList("payment.selectByMember", memberId);
	}

	@Override
	public PaymentDto find(int paymentNo) {
		return sqlSession.selectOne("payment.find", paymentNo);
	}

	@Override
	public void cancelRemain(int paymentNo) {
		sqlSession.update("payment.cancelRemain", paymentNo);
	}

	@Override
	public void cancelRemain(int paymentNo, int itemTotal) {
		Map<String, Object> param = new HashMap<>();
		param.put("paymentNo", paymentNo);
		param.put("itemTotal", itemTotal);
		sqlSession.update("payment.cancelRemainItem", param);
	}

	@Override
	public List<PaymentWithReserveVO> reserveInfo(String memberId) {
		return sqlSession.selectList("payment.reserveInfo", memberId);
	}
}