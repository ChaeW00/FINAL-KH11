package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.MainImgDto;
@Repository
public class MainImgRepoImpl implements MainImgRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("img.sequence");
	}

	@Override
	public void insert(MainImgDto mainImgDto) {
		sqlSession.insert("img.insertMain",mainImgDto);
	}

	@Override
	public void delete(int mainNo) {
		sqlSession.delete("img.deleteMain",mainNo);
	}

	@Override
	public List<MainImgDto> mainImgList() {
		return sqlSession.selectList("img.imgList");
	}

	@Override
	public MainImgDto selectOne(int mainNo) {
		return sqlSession.selectOne("img.selectOneImg",mainNo);
	}



}
