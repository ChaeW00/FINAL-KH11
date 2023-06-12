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
import com.kh.finalkh11.dto.ChatMessageDto;
import com.kh.finalkh11.repo.ChatMessageRepo;
import com.kh.finalkh11.vo.ChannelReceiveVO;
import com.kh.finalkh11.vo.MemberMessageVO;
import com.kh.finalkh11.vo.RoomVO;
import com.kh.finalkh11.vo.UserVO;
import com.kh.finalkh11.websocket.WebSocketConstant;

@Service
public class ChatServiceImpl implements ChatService{

	private Map<Integer, RoomVO> rooms = Collections.synchronizedMap(new HashMap<>());
	
	private ObjectMapper mapper = new ObjectMapper();
	
	@Autowired
	private ChatMessageRepo chatMessageRepo;
	
	public void createRoom(int roomNo) {
		if(containsRoom(roomNo)) return;
		rooms.put(roomNo, new RoomVO());
	}
	
	public void deleteRoom(int roomNo) {
		rooms.remove(roomNo);
	}
	
	public void join(UserVO user, int roomNo) {
		createRoom(roomNo);
		RoomVO room = rooms.get(roomNo);
		room.enter(user);
	}
	
	public void exit(UserVO user, int roomNo) {
		if(containsRoom(roomNo) == false) return;
		RoomVO room = rooms.get(roomNo);
		room.leave(user);
	}
	
	public void broadcastRoom(UserVO user, int roomNo, TextMessage jsonMessage) throws IOException{
		if(containsRoom(roomNo) == false) return;
		
		RoomVO room = rooms.get(roomNo);
		room.broadcast(jsonMessage);
		ChatMessageDto dto  = new ChatMessageDto();
		dto.setMessageNo(chatMessageRepo.sequence());
		dto.setMemberId(user.getMemberId());
		dto.setRoomNo(roomNo);
		dto.setMessageBody(jsonMessage.getPayload());
		chatMessageRepo.add(dto);
	}

	public Integer findRoom(UserVO user) {
		for(int roomNo : rooms.keySet()) {
			RoomVO room = rooms.get(roomNo);
			if(room.contains(user)) {
				return roomNo;
			}
		}
		return null;
	}
	public void move(UserVO user, int roomNo) {
		Integer beforeRoomNo = findRoom(user);
		exit(user, beforeRoomNo);
		join(user, roomNo);
	}
	
	public boolean containsRoom(int roomNo) {
		return rooms.containsKey(roomNo);
	}
	
	@Override
	public void connectHandler(WebSocketSession session) {
		UserVO user = new UserVO(session);
		int roomNo = WebSocketConstant.WAITING_ROOM;
		this.join(user, roomNo);
	}

	@Override
	public void disconnectHandler(WebSocketSession session) {
		UserVO user = new UserVO(session);
		int roomNo = this.findRoom(user);
		this.exit(user, roomNo);
	}

	@Override
	public void receiveHandler(WebSocketSession session, TextMessage message) throws IOException {
		UserVO user = new UserVO(session);
		ChannelReceiveVO receiveVO = mapper.readValue(message.getPayload(), ChannelReceiveVO.class);
		
		if(receiveVO.getType() == WebSocketConstant.CHAT) {
			
			Integer roomNo = this.findRoom(user);
			if(roomNo == WebSocketConstant.WAITING_ROOM) return;
			
			MemberMessageVO msg = new MemberMessageVO();
			msg.setContent(receiveVO.getContent());
			msg.setTime(System.currentTimeMillis());
			msg.setMemberId(user.getMemberId());
			msg.setMemberName(user.getMemberName());
			
			String jsonStr = mapper.writeValueAsString(msg);
			TextMessage jsonMessage = new TextMessage(jsonStr);
			
			this.broadcastRoom(user, roomNo, jsonMessage);
		}
		
		else if(receiveVO.getType() == WebSocketConstant.JOIN) {
			int roomNo = receiveVO.getRoom();
			this.move(user, roomNo);
		}
	}

}