package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.GroundImageDto;
import com.kh.finalkh11.vo.GroundImageVO;

public interface GroundImageRepo {
	void insert(int groundNo, int imgNo);
	List<GroundImageDto> groundImgList(int groundNo);
	List<GroundImageVO> groundImageList(int groundNo);
}