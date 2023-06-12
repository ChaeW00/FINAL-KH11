package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.vo.GroundPaginationVO;
import com.kh.finalkh11.vo.GroundVO;
import com.kh.finalkh11.vo.SearchVO;

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

	
	//단어 검색
	@Override
	public List<GroundDto> selectList(String term) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ground.check", term);

	}
	@Override
	public int sequence() {
		return sqlSession.selectOne("ground.sequence");
	}
	
	@Override
	public void insert(GroundDto groundDto) {
		sqlSession.insert("ground.insert2", groundDto);
	}
	
	@Override
	public void insert(GroundVO groundVO) {
		sqlSession.insert("ground.insert", groundVO);
	}

	@Override
	public boolean delete(int groundNo) {
		return sqlSession.delete("ground.delete", groundNo) > 0;
	}

	@Override
	public boolean edit(GroundDto groundDto) {
		return sqlSession.update("ground.edit", groundDto) > 0;

	}

	@Override
	public List<GroundDto> adminList(GroundPaginationVO vo) {
		return sqlSession.selectList("ground.adminList", vo);
	}

	@Override
	public int selectCount(GroundPaginationVO vo) {
		return sqlSession.selectOne("ground.countSearch",vo);
	}

	@Override
	public List<SearchVO> totalSearch(String keyword) {
		return sqlSession.selectList("ground.totalSearch", keyword);
	}
}