package com.bit.UntitledBistro.model.jaego;

public class Item {
	private String ITEM_NO; // 재고번호(PK)
	private String ITEM_PRODUCT_CODE; // 발주물품코드(FK)
	private int ITEM_QTY; // 재고수량
     
	public String getITEM_NO() {
		return ITEM_NO;
	}
	public void setITEM_NO(String iTEM_NO) {
		ITEM_NO = iTEM_NO;
	}
	public String getITEM_PRODUCT_CODE() {
		return ITEM_PRODUCT_CODE;
	}
	public void setITEM_PRODUCT_CODE(String iTEM_PRODUCT_CODE) {
		ITEM_PRODUCT_CODE = iTEM_PRODUCT_CODE;
	}
	public int getITEM_QTY() {
		return ITEM_QTY;
	}
	public void setITEM_QTY(int iTEM_QTY) {
		ITEM_QTY = iTEM_QTY;
	}
     
}
