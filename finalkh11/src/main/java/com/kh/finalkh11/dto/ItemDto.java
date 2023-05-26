package com.kh.finalkh11.dto;

import lombok.Data;

@Data
public class ItemDto {
	private int itemNo;
	private String itemName;
	private int itemPrice, itemDiscount;
}