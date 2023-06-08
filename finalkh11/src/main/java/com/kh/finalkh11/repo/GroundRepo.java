package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.GroundDto;

public interface GroundRepo {
   List<GroundDto> list();
   GroundDto detail(int groundNo);
   List<GroundDto> selectByPaging(int page);
   List<GroundDto> selectList(String term);
}