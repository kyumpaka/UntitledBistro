package com.bit.UntitledBistro.model.jaego;

public class PageMaker {
	protected int page;
	protected int amount;
	protected int startPage;
	protected int endPage;
	protected int totalPage;

	public PageMaker() {
		page = 1;
		amount = 10;
	}
	
	public PageMaker(int page, int amount) {
		this.page = page;
		this.amount = amount;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public void calc(int total) {
		totalPage = (int)Math.ceil(total / (amount*1.0));
		endPage = page * amount;
		startPage = endPage - (amount-1);
		System.out.println("==========================================");
		System.out.println("page : " + page);
		System.out.println("amount : " + amount);
		System.out.println("totalPage : " + totalPage);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		System.out.println("==========================================");
		
	}
	
	
	
	
	
	
	
}
