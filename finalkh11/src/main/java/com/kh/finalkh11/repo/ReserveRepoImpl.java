package com.kh.finalkh11.repo;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.ReserveDto;
import com.kh.finalkh11.dto.ScheduleDto;

@Repository
public class ReserveRepoImpl implements ReserveRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("reserve.sequence");
	}
	
	@Override
	public ReserveDto detail(int reserveNo) {
		return sqlSession.selectOne("reserve.detail", reserveNo);
	}

	@Override
	public void insert(ReserveDto reserveDto) {
		sqlSession.insert("reserve.add", reserveDto);
	}
	
	@Override
	public void process(int reserveNo) {
		sqlSession.update("reserve.process", reserveNo);
	}
	
	@Override
	public void clear(int reserveNo) {
		sqlSession.update("reserve.clear", reserveNo);
	}

	@Override
	public ScheduleDto timeCheck(int reserveNo) {
		return sqlSession.selectOne("reserve.timeCheck", reserveNo);
	}

	@Override
	public String completed(Date reserveDate, int scheduleNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("reserveDate", reserveDate);
		param.put("scheduleNo", scheduleNo);
		
		return sqlSession.selectOne("reserve.completed", param);
	}

	@Override
	public void cancel(int paymentNo) {
		sqlSession.delete("reserve.cancel", paymentNo);
	}

	@Override
	public List<ReserveDto> prevent(int reserveNo) {
		return sqlSession.selectList("reserve.prevent", reserveNo);
	}

	@Override
	public void remove(int reserveNo) {
		sqlSession.delete("reserve.remove", reserveNo);
	}
}