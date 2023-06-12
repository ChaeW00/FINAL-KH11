package com.kh.finalkh11.vo;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.TextMessage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RoomVO {
	private Set<UserVO> users = new CopyOnWriteArraySet<>();
	
	public void enter(UserVO user) {
		users.add(user);
	}
	
	public void leave(UserVO user) {
		users.remove(user);
	}
	
	public int size() {
		return users.size();
	}

	public boolean contains(UserVO user) {
		return users.contains(user);
	}

	public void broadcast(TextMessage jsonMessage) throws IOException {
		for(UserVO user : users) {
			user.send(jsonMessage);
		}
	}
}

