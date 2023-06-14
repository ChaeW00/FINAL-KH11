package com.kh.finalkh11.vo;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data


@EqualsAndHashCode(of = {"session"})
public class UserVO {
	private WebSocketSession session;
	private String memberId;
	private String memberName;
	
	public UserVO(WebSocketSession session) {
		this.session = session;
		Map<String, Object> attr = session.getAttributes();
		this.memberId = (String)attr.get("memberId");
		this.memberName = (String)attr.get("memberName");
	}
	
	public boolean isMember() {
		return this.memberId != null;
	}
	public void send(TextMessage jsonMessage) throws IOException {
		session.sendMessage(jsonMessage);		
	}
}

