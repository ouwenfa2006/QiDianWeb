package com.foshan.util;

public class ProgressInfo {  
	private long totalSize;    
	private long readSize;    
	private String show;    
	private int itemNum;    
	private int rate;
	public long getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(long totalSize) {
		this.totalSize = totalSize;
	}
	public long getReadSize() {
		return readSize;
	}
	public void setReadSize(long readSize) {
		this.readSize = readSize;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}    

}
