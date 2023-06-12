package com.kh.finalkh11.repo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.GroundImageDto;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MainImgConnectDto;

@Repository
public class ImgRepoImpl implements ImgRepo{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("img.sequence");
	}

	@Override
	public void insert(ImgDto dto) {
		sqlSession.insert("img.imgInsert",dto);
	}

	@Override
	public ImgDto selectOne(long imgNo) {
		return sqlSession.selectOne("img.imgSelectOne",imgNo);
	}

	@Override
	public boolean update(ImgDto imgDto) {
		return sqlSession.update("img.imgUpdate",imgDto)>0;
	}

	@Override
	public boolean delete(int imgNo) {
		return sqlSession.delete("img.deleteImg",imgNo)>0;
	}

	@Override
	public void insert(MainImgConnectDto connectDto) {
		sqlSession.insert("img.connectImgInsert",connectDto);
	}
	
	@Override
	public void groundImageInsert(GroundImageDto groundImageDto) {
		sqlSession.insert("img.groundImageInsert", groundImageDto);
	}

	@Override
	public boolean deleteGroundImage(int imgNo) {
		return sqlSession.delete("img.deleteGroundImage", imgNo) > 0;
	}
}
