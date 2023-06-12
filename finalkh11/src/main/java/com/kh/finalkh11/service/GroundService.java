package com.kh.finalkh11.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalkh11.configuration.CustomFileuploadProperties;
import com.kh.finalkh11.dto.GroundImageDto;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.repo.GroundImageRepo;
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
	private GroundImageRepo groundImageRepo;
	
	@Autowired
	private CustomFileuploadProperties fileuploadProperties;
	
	private File dir;
	
		//최초 1번만 실행되는 메소드
		@PostConstruct
		public void init() {
			dir = new File(fileuploadProperties.getPath());
			dir.mkdirs();
		}
		
		//이미지 등록
		public void insert(
				@ModelAttribute GroundImageDto groundImageDto,
				@PathVariable("groundNo") int groundNo,
				@RequestPart List<MultipartFile> files
			 ) throws IllegalStateException, IOException {

			for (MultipartFile file : files) {
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

		            imgRepo.groundImageInsert(GroundImageDto.builder()
		                    .imgNo(attachmentNo)
		                    .groundNo(groundNo)
		                    .build());
		        }
		        else {
		        	//연결정보 등록
		        	groundImageDto.setImgNo(0); //이미지가 없으면 0이 등록, 0이면 더미데이터 보여주기
		        }
		    }
		}
		
		//이미지 수정
//		public void update(
//				@ModelAttribute GroundImageDto groundImageDto,
//				@RequestPart List<MultipartFile> files
//			) throws IllegalStateException, IOException {
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