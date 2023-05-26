package com.kh.finalkh11.controller;

import java.net.URISyntaxException;
import java.sql.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.ReserveDto;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.ReserveRepo;
import com.kh.finalkh11.service.KakaoPayService;
import com.kh.finalkh11.vo.KakaoPayApproveRequestVO;
import com.kh.finalkh11.vo.KakaoPayApproveResponseVO;
import com.kh.finalkh11.vo.KakaoPayReadyRequestVO;
import com.kh.finalkh11.vo.KakaoPayReadyResponseVO;

@Controller
@RequestMapping("/ground")
public class ReserveController {

	@Autowired
	private GroundRepo groundRepo;
	
	@Autowired
	private ReserveRepo reserveRepo;
   	
   	@Autowired
	private KakaoPayService kakaoPayService;

   //결제 상세
   @PostMapping("/order")
   public String order(@ModelAttribute ReserveDto reserveDto,
		   @RequestParam int groundNo,
		   @RequestParam Date reserveDate,
		   @RequestParam int scheduleNo,
		   HttpSession session,
		   RedirectAttributes attr) {
	   int reserveNo = reserveRepo.sequence();
	   
	   reserveDto.setReserveNo(reserveNo);
	   reserveDto.setMemberId((String)session.getAttribute("memberId"));
	   
	   String status = reserveRepo.completed(reserveDate, scheduleNo);
	   if(status != null && status.equals("예약완료")) {
		   throw new RuntimeException("다른 사람이 예약함.");
	   }
	   
	   reserveRepo.insert(reserveDto);

	   attr.addAttribute("reserveNo", reserveNo);
	   attr.addAttribute("groundNo", groundNo);
	   
	   return "redirect:payment";
   }
   
   //카카오 페이 결제
   @GetMapping("/payment")
   public String paymentRequest(@RequestParam int reserveNo,
		   	@RequestParam int groundNo,
		   	Model model) {
       model.addAttribute("reserveDto", reserveRepo.detail(reserveNo));
       model.addAttribute("groundDto", groundRepo.detail(groundNo));
       model.addAttribute("scheduleDto", reserveRepo.timeCheck(reserveNo));
	   
       return "reserve/payment";
   }
   
   //카카오 페이 결제
   @PostMapping("/payment")
   public String paymentRequest(
		   @ModelAttribute KakaoPayReadyRequestVO vo,
		   HttpSession session,
		   Model model) throws URISyntaxException {
	   
	   vo.setPartner_order_id(UUID.randomUUID().toString());
	   vo.setPartner_user_id((String)session.getAttribute("memberId"));
	   
	   KakaoPayReadyResponseVO response = kakaoPayService.ready(vo);
	   
	   //세션 정보 추가
	   session.setAttribute("partner_order_id", vo.getPartner_order_id());
	   session.setAttribute("partner_user_id", vo.getPartner_user_id());
	   session.setAttribute("tid", response.getTid());
	   
	   return "redirect:" + response.getNext_redirect_pc_url();
   }
   	
	//결제 성공
	@GetMapping("/payment/success")
	public String paymentSuccess(
			@ModelAttribute KakaoPayApproveRequestVO vo,
			HttpSession session) throws URISyntaxException {

		vo.setPartner_order_id((String)session.getAttribute("partner_order_id"));
		vo.setPartner_user_id((String)session.getAttribute("partner_user_id"));
		vo.setTid((String)session.getAttribute("tid"));
		
		//세션 정보 삭제
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
		
		KakaoPayApproveResponseVO response = kakaoPayService.approve(vo);
		
		return "redirect:clear";
	}
	
	//결제 성공 페이지
	@GetMapping("/payment/clear")
	public String success() {
		
		return "reserve/success";
	}
}