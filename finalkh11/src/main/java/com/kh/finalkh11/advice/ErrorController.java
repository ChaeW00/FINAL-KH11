package com.kh.finalkh11.advice;

import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorController {
	
	//404 예외만 따로 처리할 수 있도록 추가 메소드를 구성
	@ExceptionHandler(NoHandlerFoundException.class)
	public String notFound(Exception ex) {
		return "redirect:error";
	}
	
	//403 - 권한이 없음
	@ExceptionHandler(RequirePermissionException.class)
	public String forbidden(Exception ex) {
		return "redirect:error";
	}
	
	//401 - 자격이 없음(로그인 안함)
	//- 사용자가 봐야 하는 페이지는 로그인 페이지이다
	@ExceptionHandler(RequireLoginException.class)
	public String unAuthorized(Exception ex) {
		return "member/login"; //주소는 유지하고 화면만 변경
//		return "redirect:/member/login"; //재접속을 지시
	}
	
	@ExceptionHandler(MissingServletRequestParameterException.class)
	public String badParameter(Exception ex) {
		ex.printStackTrace();
		return "redirect:error";
	}

	@ExceptionHandler(Exception.class)
	public String notParameter(Exception ex) {
		ex.printStackTrace();
		return "redirect:/error";
	}
}