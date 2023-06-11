package com.kh.finalkh11.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.finalkh11.dto.MatchDto;
import com.kh.finalkh11.repo.MatchBoardRepo;
import com.kh.finalkh11.repo.MatchRepo;


@Service
public class SchedulerServiceImpl implements SchedulerService{

	@Autowired
	private MatchRepo matchRepo;
	
	@Autowired
	private MatchBoardRepo matchBoardRepo;
	
	@Override
	@Scheduled(cron = "0 0 * * * *")
	public void updateStatus() {
		LocalDateTime now = LocalDateTime.now();
		SimpleDateFormat fmt=new SimpleDateFormat("yyyy/MM/dd"); 
		List<MatchDto> matches = matchRepo.selectList();
		
		for(MatchDto match : matches) {
			if(!match.getMatchStatus().equals("모집마감")) continue;
			Date matchDate = match.getMatchDate();
			String dateString = fmt.format(matchDate);
			String timeString = match.getMatchTime();
			LocalDateTime matchDateTime = LocalDateTime.parse(dateString + " " + timeString, DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
            if (matchDateTime.isBefore(now) || (matchDateTime.getDayOfYear() == now.getDayOfYear() && matchDateTime.getHour() == now.getHour() - 2 && matchDateTime.getMinute() <= now.getMinute())) {
            	matchRepo.statusEnd(match.getMatchNo());
            	int boardNo = match.getMatchBoardNo();
            	matchBoardRepo.statusEnd(boardNo);
            }
		}
		
	}

}
