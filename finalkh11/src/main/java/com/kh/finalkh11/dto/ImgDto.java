package com.kh.finalkh11.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ImgDto {
	public int imgNo;
	private String imgUrl;
	public String imgName;
	public String imgType;
	public long imgSize;
}