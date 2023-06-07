package com.kh.finalkh11.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalkh11.configuration.CustomFileuploadProperties;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.ImgRepo;
import com.kh.finalkh11.repo.MemberRepo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

	@Autowired
	private MemberRepo memberRepo;
	
	@Autowired
	private ImgRepo imgRepo;
	
	@Autowired
	private CustomFileuploadProperties fileuploadProperties;
	
	private File dir;
	
	//최초 1번만 실행되는 메소드
		@PostConstruct
		public void init() {
			dir = new File(fileuploadProperties.getPath());
			dir.mkdirs();
		}
		
		//프로필 이미지 등록
		public void join(
				MemberDto memberDto, 
				MultipartFile file
			 ) throws IllegalStateException, IOException {

			 if(!file.isEmpty()) {
				 int attachmentNo = imgRepo.sequence();

				 File target = new File(dir, String.valueOf(attachmentNo));
				 file.transferTo(target);
				 
				 imgRepo.insert(ImgDto.builder()
						 	.imgNo(attachmentNo)
						 	.imgName(file.getOriginalFilename())
						 	.imgType(file.getContentType())
						 	.imgSize(file.getSize())
						 .build());

				 //연결정보 등록
				 memberDto.setImgNo(attachmentNo);
				 memberRepo.insert(memberDto);
				 
//				 memberRepo.insert(MemberDto.builder()
//						 	.imgNo(attachmentNo)
//						 .build());
			 }
			 else {
				 //연결정보 등록
				 memberDto.setImgNo(0); //이미지가 없으면 0이 등록, 0이면 더미데이터 보여주기
				 memberRepo.insert(memberDto);
			 }
		}	
		
		//프로필 이미지 수정
		public void update(
				MemberDto memberDto, 
				MultipartFile file
			) throws IllegalStateException, IOException {
		    
			memberRepo.update(memberDto);

		    if (!file.isEmpty()) {
		        int attachmentNo = imgRepo.sequence();

		        File target = new File(dir, String.valueOf(attachmentNo));
		        file.transferTo(target);

		        imgRepo.insert(ImgDto.builder()
		                .imgNo(attachmentNo)
		                .imgName(file.getOriginalFilename())
		                .imgType(file.getContentType())
		                .imgSize(file.getSize())
		                .build());

		        MemberDto memberProfileDto = MemberDto.builder()
		                .memberId(memberDto.getMemberId())
		                .imgNo(attachmentNo)
		                .build();

		        MemberDto existingProfile = memberRepo.selectOne(memberDto.getMemberId());

		        if (existingProfile == null) {
		        	memberRepo.insert(memberProfileDto);
		        } 
		        else {
		        	memberRepo.update(memberProfileDto);
		        }
		    }
		}
		// 회원 ID에 해당하는 회원 이름 조회
		public String getMemberNameById(String memberId) {
			MemberDto memberDto = memberRepo.selectOne(memberId);
			if (memberDto != null) {
				return memberDto.getMemberName();
			}
			return null;
		}
		
	}