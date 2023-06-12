package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.EntryDto;
import com.kh.finalkh11.vo.EntryVO;

@Repository
public class EntryRepoImpl implements EntryRepo{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getSequence() {
		return sqlSession.selectOne("entry.getSequence");
	}
	
	@Override
	public void insert(EntryDto entryDto) {
		sqlSession.insert("entry.add", entryDto);
	}

	@Override
	public boolean delete(int entryNo) {
		return sqlSession.delete("entry.remove", entryNo) > 0;
	}

	@Override
	public EntryDto selectOne(int entryNo) {
		return sqlSession.selectOne("entry.selectOne", entryNo);
	}

	@Override
	public List<EntryDto> selectByMatchNo(int matchNo) {
		return sqlSession.selectList("entry.selectByMatchNo",matchNo);
	}
	
	@Override
	public List<EntryVO> selectByMatchNoWithVO(int matchNo) {
		return sqlSession.selectList("entry.selectByMatchNoWithVO",matchNo);
	}

	@Override
	public boolean updateAway(EntryDto entryDto) {
		return sqlSession.update("entry.updateAway", entryDto) > 0;
	}

	@Override
	public boolean deleteAllWait(int matchNo) {
		return sqlSession.delete("entry.deleteAllWait",matchNo) > 0;
	}

	@Override
	public boolean deleteGroup(int matchNo, int teamNo, String teamType) {
		Map<String, Object> params = new HashMap<>();
		params.put("matchNo", matchNo);
		params.put("teamNo", teamNo);
		params.put("teamType", teamType);
		return sqlSession.delete("entry.deleteGroup",params) > 0;
	}

	@Override
	public boolean update(EntryDto entryDto) {
		return sqlSession.update("entry.update",entryDto) > 0;
	}
}
