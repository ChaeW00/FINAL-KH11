package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.ItemDto;

public interface ItemRepo {
	List<ItemDto> list();
	ItemDto detail(int itemNo);
}