package com.kh.finalkh11.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalkh11.configuration.CustomFileuploadProperties;
import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.GroundImageDto;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.repo.GroundRepo;
import com.kh.finalkh11.repo.ImgRepo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GroundService {

	@Autowired
	private GroundRepo groundRepo;
	
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
		public void insert(
				GroundImageDto groundImageDto,
//				GroundDto groundDto,
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
				 groundImageDto.setImgNo(attachmentNo);
//				 groundRepo.insert(groundDto);
			 }
			 else {
				 //연결정보 등록
				 groundImageDto.setImgNo(0); //이미지가 없으면 0이 등록, 0이면 더미데이터 보여주기
//				 groundRepo.insert(groundDto);
			 }
		}	
		
		//프로필 이미지 수정
//		public void update(
//				GroundDto groundDto, 
//				MultipartFile file
//			) throws IllegalStateException, IOException {
//		    
//			groundRepo.edit(groundDto);
//
//		    if (!file.isEmpty()) {
//		        int attachmentNo = imgRepo.sequence();
//
//		        File target = new File(dir, String.valueOf(attachmentNo));
//		        file.transferTo(target);
//
//		        imgRepo.insert(ImgDto.builder()
//		                .imgNo(attachmentNo)
//		                .imgName(file.getOriginalFilename())
//		                .imgType(file.getContentType())
//		                .imgSize(file.getSize())
//		                .build());
//
//		        MemberDto memberProfileDto = MemberDto.builder()
//		                .memberId(memberDto.getMemberId())
//		                .imgNo(attachmentNo)
//		                .build();
//
//		        MemberDto existingProfile = memberRepo.selectOne(memberDto.getMemberId());
//
//		        if (existingProfile == null) {
//		        	memberRepo.insert(memberProfileDto);
//		        } 
//		        else {
//		        	memberRepo.update(memberProfileDto);
//		        }
//		    }
//		}
		
	}