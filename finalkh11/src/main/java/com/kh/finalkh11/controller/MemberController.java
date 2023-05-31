package com.kh.finalkh11.controller;

import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.component.RandomComponent;
import com.kh.finalkh11.constant.SessionConstant;
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
		
		@Autowired //메일
		private RandomComponent randomComponent;
		
		@Autowired //메일
		private JavaMailSender sender;
		
		@Autowired
		private PasswordEncoder encoder;
	
		//로그인
		@GetMapping("/login")
		public String login() {
			return "member/login";
		}
		
		@PostMapping("/login")
		public String login(HttpSession session,@ModelAttribute MemberDto userDto,@RequestParam String memberId,
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
//			if(!userDto.getMemberPw().equals(findDto.getMemberPw())) {
//				attr.addAttribute("mode","error");
//				return "redirect:login";
//			}
			
			if(!encoder.matches(userDto.getMemberPw(), findDto.getMemberPw())) { //암호화된 로그인
				attr.addAttribute("mode","error");
				return "redirect:login";
			}
			
			//로그인에 성공한 경우 session에 추가
			session.setAttribute(SessionConstant.memberId, findDto.getMemberId());
			session.setAttribute(SessionConstant.memberLevel, findDto.getMemberLevel());
			
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
			session.removeAttribute(SessionConstant.memberId);
			session.removeAttribute(SessionConstant.memberLevel);
			return "redirect:/";
		}
		
////////////////////////////////////////////////////////////////////////////////////////////
		
		@GetMapping("/mypage") //회원 마이페이지
		public String mypage(HttpSession session,Model model ) {
			
			String memberId = (String) session.getAttribute(SessionConstant.memberId);
			if(memberId == null) {
				return "redirect:/login";
			}
			MemberDto dto = memberRepo.selectOne(memberId);
			model.addAttribute("dto", dto);
			
			int imgNo = (int) dto.getImgNo();
			if(imgNo != 0) {
				
			}
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
			 String memberId = (String) session.getAttribute(SessionConstant.memberId);
			 MemberDto memberDto = memberRepo.selectOne(memberId);
			 
			 //비밀번호가 일치하지 않는다면 → 비밀번호 입력 페이지로 되돌린다
			 if(!memberDto.getMemberPw().equals(memberPw)) {
				 attr.addAttribute("mode", "error");
				 return "redirect:exit";
			 }
			 
			 //비밀번호가 일치한다면 → 회원탈퇴 + 로그아웃
			 memberRepo.delete(memberId);
			 
			 session.removeAttribute(SessionConstant.memberId); //session은 브라우저 전용 데이터저장박스
			 session.removeAttribute(SessionConstant.memberLevel);
			 
			 return "redirect:exitFinish";
		 }
		 
		 @GetMapping("/exitFinish")
		 public String exitFinish() {
			 return "member/exitFinish";
		 }
		 
////////////////////////////////////////////////////////////////////////////////////////////		 
		
		 @GetMapping("/change")//회원정보 수정
		 public String change(HttpSession session, Model model) {
			 String memberId = (String) session.getAttribute(SessionConstant.memberId);
			 MemberDto findDto = memberRepo.selectOne(memberId);
			 int imgNo = (int) findDto.getImgNo();
			 model.addAttribute("img",imgRepo.selectOne(imgNo));
			 
			 model.addAttribute("memberDto",findDto);
			 return "member/change";
			 
		 }
		 
		@PostMapping("/change")//회원정보 수정
		public String mypageChange(
				@ModelAttribute MemberDto memberDto,
				 @RequestParam MultipartFile file,
				 HttpSession session) throws IllegalStateException, IOException {
			String memberId = (String) session.getAttribute(SessionConstant.memberId);
			
			memberDto.setMemberId(memberId);
			memberService.update(memberDto, file);
			
			return "redirect:mypage";
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
		
		@PostMapping("/findId")
		public String findId(@ModelAttribute MemberDto memberDto, Model model, RedirectAttributes attr) {
		    try {
		        String memberId = memberRepo.findId(memberDto);

		        if (memberId == null) {
		            throw new NullPointerException("findId is null");
		        }

		        model.addAttribute("findId", memberId);
		        model.addAttribute("mode", "result"); // 결과를 표시하기 위한 모드 설정

		        return "member/findId";
		    } catch (Exception e) {
		        model.addAttribute("mode", "error"); // 에러를 표시하기 위한 모드 설정
		        return "member/findId";
		    }
		}

		


////////////////////////////////////////////////////////////////////////////////////////////
		
		@GetMapping("/findPw")//비밀번호 찾기
		public String findPw() {
			return "member/findPw";
		}

		@PostMapping("/findPw")
		public String findPw(@ModelAttribute MemberDto memberDto,
				RedirectAttributes attr,
				@RequestParam String memberId,
				@RequestParam String memberEmail) {
			
			try {
				MemberDto userDto = memberRepo.selectOne(memberId);
				
				if (userDto == null || !userDto.getMemberEmail().equals(memberEmail)) {
		               throw new IllegalArgumentException("일치하는 정보가 없습니다.");
		           }
				 String userEmail = userDto.getMemberEmail();
		         String userId = userDto.getMemberId();
		         
		         String temporaryPw = randomComponent.generateString(10);
				
		         if(memberId.equals(userId) && memberEmail.equals(userEmail)) {
		        	 
		        	 	//[1] 메세지 생성 - sender에게 생성하도록 지시
		        	 	MimeMessage message = sender.createMimeMessage();
		        	 	//[2] 메세지 헬퍼 생성 - 각종 처리를 쉽게 할 수 있도록 도와주는 역할
		        	    MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		        	    
		        	    //[3] 헬퍼에 정보 설정
		        	    helper.setTo(memberEmail);
		        	    helper.setSubject("[MATCH-UP] 임시 비밀번호 발급");

		        	    // HTML 내용 작성
		        	    String htmlContent = "<p>발급된 임시 비밀번호는 <strong>" + temporaryPw + "</strong>입니다. 로그인 후 비밀번호를 반드시 변경해주시길 바랍니다.</p>";
		        	    htmlContent += "<p>비밀번호를 변경하려면 <a href=\"http://localhost:8080/member/password\">여기</a>를 클릭해주세요.</p>";

		        	    helper.setText(htmlContent, true);
		        	    
		        	    //[4] 전송
		        	    sender.send(message);

		        	    // 비밀번호 변경
		        	    memberRepo.changePw(memberId, temporaryPw);
		        	 
		            
		          }
		       }
				
			catch(Exception e) {
	             attr.addAttribute("mode", "error");
	             return "redirect:findPw";
	          }
	         return "member/findResult";
	   }

		

////////////////////////////////////////////////////////////////////////////////////////////		
		
		@GetMapping("/password") //비밀번호 변경
		public String password() {
			return "member/password";
		}
		
		@PostMapping("/password")
		public String password(@RequestParam String currentPw,
				@RequestParam String newPw,
				RedirectAttributes attr, HttpSession session) {
			String memberId = (String) session.getAttribute(SessionConstant.memberId);
			MemberDto dto = memberRepo.selectOne(memberId);
			
			if(!dto.getMemberPw().equals(currentPw)) {
				attr.addAttribute("mode","error");
				return "redirect:password";
			}
			memberRepo.changePw(memberId, newPw);
			return "redirect:passwordFinish";
		}
		
		@GetMapping("/passwordFinish")
		public String passwordFinish() {
			return "member/passwordFinish";
		}
}





