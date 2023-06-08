package com.kh.finalkh11.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;


@Data 
@JsonIgnoreProperties
public class ChannelReceiveVO {
	private int type;
	private String content;
	private int room;
}

