package com.kh.finalkh11.service;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalkh11.dto.FreeChatMessageDto;
import com.kh.finalkh11.dto.FreeChatUserDto;
import com.kh.finalkh11.repo.FreeChatMessageRepo;
import com.kh.finalkh11.repo.FreeChatRoomRepo;
import com.kh.finalkh11.repo.FreeChatUserRepo;
import com.kh.finalkh11.vo.ChannelReceiveVO;
import com.kh.finalkh11.vo.MemberMessageVO;
import com.kh.finalkh11.vo.RoomVO;
import com.kh.finalkh11.vo.UserVO;
import com.kh.finalkh11.websocket.WebSocketConstant;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeChatServiceImpl implements FreeChatService {
	private Map<String, RoomVO> rooms = Collections.synchronizedMap(new HashMap<>());
	private ObjectMapper mapper = new ObjectMapper();
	
	@Autowired private FreeChatRoomRepo chatRoomRepo;
	@Autowired private FreeChatUserRepo chatUserRepo;
	@Autowired private FreeChatMessageRepo chatMessageRepo;
	
	public void createRoom(String roomName) {
		if(containsRoom(roomName)) return;
		rooms.put(roomName, new RoomVO());
		log.debug("abc = {}", roomName);
		if(chatRoomRepo.find(roomName) == null) {
			chatRoomRepo.insert(roomName);
		}
	}
	
	public void deleteRoom(String roomName) {
		rooms.remove(roomName);
	}
	
	public void join(UserVO user, String roomName) {
		createRoom(roomName);
		RoomVO room = rooms.get(roomName);
		room.enter(user);
		
		FreeChatUserDto userDto = new FreeChatUserDto();
		userDto.setRoomName(roomName);
		userDto.setMemberId(user.getMemberId());
		chatUserRepo.insert(userDto);
		
		if(chatUserRepo.check(userDto)) return;
		chatUserRepo.insert(userDto);
		log.debug("{}님이 {}방에 입장하였습니다", user.getMemberId(), roomName);
	}
	
	public void exit(UserVO user, String roomName) {
		if(!containsRoom(roomName)) return;
		RoomVO room = rooms.get(roomName);
		room.leave(user);
		FreeChatUserDto dto = new FreeChatUserDto();
		dto.setMemberId(user.getMemberId());
		dto.setRoomName(roomName);
		chatUserRepo.delete(dto);
		log.debug("{}님이 {}방에서 퇴장하였습니다", user.getMemberId(), roomName);
	}
	
	public void broadcastRoom(UserVO user, String roomName, TextMessage jsonMessage) throws IOException {
		if(!containsRoom(roomName)) return;
		RoomVO room = rooms.get(roomName);
		room.broadcast(jsonMessage);
		
		FreeChatMessageDto dto = new FreeChatMessageDto();
		dto.setMemberId(user.getMemberId());
		dto.setRoomName(roomName);
		dto.setMessageBody(jsonMessage.getPayload());
		chatMessageRepo.add(dto);
	}
	
	public String findUser(UserVO user) {
		for(String roomName : rooms.keySet()) {
			RoomVO room = rooms.get(roomName);
			if(room.contains(user)) return roomName;
		}
		return null;
	}
	
	public void moveUser(UserVO user, String roomName) {
		String beforeRoomName = findUser(user);
		exit(user, beforeRoomName);
		join(user, roomName);
	}
	
	public boolean containsRoom(String roomName) {
		return rooms.containsKey(roomName);
	}
	
	@Override
	public void connectHandler(WebSocketSession session) {
		// TODO Auto-generated method stub
		UserVO user = new UserVO(session);
		String roomName = WebSocketConstant.WAITING_ROOM;
		this.join(user, roomName);
	}
	@Override
	public void disconnectHandler(WebSocketSession session) {
		// TODO Auto-generated method stub
		UserVO user = new UserVO(session);
		String roomName = this.findUser(user);
		this.exit(user, roomName);
	}
	@Override
	public void receiveHandler(WebSocketSession session, TextMessage message) throws IOException {
		// TODO Auto-generated method stub
		UserVO user = new UserVO(session);
		ChannelReceiveVO receiveVO = mapper.readValue(message.getPayload(), ChannelReceiveVO.class);
		
		if(receiveVO.getType() == WebSocketConstant.CHAT) {
			String roomName = this.findUser(user);
			if(roomName == null) return;
			if(roomName.equals(WebSocketConstant.WAITING_ROOM)) return;
			
			MemberMessageVO msg = new MemberMessageVO();
			msg.setContent(receiveVO.getContent());
			msg.setTime(System.currentTimeMillis());
			msg.setMemberId(user.getMemberId());
			msg.setMemberLevel(user.getMemberLevel());
			
			String jsonStr = mapper.writeValueAsString(msg);
			TextMessage jsonMessage = new TextMessage(jsonStr);
			
			this.broadcastRoom(user, roomName, jsonMessage);
		}
		else if(receiveVO.getType() == WebSocketConstant.JOIN) {
			String roomName = receiveVO.getRoom();
			this.moveUser(user, roomName);
		}
	}
	
	
}
