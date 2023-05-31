package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.PlanDto;

@Repository
public class PlanRepoImpl implements PlanRepo {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PlanDto> planList(int teamNo) {
		return sqlSession.selectList("plan.list", teamNo);
	}
	
	@Override
	public void insert(PlanDto planDto) {
		sqlSession.insert("plan.insert", planDto);
	}
	
	@Override
	public int sequence() {//시퀀스 번호 발행
		return sqlSession.selectOne("plan.sequence");
	}
	
	@Override
	public void insert2(PlanDto planDto) {
		sqlSession.insert("plan.insert2", planDto);
	}
	
	@Override
	public boolean delete(int planNo) {
		int count=sqlSession.delete("plan.delete",planNo);
		return count>0;
	}
	
	@Override
	public List<PlanDto> planListSysdate(int teamNo) {
		return sqlSession.selectList("plan.listSysdate", teamNo);
	}
	
	@Override
	public List<PlanDto> planListRownum(int teamNo) {
		return sqlSession.selectList("plan.listRownum", teamNo);
	}
	
}
