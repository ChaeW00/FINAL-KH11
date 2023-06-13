package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.vo.GroundPaginationVO;
import com.kh.finalkh11.vo.GroundVO;
import com.kh.finalkh11.vo.SearchVO;

public interface GroundRepo {
	int sequence();
	void insert(GroundDto groundDto);
	void insert(GroundVO groundVO);
	List<GroundDto> list();
	GroundDto detail(int groundNo);
	List<GroundDto> selectByPaging(int page);
	boolean delete(int groundNo);
	boolean edit(GroundDto groundDto);
	List<GroundDto> adminList(GroundPaginationVO vo);//관리자 전용 구장 목록
	int selectCount(GroundPaginationVO vo); //페이징 적용된 조회 및 카운트
	List<SearchVO> totalSearch(String keyword);
	 List<GroundDto> selectList(String term);
}