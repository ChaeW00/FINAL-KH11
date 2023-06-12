package com.kh.finalkh11.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReserveInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {		
		//현재 로그인 회원의 등급 확인
		HttpSession session = request.getSession();
		String memberLevel = (String)session.getAttribute("memberLevel");

		//관리자
		boolean isAdmin = memberLevel != null && memberLevel.equals("관리자");
		
		if(isAdmin) {
			if(request.getRequestURI().equals(request.getContextPath() + "/ground/delete/") || 
					request.getRequestURI().equals(request.getContextPath() + "/ground/insert") ||
					request.getRequestURI().equals(request.getContextPath() + "/ground/edit/")) {
				return true;
			}
		}
		
		//조건에 해당하지 않는 경우는 모두 차단
		response.sendError(403);
		return false;
	}
}