package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.EntryDto;
import com.kh.finalkh11.vo.EntryVO;

public interface EntryRepo {
	int getSequence();
	void insert(EntryDto entryDto);
	EntryDto selectOne(int entryNo);
	boolean delete(int entryNo);
	List<EntryDto> selectByMatchNo(int matchNo);
	List<EntryVO> selectByMatchNoWithVO(int matchNo);
	boolean updateAway(EntryDto entryDto);
	boolean deleteWait(int matchNo);
}
