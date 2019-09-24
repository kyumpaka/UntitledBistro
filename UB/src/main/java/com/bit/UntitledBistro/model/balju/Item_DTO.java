package com.bit.UntitledBistro.model.balju;

public class Item_DTO {

	private String PRODUCT_CODE;
	private String PRODUCT_NAME;
	private String PRODUCT_PRICE;
	private String PRODUCT_EXPDATE;
	public String getPRODUCT_CODE() {
		return PRODUCT_CODE;
	}
	public void setPRODUCT_CODE(String pRODUCT_CODE) {
		PRODUCT_CODE = pRODUCT_CODE;
	}
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public String getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}
	public void setPRODUCT_PRICE(String pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}
	public String getPRODUCT_EXPDATE() {
		return PRODUCT_EXPDATE;
	}
	public void setPRODUCT_EXPDATE(String pRODUCT_EXPDATE) {
		PRODUCT_EXPDATE = pRODUCT_EXPDATE;
	}
	@Override
	public String toString() {
		return "Item_DTO [PRODUCT_CODE=" + PRODUCT_CODE + ", PRODUCT_NAME=" + PRODUCT_NAME + ", PRODUCT_PRICE="
				+ PRODUCT_PRICE + ", PRODUCT_EXPDATE=" + PRODUCT_EXPDATE + "]";
	}
	
	
	
}
