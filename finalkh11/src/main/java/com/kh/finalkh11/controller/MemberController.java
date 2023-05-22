package com.kh.finalkh11.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.MemberRepo;
import com.kh.finalkh11.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
		@Autowired
		private MemberRepo memberRepo;
		
		@Autowired
		private ImgRepo imgRepo;
		
		@Autowired
		private MemberService memberService;
	
		//로그인
		@GetMapping("/login")
		public String login() {
			return "member/login";
		}
		
		@PostMapping("/login")
		public String login(HttpSession session,@ModelAttribute MemberDto userDto,
				RedirectAttributes attr) {
			//userDto = 사용자가 입력한 dto, findDto = 찾은 dto
			//로그인 검사 : 아이디 찾고, 비밀번호 일치 비교
			MemberDto findDto = memberRepo.selectOne(userDto.getMemberId());
			
			//존재하지 않는 아이디라면 -> redirect(get방식이여서 login페이지로 이동가능)
			if(findDto == null) {
				attr.addAttribute("mode","error");
				return "redirect:login";
			}
			
			//비밀번호가 일치않지 않는다면 ->오류
			if(!userDto.getMemberPw().equals(findDto.getMemberPw())) {
				attr.addAttribute("mode","error");
				return "redirect:login";
			}
			
			//로그인에 성공한 경우 session에 추가
			session.setAttribute("memberId", findDto.getMemberId());
			session.setAttribute("memberLevel", findDto.getMemberLevel());
			
			return "redirect:/";//메인페이지로 이동
		}
////////////////////////////////////////////////////////////////////////////////////////////		
		
		//회원가입
		@GetMapping("/join")
		public String join() {
			return "member/join";
		}
		
		@PostMapping("/join")
		public String join(@ModelAttribute MemberDto memberDto,
				@RequestParam MultipartFile file) throws IllegalStateException, IOException {
			memberService.join(memberDto, file);
			return "redirect:joinFinish";
		}
		
		@GetMapping("/joinFinish")
		public String joinFinish() {
			return "member/joinFinish";
		}
		
////////////////////////////////////////////////////////////////////////////////////////////
		
		@GetMapping("/jointerm")//약관페이지
		public String jointerm() {
			return "member/jointerm";
		}
		
		@GetMapping("/joinprivacy")//개인정보페이지
		public String joinprivacy() {
			return "member/joinprivacy";
		}
		
////////////////////////////////////////////////////////////////////////////////////////////		
		
		@GetMapping("/logout") //로그아웃
		public String logout(HttpSession session) {
			session.removeAttribute("memberId");
			session.removeAttribute("memberLevel");
			return "redirect:/";
		}
		
////////////////////////////////////////////////////////////////////////////////////////////
		
		@GetMapping("/mypage") //회원 마이페이지
		public String mypage(HttpSession session,Model model ) {
			
			String memberId = (String) session.getAttribute("memberId");
			MemberDto dto = memberRepo.selectOne(memberId);
			model.addAttribute("dto", dto);
			
			int imgNo = (int) dto.getImgNo();
			ImgDto imgDto = imgRepo.selectOne(imgNo);
			
			model.addAttribute("imgDto", imgDto);
			
			return "member/mypage";
		}
		
////////////////////////////////////////////////////////////////////////////////////////////
		
		 //회원 탈퇴
		 @GetMapping("/exit")
		 public String exit(HttpSession session) {
			 return "member/exit";
		 }
		
		 @PostMapping("/exit")
		 public String exit(
				 	HttpSession session, //회원정보가 저장되어 있는 세션 객체
				 	@RequestParam String memberPw,//사용자가 입력한 비밀번호
				 	RedirectAttributes attr//리다이렉트 시 정보를 추가하기 위한 객체
				 ) {
			 String memberId = (String)session.getAttribute("memberId");
			 MemberDto memberDto = memberRepo.selectOne(memberId);
			 
			 //비밀번호가 일치하지 않는다면 → 비밀번호 입력 페이지로 되돌린다
			 if(!memberDto.getMemberPw().equals(memberPw)) {
				 attr.addAttribute("mode", "error");
				 return "redirect:exit";
			 }
			 
			 //비밀번호가 일치한다면 → 회원탈퇴 + 로그아웃
			 memberRepo.delete(memberId);
			 
			 session.removeAttribute("memberId"); //session은 브라우저 전용 데이터저장박스
			 session.removeAttribute("memberLevel");
			 
			 return "redirect:exitFinish";
		 }
		 
		 @GetMapping("/exitFinish")
		 public String exitFinish() {
			 return "member/exitFinish";
		 }
		 
////////////////////////////////////////////////////////////////////////////////////////////		 
		
		 @GetMapping("/change")//회원정보 수정
		 public String change(HttpSession session, Model model) {
			 String memberId = (String) session.getAttribute("memberId");
			 MemberDto findDto = memberRepo.selectOne(memberId);
			 int imgNo = (int) findDto.getImgNo();
			 model.addAttribute("img",imgRepo.selectOne(imgNo));
			 
			 model.addAttribute("memberDto",findDto);
			 return "member/change";
		 }
		 
		@PostMapping("/change")//회원정보 수정
		public String mypageChange(
				@ModelAttribute MemberDto memberDto,
				 @RequestParam MultipartFile attach,
				 HttpSession session) throws IllegalStateException, IOException {
			String memberId = (String) session.getAttribute("memberId");
			MemberDto findDto = memberRepo.selectOne(memberId);
			
			memberDto.setMemberId(memberId);
			memberService.update(memberDto,attach);

			
			return "redirect:changeFinish";
		}
		
		@GetMapping("/changeFinish")
		public String changeFinish() {
			return "member/changeFinish";
		}
		
////////////////////////////////////////////////////////////////////////////////////////////		
		
		
		
		@GetMapping("/findId")//아이디 찾기
		public String findId() {
			return "member/findId";
		}
		
		@GetMapping("/findPw")//비밀번호 찾기
		public String findPw() {
			return "member/findPw";
		}
}
