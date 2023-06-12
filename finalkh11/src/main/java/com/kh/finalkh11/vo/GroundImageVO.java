package com.kh.finalkh11.vo;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.ImgDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class GroundImageVO {
	private ImgDto imgDto;
	private GroundDto groundDto;
}