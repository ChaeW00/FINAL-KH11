package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.GroundDto;

@Repository
public class GroundRepoImpl implements GroundRepo{

	@Autowired
	private SqlSession sqlSession;
   
	@Override
	public List<GroundDto> list() {
	   return sqlSession.selectList("ground.list");
	}

	@Override
	public GroundDto detail(int groundNo) {
		return sqlSession.selectOne("ground.detail", groundNo);
	}

	@Override
	public List<GroundDto> selectByPaging(int page) {
		int end = page * 10;
		int begin = end - 9;
		Map<String, Object> param = Map.of("begin", begin, "end", end);
		return sqlSession.selectList("ground.infinite", param);
	}
}