package com.kh.finalkh11.vo;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.TextMessage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChannelVO {
	Map<String, RoomVO> rooms = Collections.synchronizedMap(new HashMap<>());
	
	public void createRoom(String roomName) {
		if(containsRoom(roomName)) return;
		rooms.put(roomName, new RoomVO());
	}
	
	public void deleteRoom(String roomName) {
		rooms.remove(roomName);
	}
	
	public boolean containsRoom(String roomName) {
		return rooms.containsKey(roomName);
	}
	
	public void join(UserVO user, String roomName) {
		createRoom(roomName);
		RoomVO room = rooms.get(roomName);
		room.enter(user);
		log.debug("{} 님이 {} 방에 입장하였습니다", user.getMemberId(), roomName);
	}
	
	public void exit(UserVO user, String roomName) {
		RoomVO room = rooms.get(roomName);
		room.leave(user);
		log.debug("{} 님이 {} 방에서 퇴장하였습니다", user.getMemberId(), roomName);
	}
	
	public String findUser(UserVO user) {
		for(String roomName : rooms.keySet()) {
			RoomVO room = rooms.get(roomName);
			if(room.contains(user)) {
				log.debug("111");
				return roomName;
			}
		}
		log.debug("222");
		return null;
	}
	
	public void moveUser(UserVO user, String roomName) {
		String beforeRoomName = findUser(user);
		exit(user, beforeRoomName);
		join(user, roomName);
	}
	
	public void broadcast(TextMessage jsonMessage, String roomName) throws IOException {
		if(!containsRoom(roomName)) return;
		RoomVO room = rooms.get(roomName);
		room.broadcast(jsonMessage);
	}
	
	public Map<String, RoomVO> getRooms() {
		return rooms;
	}
}
