package com.bit.UntitledBistro.model.jaego;

public class RiskItemDTO {
	private String product_code; // 발주물품코드(FK)
	private String product_name; // 품목명(PRODUCT)
	private int item_qty; // 재고수량
	private int si_qty; // 안전수량
	
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getItem_qty() {
		return item_qty;
	}
	public void setItem_qty(int item_qty) {
		this.item_qty = item_qty;
	}
	public int getSi_qty() {
		return si_qty;
	}
	public void setSi_qty(int si_qty) {
		this.si_qty = si_qty;
	}
	
}
