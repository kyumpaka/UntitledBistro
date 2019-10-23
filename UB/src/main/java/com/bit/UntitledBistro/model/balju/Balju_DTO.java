package com.bit.UntitledBistro.model.balju;

import java.util.Date;

public class Balju_DTO {
	
	//발주 넘버링 테이블
	private int ORDIN_NUM;
	private Date ORDIN_DATE;
	private String ORDIN_END;
	
	//발주 내역 상세 테이블
	private int ORDER_ORDIN_NUM;
	private int ORDER_NUM;
	private String ORDER_PRODUCT_CODE;
	private String ORDER_PRODUCT_NAME;
	private String ORDER_PRODUCT_STNDR;
	private int ORDER_QT;
	private int ORDER_PR_EA;
	private String ORDER_WR;
	
	//발주 현황 일자 검색용 
	private String DATESTART;
	private String DATEEND;
	
	
	
	@Override
	public String toString() {
		return "Balju_DTO [ORDIN_NUM=" + ORDIN_NUM + ", ORDIN_DATE=" + ORDIN_DATE + ", ORDIN_END=" + ORDIN_END
				+ ", ORDER_ORDIN_NUM=" + ORDER_ORDIN_NUM + ", ORDER_NUM=" + ORDER_NUM + ", ORDER_PRODUCT_CODE="
				+ ORDER_PRODUCT_CODE + ", ORDER_PRODUCT_NAME=" + ORDER_PRODUCT_NAME + ", ORDER_PRODUCT_STNDR="
				+ ORDER_PRODUCT_STNDR + ", ORDER_QT=" + ORDER_QT + ", ORDER_PR_EA=" + ORDER_PR_EA + ", ORDER_WR="
				+ ORDER_WR + ", DATESTART=" + DATESTART + ", DATEEND=" + DATEEND + "]";
	}
	public String getDATEEND() {
		return DATEEND;
	}
	public void setDATEEND(String dATEEND) {
		DATEEND = dATEEND;
	}
	public String getDATESTART() {
		return DATESTART;
	}
	public void setDATESTART(String dATESTART) {
		DATESTART = dATESTART;
	}
	public int getORDIN_NUM() {
		return ORDIN_NUM;
	}
	public void setORDIN_NUM(int oRDIN_NUM) {
		ORDIN_NUM = oRDIN_NUM;
	}
	public Date getORDIN_DATE() {
		return ORDIN_DATE;
	}
	public void setORDIN_DATE(Date oRDIN_DATE) {
		ORDIN_DATE = oRDIN_DATE;
	}
	public String getORDIN_END() {
		return ORDIN_END;
	}
	public void setORDIN_END(String oRDIN_END) {
		ORDIN_END = oRDIN_END;
	}
	public int getORDER_ORDIN_NUM() {
		return ORDER_ORDIN_NUM;
	}
	public void setORDER_ORDIN_NUM(int oRDER_ORDIN_NUM) {
		ORDER_ORDIN_NUM = oRDER_ORDIN_NUM;
	}
	public int getORDER_NUM() {
		return ORDER_NUM;
	}
	public void setORDER_NUM(int oRDER_NUM) {
		ORDER_NUM = oRDER_NUM;
	}
	public String getORDER_PRODUCT_CODE() {
		return ORDER_PRODUCT_CODE;
	}
	public void setORDER_PRODUCT_CODE(String oRDER_PRODUCT_CODE) {
		ORDER_PRODUCT_CODE = oRDER_PRODUCT_CODE;
	}
	public String getORDER_PRODUCT_NAME() {
		return ORDER_PRODUCT_NAME;
	}
	public void setORDER_PRODUCT_NAME(String oRDER_PRODUCT_NAME) {
		ORDER_PRODUCT_NAME = oRDER_PRODUCT_NAME;
	}
	public String getORDER_PRODUCT_STNDR() {
		return ORDER_PRODUCT_STNDR;
	}
	public void setORDER_PRODUCT_STNDR(String oRDER_PRODUCT_STNDR) {
		ORDER_PRODUCT_STNDR = oRDER_PRODUCT_STNDR;
	}
	public int getORDER_QT() {
		return ORDER_QT;
	}
	public void setORDER_QT(int oRDER_QT) {
		ORDER_QT = oRDER_QT;
	}
	public int getORDER_PR_EA() {
		return ORDER_PR_EA;
	}
	public void setORDER_PR_EA(int oRDER_PR_EA) {
		ORDER_PR_EA = oRDER_PR_EA;
	}
	public String getORDER_WR() {
		return ORDER_WR;
	}
	public void setORDER_WR(String oRDER_WR) {
		ORDER_WR = oRDER_WR;
	}
	
	
	
	
}
