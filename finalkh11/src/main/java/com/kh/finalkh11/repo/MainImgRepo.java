package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MainImgDto;
import com.kh.finalkh11.vo.MainImgConnectVO;

public interface MainImgRepo {
	
	int sequence();//시퀀스
	void insert(MainImgDto mainImgDto);//등록
	void delete(int imgNo);//삭제
	List<MainImgConnectVO> mainImgList();//이미지 리스트
	MainImgDto selectOne(int mainNo);// 단일조회
}
