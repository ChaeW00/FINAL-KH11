package com.kh.finalkh11.repo;

import java.sql.Date;
import java.util.List;

import com.kh.finalkh11.dto.ReserveDto;
import com.kh.finalkh11.dto.ScheduleDto;

public interface ReserveRepo {
	ReserveDto detail(int reserveNo);
	void process(int resereveNo);
	void clear(int reserveNo);
	void insert(ReserveDto reserveDto);
	int sequence();
	ScheduleDto timeCheck(int reserveNo);
	String completed(Date reserveDate, int scheduleNo);
	void cancel(int paymentNo);
	List<ReserveDto> prevent(int reserveNo);//중복 결제 방지
	void remove(int reserveNo);
}