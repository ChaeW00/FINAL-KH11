package com.kh.finalkh11.controller;

import java.io.File;
import java.io.IOException;
	

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.CrossOrigin;

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
@RequestMapping("/rest/img")
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
		
//		//다운로드
//		@GetMapping("/download/{attachmentNo}")
//		public ResponseEntity<ByteArrayResource> download(
//										@PathVariable int attachmentNo) throws IOException {
//			//DB 조회
//			AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
//			if(attachmentDto == null) {//없으면 404
//				return ResponseEntity.notFound().build();
//			}
//			
//			//파일 찾기
//			File target = new File(dir, String.valueOf(attachmentNo));
//			
//			//보낼 데이터 생성
//			byte[] data = FileUtils.readFileToByteArray(target);
//			ByteArrayResource resource = new ByteArrayResource(data);
//			
////			제공되는 모든 상수와 명령을 동원해서 최대한 오류 없이 편하게 작성
//			return ResponseEntity.ok()
////						.header(HttpHeaders.CONTENT_TYPE, 
////								MediaType.APPLICATION_OCTET_STREAM_VALUE)
//						.contentType(MediaType.APPLICATION_OCTET_STREAM)
//						.contentLength(attachmentDto.getAttachmentSize())
//						.header(HttpHeaders.CONTENT_ENCODING, 
//													StandardCharsets.UTF_8.name())
//						.header(HttpHeaders.CONTENT_DISPOSITION,
//							ContentDisposition.attachment()
//										.filename(
//												attachmentDto.getAttachmentName(), 
//												StandardCharsets.UTF_8
//										).build().toString()
//						)
//						.body(resource);
//		}
}
