package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.GroundDto;

public interface GroundRepo {
	List<GroundDto> selectList(String term);
}
