package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.vo.GroundVO;

public interface GroundRepo {
	int sequence();
	void insert(GroundDto groundDto);
	void insert(GroundVO groundVO);
	List<GroundDto> list();
	GroundDto detail(int groundNo);
	List<GroundDto> selectByPaging(int page);
	boolean delete(int groundNo);
	boolean edit(GroundDto groundDto);
}