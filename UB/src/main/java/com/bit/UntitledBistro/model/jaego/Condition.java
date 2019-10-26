package com.bit.UntitledBistro.model.jaego;

public class Condition {

	private String keyword;
	private String keyword2;
	private String startDate;
	private String endDate;
	
	private int startPage;
	private int endPage;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "Condition [keyword=" + keyword + ", keyword2=" + keyword2 + ", startDate=" + startDate + ", endDate="
				+ endDate + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}
