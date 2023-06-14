package com.kh.finalkh11.vo;

import com.kh.finalkh11.dto.GroundDto;
import com.kh.finalkh11.dto.TeamDto;

import lombok.Data;

@Data
public class SearchVO {
	private GroundDto groundDto;
	private TeamDto teamDto;
	private String type;
}