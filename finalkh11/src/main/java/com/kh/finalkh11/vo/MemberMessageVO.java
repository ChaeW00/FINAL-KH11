package com.kh.finalkh11.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class MemberMessageVO {
	private String memberId, content, memberName;
	private long time;
}

