package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.ScheduleDto;

@Repository
public class ScheduleRepoImpl implements ScheduleRepo {
	@Autowired private SqlSession sqlSession;
	@Override
	public List<ScheduleDto> selectList(int groundNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.selectList", groundNo);
	}
}
