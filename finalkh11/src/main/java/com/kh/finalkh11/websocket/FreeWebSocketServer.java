package com.kh.finalkh11.websocket;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalkh11.vo.ChannelReceiveVO;
import com.kh.finalkh11.vo.ChannelVO;
import com.kh.finalkh11.vo.MemberMessageVO;
import com.kh.finalkh11.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeWebSocketServer extends TextWebSocketHandler {
	private ChannelVO channel = new ChannelVO();
	private ObjectMapper mapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		UserVO user = new UserVO(session);
		String roomName = WebSocketConstant.WAITING_ROOM;
		channel.join(user, roomName);
		log.debug("접속완료");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		UserVO user = new UserVO(session);
		String roomName = channel.findUser(user);
		channel.exit(user, roomName);
		log.debug("접속종료");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		UserVO user = new UserVO(session);

		ChannelReceiveVO receiveVO = mapper.readValue(message.getPayload(), ChannelReceiveVO.class);

		if (receiveVO.getType() == WebSocketConstant.CHAT) {
			String roomName = channel.findUser(user);
			MemberMessageVO msg = new MemberMessageVO();
			msg.setContent(receiveVO.getContent());
			msg.setTime(System.currentTimeMillis());
			msg.setMemberId(user.getMemberId());
			msg.setMemberLevel(user.getMemberLevel());
			String jsonStr = mapper.writeValueAsString(msg);
			TextMessage jsonMessage = new TextMessage(jsonStr);
			channel.broadcast(jsonMessage, roomName);
		}
		else if(receiveVO.getType() == WebSocketConstant.JOIN) {
			String roomName = receiveVO.getRoom();
			log.debug("roonName = {}", roomName);
			log.debug("roomKey = {}", channel.getRooms());
			channel.moveUser(user, roomName);
		}
	}
}
