package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.GroundPaymentViewDto;
@Repository
public class GroundPaymentViewRepoImpl implements GroundPaymentViewRepo{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GroundPaymentViewDto> selecList() {
		return sqlSession.selectList("ground.selectRank");
	}


}
