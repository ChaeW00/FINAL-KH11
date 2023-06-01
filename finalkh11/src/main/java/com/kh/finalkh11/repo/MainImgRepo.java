package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MainImgDto;

public interface MainImgRepo {
	
	int sequence();//시퀀스
	void insert(MainImgDto mainImgDto);//등록
	void delete(int mainNo);//삭제
	List<MainImgDto> mainImgList();//이미지 리스트
	MainImgDto selectOne(int mainNo);// 단일조회
}
