package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.GroundImageDto;
import com.kh.finalkh11.vo.GroundImageVO;

@Repository
public class GroundImageRepoImpl implements GroundImageRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int groundNo, int imgNo) {
		Map<String, Object> param = new HashMap<>();
		
		param.put("groundNo", groundNo);
		param.put("imgNo", imgNo);
		
		sqlSession.insert("img.groundImageInsert", param);
	}

	@Override
	public List<GroundImageDto> groundImgList(int groundNo) {
		return sqlSession.selectList("img.groundImageList", groundNo);
	}

	@Override
	public List<GroundImageVO> groundImageList(int groundNo) {
		return sqlSession.selectList("img.groundImageList2", groundNo);
	}
}