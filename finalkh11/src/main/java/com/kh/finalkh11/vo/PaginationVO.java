package com.kh.finalkh11.vo;

import lombok.Data;

@Data
public class PaginationVO {

	private String column = "boardTitle";
	private String keyword = "";
	private int page = 1;
	private int size = 10;
	private int count;
	private int blockSize = 10;
	
	public boolean isSearch() {
		return keyword.equals("") == false;
	}
	public boolean isList() {
		return !isSearch();
	}
	
	public String getParameter() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("size=");
		buffer.append("size");
		
		if(isSearch()) {
			buffer.append("&column=");
			buffer.append("column");
			buffer.append("&keyword=");
			buffer.append("keyword");
		}
		
		return buffer.toString();
	}
	
	public int getBegin() {
		return page * size - (size-1);
	}
	
	public int getEnd() {
		return page * size;
	}
	
	public int getTotalPage() {
		return (count + size - 1) / size; 
	}
	
	public int getStartBlock() {
		return (page - 1) / blockSize * blockSize + 1;
	}
	
	public int getFinishBlock() {
		int value = (page - 1) / blockSize * blockSize + blockSize;
		return Math.min(value, getTotalPage());
	}
	
	public boolean isFirst() {
		return page == 1;
	}
	
	public boolean isLast() {
		return page == getTotalPage();
	}
	
	public boolean isPrev() {
		return getStartBlock() > 1;
	}
	
	public boolean isNext() {
		return getFinishBlock() < getTotalPage();
	}
	
	public int getPrevPage() {
		return getStartBlock() - 1;
	}
	
	public int getNextPage() {
		return getFinishBlock() + 1;
	}
}
