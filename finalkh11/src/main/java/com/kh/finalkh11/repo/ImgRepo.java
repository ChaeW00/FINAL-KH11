package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.ImgDto;

public interface ImgRepo {
	int sequence();//시퀀스
	void insert(ImgDto dto); //이미지 등록
	ImgDto selectOne(int imgNo);//이미지 상세조회
	boolean update(ImgDto imgDto);//이미지 수정
	
}
