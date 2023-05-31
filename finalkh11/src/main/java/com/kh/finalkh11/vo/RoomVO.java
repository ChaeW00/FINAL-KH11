package com.kh.finalkh11.vo;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.TextMessage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RoomVO {
	private Set<UserVO> users = new CopyOnWriteArraySet<>();
	
	public Set<UserVO> getUsers(){
		return users;
	}
	
	public void setUsers(Set<UserVO> users) {
		this.users = users;
	}
	
	public void enter(UserVO user) {
		users.add(user);
	}
	
	public void leave(UserVO user) {
		users.remove(user);
	}
	
	public int size() {
		return users.size();
	}
	
	public boolean contains(UserVO vo) {
		return users.contains(vo);
	}
	
	public void broadcast(TextMessage jsonMessage) throws IOException {
		log.debug("user = {}", users);
		for(UserVO user : users) {
			user.send(jsonMessage);
		}
	}
}
