package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.GroundImageDto;
import java.util.List;

import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MainImgConnectDto;
import com.kh.finalkh11.vo.MainImgConnectVO;

public interface ImgRepo {
	int sequence();//시퀀스
	void insert(ImgDto dto); //이미지 등록
	ImgDto selectOne(long imgNo);//이미지 상세조회
	boolean update(ImgDto imgDto);//이미지 수정
	boolean delete(int imgNo);//이미지 삭제
	void groundImageInsert(GroundImageDto groundImageDto);
	void insert(MainImgConnectDto connectDto);
	boolean deleteGroundImage(int imgNo);
}
