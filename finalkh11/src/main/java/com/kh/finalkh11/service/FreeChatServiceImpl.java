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
import com.kh.finalkh11.dto.FreeChatUserDto;
import com.kh.finalkh11.repo.FreeChatRoomRepo;
import com.kh.finalkh11.repo.FreeChatUserRepo;
import com.kh.finalkh11.vo.ChannelReceiveVO;
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
	
	public void createRoom(String roomName) {
		if(containsRoom(roomName)) return;
		rooms.put(roomName, new RoomVO());
		if(chatRoomRepo.find(roomName) == null) {
			chatRoomRepo.insert(roomName);
		}
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
	}
	
	public void moveUser(UserVO user, String roomName) {
		
	}
	
	public boolean containsRoom(String roomName) {
		return rooms.containsKey(roomName);
	}
	
	@Override
	public void connectHandler(WebSocketSession sesion) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void disconnectHandler(WebSocketSession session) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void receiveHandler(WebSocketSession session, TextMessage message) throws IOException {
		// TODO Auto-generated method stub
		UserVO user = new UserVO(session);
		ChannelReceiveVO receiveVO = mapper.readValue(message.getPayload(), ChannelReceiveVO.class);
		
		if(receiveVO.getType() == WebSocketConstant.CHAT) {}
		else if(receiveVO.getType() == WebSocketConstant.JOIN) {
			String roomName = receiveVO.getRoom();
			createRoom(roomName);
		}
	}
	
	
}
