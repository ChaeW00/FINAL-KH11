package com.kh.finalkh11.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalkh11.service.FreeChatService;
import com.kh.finalkh11.vo.ChannelVO;
import com.kh.finalkh11.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeWebSocketServer extends TextWebSocketHandler {
	private ChannelVO channel = new ChannelVO();
	private ObjectMapper mapper = new ObjectMapper();
	
	@Autowired private FreeChatService chatService;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		chatService.connectHandler(session);
		log.debug("접속완료");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		chatService.disconnectHandler(session);
		log.debug("접속종료");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		chatService.receiveHandler(session, message);
	}
}
