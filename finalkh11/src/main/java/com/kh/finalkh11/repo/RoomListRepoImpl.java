package com.kh.finalkh11.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.vo.RoomListVO;

@Repository
public class RoomListRepoImpl implements RoomListRepo{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RoomListVO> selectRoomList(String memberId) {
		return sqlSession.selectList("roomList.selectRoomList",memberId);
	}

}