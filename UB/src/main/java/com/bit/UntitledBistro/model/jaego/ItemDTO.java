package com.bit.UntitledBistro.model.jaego;

public class ItemDTO {
	private int item_no; // 재고번호(PK)
	private String item_product_code; // 발주물품코드(FK)
	private String product_name; // 품목명(PRODUCT)
	private int item_qty; // 재고수량
	private String item_regdate; // 등록일자
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getItem_product_code() {
		return item_product_code;
	}
	public void setItem_product_code(String item_product_code) {
		this.item_product_code = item_product_code;
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
	public String getItem_regdate() {
		return item_regdate;
	}
	public void setItem_regdate(String item_regdate) {
		this.item_regdate = item_regdate;
	}
	
}
