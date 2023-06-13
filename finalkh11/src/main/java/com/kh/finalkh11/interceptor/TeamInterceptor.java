package com.kh.finalkh11.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.repo.TeamRepo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TeamInterceptor implements HandlerInterceptor {
	
	@Autowired
	private TeamRepo teamRepo;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		
		//팀 리더 여부 확인
		int teamNo = Integer.parseInt(request.getParameter("teamNo"));
		TeamDto teamDto = teamRepo.selectOne(teamNo);
		String leader = teamDto.getTeamLeader();
		
		//현재 로그인 회원 확인
		HttpSession session = request.getSession();
		
		//현재 로그인 회원의 등급 확인
		String memberId = (String)session.getAttribute("memberId");
		String memberLevel = (String)session.getAttribute("memberLevel");
		
		//팀 리더
		boolean isOwner = memberId.equals(leader);
		
		//관리자
		boolean isAdmin = memberLevel.equals("관리자");
		
		if(isAdmin || isOwner) {
			if(request.getRequestURI().equals(request.getContextPath() + "/team/delete") || 
					request.getRequestURI().equals(request.getContextPath() + "/team/edit")) {
				return true;
			}
		}
		
		//조건에 해당하지 않는 경우는 모두 차단
		response.sendError(403);
		return false;
	}
}