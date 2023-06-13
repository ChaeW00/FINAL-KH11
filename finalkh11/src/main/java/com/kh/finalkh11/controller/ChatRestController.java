package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.dto.ChatMessageDto;
import com.kh.finalkh11.dto.ChatVisitDto;
import com.kh.finalkh11.repo.ChatMessageRepo;
import com.kh.finalkh11.repo.ChatVisitRepo;
import com.kh.finalkh11.repo.EntryRepo;
import com.kh.finalkh11.repo.RoomListRepo;
import com.kh.finalkh11.vo.EntryVO;
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
	
	@Autowired
	private ChatVisitRepo chatVisitRepo;
	
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
	public List<EntryVO> selectEntry(@PathVariable int matchNo){
		return entryRepo.selectByMatchNoWithVO(matchNo);
	}
	
	
	@GetMapping("/chatvisit/{memberId}/{roomNo}")
	public int selectVisit(@PathVariable int roomNo, @PathVariable String memberId) {
		return chatVisitRepo.selectVisit(memberId, roomNo);
	}
	
	@PostMapping("/chatvisit")
	public void insertVisit(@RequestBody ChatVisitDto dto) {
		chatVisitRepo.insertVisit(dto);
	}
}