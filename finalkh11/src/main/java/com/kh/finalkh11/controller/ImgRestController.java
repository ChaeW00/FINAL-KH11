package com.kh.finalkh11.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalkh11.configuration.CustomFileuploadProperties;
import com.kh.finalkh11.dto.ImgDto;
import com.kh.finalkh11.repo.ImgRepo;

@RestController
@CrossOrigin
@RequestMapping("/img")
public class ImgRestController {

	//준비물
		@Autowired
		private ImgRepo imgRepo;
		
		@Autowired
		private CustomFileuploadProperties fileUploadProperties;
		
		private File dir;
		
		@PostConstruct
		public void init() {
			dir = new File(fileUploadProperties.getPath());
			dir.mkdirs();
		}
		
		//업로드
		@PostMapping("/upload")
		public ImgDto upload(@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
			if(!attach.isEmpty()) {//파일이 있을 경우
				//번호 생성
				int attachmentNo = imgRepo.sequence();
				
				//파일 저장(저장 위치는 임시로 생성)
				File target = new File(dir, String.valueOf(attachmentNo));//파일명=시퀀스
				attach.transferTo(target);
				
				//DB 저장
				imgRepo.insert(ImgDto.builder()
								.imgNo(attachmentNo)
								.imgName(attach.getOriginalFilename())
								.imgType(attach.getContentType())
								.imgSize(attach.getSize())
							.build());
				
				return imgRepo.selectOne(attachmentNo);//DTO를 반환
			}
			
			return null;//또는 예외 발생
		}
		
		//다운로드 (이미지 미리보기를 하고싶으면 작성해야하는 코드)
		@GetMapping("/download/{imgNo}")
		public ResponseEntity<ByteArrayResource> download(
										@PathVariable int imgNo) throws IOException {
			//DB 조회
			ImgDto imgDto = imgRepo.selectOne(imgNo);
			if(imgDto == null) {//없으면 404
				return ResponseEntity.notFound().build();
			}
			
			//파일 찾기
			File target = new File(dir, String.valueOf(imgNo));
			
			//보낼 데이터 생성
			byte[] data = FileUtils.readFileToByteArray(target);
			ByteArrayResource resource = new ByteArrayResource(data);
			
//			제공되는 모든 상수와 명령을 동원해서 최대한 오류 없이 편하게 작성
			return ResponseEntity.ok()
						.contentType(MediaType.APPLICATION_OCTET_STREAM)
						.contentLength(imgDto.getImgSize())
						.header(HttpHeaders.CONTENT_ENCODING, 
													StandardCharsets.UTF_8.name())
						.header(HttpHeaders.CONTENT_DISPOSITION,
							ContentDisposition.attachment()
										.filename(
												imgDto.getImgName(), 
												StandardCharsets.UTF_8
										).build().toString()
						)
						.body(resource);
		}
		
		@DeleteMapping("/delete/{imgNo}")
		public boolean delete(@PathVariable int imgNo) {
			return imgRepo.delete(imgNo);
		}
		
}
