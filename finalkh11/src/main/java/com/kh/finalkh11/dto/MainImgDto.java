package com.kh.finalkh11.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MainImgDto {
	private int mainNo, imgNo;
	private long imgSize;
	private String imgName,imgType,mainTitle;
}
