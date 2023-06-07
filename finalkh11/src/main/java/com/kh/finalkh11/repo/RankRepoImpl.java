package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.RankDto;
@Repository
public class RankRepoImpl implements RankRepo{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RankDto> selecList() {
		return sqlSession.selectList("ground.selectRank");
	}


}
