package com.kh.finalkh11.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.finalkh11.dto.MatchBoardDto;
import com.kh.finalkh11.repo.MatchBoardRepo;

@Service
public class MatchBoardInterceptor implements HandlerInterceptor {
	
	@Autowired
	private MatchBoardRepo matchBoardRepo;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		
		//게시글 작성자 확인
		int matchBoardNo = Integer.parseInt(request.getParameter("matchBoardNo"));
		MatchBoardDto matchBoardDto = matchBoardRepo.selectOne(matchBoardNo);
		String writerId = matchBoardDto.getMemberId();
		
		//현재 로그인 회원 확인
		HttpSession session = request.getSession();
		
		//현재 로그인 회원의 등급 확인
		String memberId = (String)session.getAttribute("memberId");
		String memberLevel = (String)session.getAttribute("memberLevel");
		
		//작성자
		boolean isOwner = memberId.equals(writerId);
		
		//관리자
		boolean isAdmin = memberLevel.equals("관리자");
		
		if(isAdmin || isOwner) {
			if(request.getRequestURI().equals(request.getContextPath() + "/matchBoard/delete") || 
					request.getRequestURI().equals(request.getContextPath() + "/matchBoard/edit")) {
				return true;
			}
		}
		
		//조건에 해당하지 않는 경우는 모두 차단
		response.sendError(403);
		return false;
	}
}