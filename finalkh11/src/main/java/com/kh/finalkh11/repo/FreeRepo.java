package com.kh.finalkh11.repo;

import java.util.List;
import java.util.Map;

import com.kh.finalkh11.dto.FreeDto;
import com.kh.finalkh11.dto.FreeReplyDto;

public interface FreeRepo {
	int sequence();
	void insert(FreeDto dto);
	List<FreeDto> selectAll();
	FreeDto selectOne(int no);
	List<FreeDto> selectByFilter(Map<String, Object> param);
	//요청글 삭제 - 강사 추가
	void delete(int freeNo);
	
	//댓글 기능(강사 추가)
	List<FreeReplyDto> replyList(int freeReplyOrigin);
	FreeReplyDto replyFind(int freeReplyNo);
	void replyInsert(FreeReplyDto freeReplyDto);
	void replyDelete(int freeReplyNo);
	void replyEdit(FreeReplyDto freeReplyDto);
}
