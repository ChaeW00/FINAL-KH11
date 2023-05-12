package com.kh.finalkh11.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.ChatMessageDto;
import com.kh.finalkh11.repo.ChatMessageRepo;

@RestController
@RequestMapping("/rest")
public class ChatRestController {
	
	@Autowired
	private ChatMessageRepo chatMessageRepo;
	
	@GetMapping("/message/{roomName}")
	public List<ChatMessageDto> roomMessage(
			@PathVariable String roomName) {
		return chatMessageRepo.roomMessageList(roomName);
	}
	
}