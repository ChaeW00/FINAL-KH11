package com.kh.finalkh11.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.MemberRepo;


@Controller
@RequestMapping("/member")
public class MemberController {
	
		@Autowired
		private MemberRepo memberRepo;
		
		@Autowired
		private ImgRepo imgRepo;
	
		//로그인
		@GetMapping("/login")
		public String login() {
			return "member/login";
		}
		
		@PostMapping("/login")
		public String login(HttpSession session,@ModelAttribute MemberDto userDto) {
			//userDto = 사용자가 입력한 dto, findDto = 찾은 dto
			//로그인 검사 : 아이디 찾고, 비밀번호 일치 비교
			MemberDto findDto = memberRepo.selectOne(userDto.getMemberId());
			
			//존재하지 않는 아이디라면 -> redirect(get방식이여서 login페이지로 이동가능)
			if(findDto == null) {
				return "redirect:login";
			}
			
			//비밀번호가 일치않지 않는다면 ->오류
			if(!userDto.getMemberPw().equals(findDto.getMemberPw())) {
				return "redirect:login";
			}
			
			//로그인에 성공한 경우 session에 추가
			session.setAttribute("memberId", findDto.getMemberId());
			session.setAttribute("memberLevel", findDto.getMemberLevel());
			
			return "redirect:/";//메인페이지로 이동
		}
		
		
		//회원가입
		@GetMapping("/join")
		public String join() {
			return "member/join";
		}
		
		@PostMapping("/join")
		public String join(@ModelAttribute MemberDto memberDto) throws IllegalStateException, IOException {
			//memberDto 등록
			memberRepo.insert(memberDto);
			
//			if(!multipartFile.isEmpty()) {
//				//2.첨부파일 저장 및 등록(첨부파일이 있으면)
//				int attachmentNo = imgRepo.sequence();
//				
//				File dir = new File("D:/upload");
//				dir.mkdirs();
//				
//				File target = new File(dir, String.valueOf(attachmentNo));
//				multipartFile.transferTo(target);//저장
//				
//				imgRepo.insert(imgDto);
//				
//				//3.memberDto랑 첨부파일 정보를 연결(첨부파일이 있으면)
//				memberRepo.insert(memberDto);
//			}
			
			return "redirect:joinFinish";
		}
		
		@GetMapping("/joinFinish")
		public String joinFinish() {
			return "member/joinFinish";
		}

		
		@GetMapping("/jointerm")//약관페이지
		public String jointerm() {
			return "member/jointerm";
		}
		
		@GetMapping("/joinprivacy")//개인정보페이지
		public String joinprivacy() {
			return "member/joinprivacy";
		}
		
}
