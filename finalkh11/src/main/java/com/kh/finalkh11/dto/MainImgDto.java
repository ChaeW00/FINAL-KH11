package com.kh.finalkh11.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MainImgDto {
	public int mainNo;
	public long imgSize;
	public String imgName,imgType,mainTitle;
}
