package com.kh.finalkh11.vo;

import lombok.Data;

@Data
public class MemberMessageVO {
	private String memberId, content;
	private long time;
}
