package com.kh.finalkh11.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.finalkh11.interceptor.MatchBoardInterceptor;
import com.kh.finalkh11.interceptor.MemberInterceptor;
import com.kh.finalkh11.interceptor.ReserveInterceptor;
import com.kh.finalkh11.interceptor.TeamInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
			
	@Autowired
	private MemberInterceptor memberInterceptor;
	
	@Autowired
	private ReserveInterceptor reserveInterceptor;
	
	@Autowired
	private MatchBoardInterceptor matchBoardInterceptor;
	
	@Autowired
	private TeamInterceptor teamInterceptor;
		
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
//		//1. MemberInterceptor
		registry.addInterceptor(memberInterceptor)
				.addPathPatterns(
						"/member/**",
						"/admin/**",
						"/ground/order",
						"/ground/edit/**",
						"/ground/delete/**",
						"/matchBoard/write",
						"/team_in/**",
						"/team/myTeam",
						"/team/insert",
						"/team/insertFinish",
						"/team_in/leaderMember"
						)
				.excludePathPatterns(
						"/member/join", 
						"/member/joinFinish",
						"/member/login",
						"/member/findId",
						"/member/findPw",
						"/member/exitFinish",
						"/ground/list",
						"/ground/detail",
						"/matchBoard/list",
						"/matchBoard/detail",
						"/team/detail/**"
						);
		
		//2. ReserveInterceptor
		registry.addInterceptor(reserveInterceptor)
				.addPathPatterns(
						"/ground/insert"
						)
				.excludePathPatterns(
						"/ground/list",
						"/ground/detail",
						"/ground/order"
						);
		
		//3. MatchBoardInterceptor
		registry.addInterceptor(matchBoardInterceptor)
				.addPathPatterns(
						"/matchBoard/edit/**",
						"/matchBoard/delete/**"
						);
		
		//3. TeamInterceptor
		registry.addInterceptor(teamInterceptor)
				.addPathPatterns(
						"/team/edit/**",
						"/team/delete/**"
						);
	}
}