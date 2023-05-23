package com.kh.finalkh11.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.ChatMessageDto;
import com.kh.finalkh11.dto.EntryDto;
import com.kh.finalkh11.repo.ChatMessageRepo;
import com.kh.finalkh11.repo.EntryRepo;
import com.kh.finalkh11.repo.RoomListRepo;
import com.kh.finalkh11.vo.RoomListVO;

@RestController
@RequestMapping("/rest")
public class ChatRestController {
	@Autowired
	private ChatMessageRepo messageRepo;
	
	@Autowired
	private EntryRepo entryRepo;
	
	@Autowired
	private RoomListRepo roomListRepo;
	
//	@GetMapping("/roomlist/{memberId}")
//	public List<EntryDto> roomList(@PathVariable String memberId){
//		return entryRepo.selectList(memberId);
//	}
	
	@GetMapping("/roomlist/{memberId}")
	public List<RoomListVO> roomList(@PathVariable String memberId){
		return roomListRepo.selectRoomList(memberId);
	}
	
	@GetMapping("/message/{roomNo}")
	public List<ChatMessageDto> roomMessage(
			@PathVariable int roomNo){
		return messageRepo.roomMessageList(roomNo);
	} 
	
	@GetMapping("/entry/{matchNo}")
	public List<EntryDto> entryList(@PathVariable int matchNo){
		return entryRepo.selectListMatch(matchNo);
	}
}
