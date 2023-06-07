package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.vo.RoomListVO;

public interface RoomListRepo {
	List<RoomListVO> selectRoomList(String memberId);
}