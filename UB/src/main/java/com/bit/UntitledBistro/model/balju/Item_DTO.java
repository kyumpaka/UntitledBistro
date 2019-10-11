package com.bit.UntitledBistro.model.balju;

public class Item_DTO {

	private String PRODUCT_CODE;
	private String PRODUCT_NAME;
	private String PRODUCT_STNDR;
	private String PRODUCT_PRICE;
	private int PRODUCT_SAFE;
	private int ITEM_INDEX;
	private int ITEM_QTY;
	private String ITEM_PRODUCT_CODE;
	
	//BookMark 
	private int ROWNUM;
	
	private String BK_CODE;
	private String BK_NAME;
	private String BK_STNDR;
	private int BK_PR_EA;
	private int BK_QT;
	
	
	public int getBK_QT() {
		return BK_QT;
	}
	public void setBK_QT(int bK_QT) {
		BK_QT = bK_QT;
	}
	public String getBK_WR() {
		return BK_WR;
	}
	public void setBK_WR(String bK_WR) {
		BK_WR = bK_WR;
	}
	private String BK_WR;
	
	//Getter Setter
	public int getROWNUM() {
		return ROWNUM;
	}
	public void setROWNUM(int rOWNUM) {
		ROWNUM = rOWNUM;
	}
	
	
	public String getBK_STNDR() {
		return BK_STNDR;
	}
	public void setBK_STNDR(String bK_STNDR) {
		BK_STNDR = bK_STNDR;
	}
	public int getBK_PR_EA() {
		return BK_PR_EA;
	}
	public void setBK_PR_EA(int bK_PR_EA) {
		BK_PR_EA = bK_PR_EA;
	}
	public String getBK_CODE() {
		return BK_CODE;
	}
	public void setBK_CODE(String bK_CODE) {
		BK_CODE = bK_CODE;
	}
	public String getBK_NAME() {
		return BK_NAME;
	}
	public void setBK_NAME(String bK_NAME) {
		BK_NAME = bK_NAME;
	}
	
	
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
	public String getPRODUCT_STNDR() {
		return PRODUCT_STNDR;
	}
	public void setPRODUCT_STNDR(String pRODUCT_STNDR) {
		PRODUCT_STNDR = pRODUCT_STNDR;
	}
	public String getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}
	public void setPRODUCT_PRICE(String pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}
	public int getPRODUCT_SAFE() {
		return PRODUCT_SAFE;
	}
	public void setPRODUCT_SAFE(int pRODUCT_SAFE) {
		PRODUCT_SAFE = pRODUCT_SAFE;
	}
	public int getITEM_INDEX() {
		return ITEM_INDEX;
	}
	public void setITEM_INDEX(int iTEM_INDEX) {
		ITEM_INDEX = iTEM_INDEX;
	}
	public int getITEM_QTY() {
		return ITEM_QTY;
	}
	public void setITEM_QTY(int iTEM_QTY) {
		ITEM_QTY = iTEM_QTY;
	}
	public String getITEM_PRODUCT_CODE() {
		return ITEM_PRODUCT_CODE;
	}
	public void setITEM_PRODUCT_CODE(String iTEM_PRODUCT_CODE) {
		ITEM_PRODUCT_CODE = iTEM_PRODUCT_CODE;
	}

	
	
	
}
