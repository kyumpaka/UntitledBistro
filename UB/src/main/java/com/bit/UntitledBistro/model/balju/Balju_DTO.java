package com.bit.UntitledBistro.model.balju;

import java.util.Date;

public class Balju_DTO {
	
	//발주 넘버링 테이블
	private String ORDIN_NUM;
	private Date ORDIN_DATE;
	
	//발주 내역 상세 테이블
	private String ORDER_ORDIN_NUM;
	private String ORDER_NUM;
	private String ORDER_PRODUCT_CODE;
	private int ORDER_QT;
	private int ORDER_PR_EA;
	private String ORDER_WR;
	private String ORDER_SUMMA;
	private String ORDER_STAT;
	private String ORDER_END;
	
	
	public String getORDIN_NUM() {
		return ORDIN_NUM;
	}
	public void setORDIN_NUM(String oRDIN_NUM) {
		ORDIN_NUM = oRDIN_NUM;
	}
	public Date getORDIN_DATE() {
		return ORDIN_DATE;
	}
	public void setORDIN_DATE(Date oRDIN_DATE) {
		ORDIN_DATE = oRDIN_DATE;
	}
	public String getORDER_ORDIN_NUM() {
		return ORDER_ORDIN_NUM;
	}
	public void setORDER_ORDIN_NUM(String oRDER_ORDIN_NUM) {
		ORDER_ORDIN_NUM = oRDER_ORDIN_NUM;
	}
	public String getORDER_NUM() {
		return ORDER_NUM;
	}
	public void setORDER_NUM(String oRDER_NUM) {
		ORDER_NUM = oRDER_NUM;
	}
	public String getORDER_PRODUCT_CODE() {
		return ORDER_PRODUCT_CODE;
	}
	public void setORDER_PRODUCT_CODE(String oRDER_PRODUCT_CODE) {
		ORDER_PRODUCT_CODE = oRDER_PRODUCT_CODE;
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
	public String getORDER_SUMMA() {
		return ORDER_SUMMA;
	}
	public void setORDER_SUMMA(String oRDER_SUMMA) {
		ORDER_SUMMA = oRDER_SUMMA;
	}
	public String getORDER_STAT() {
		return ORDER_STAT;
	}
	public void setORDER_STAT(String oRDER_STAT) {
		ORDER_STAT = oRDER_STAT;
	}
	public String getORDER_END() {
		return ORDER_END;
	}
	public void setORDER_END(String oRDER_END) {
		ORDER_END = oRDER_END;
	}
	
	
	@Override
	public String toString() {
		return "Balju_DTO [ORDIN_NUM=" + ORDIN_NUM + ", ORDIN_DATE=" + ORDIN_DATE + ", ORDER_ORDIN_NUM="
				+ ORDER_ORDIN_NUM + ", ORDER_NUM=" + ORDER_NUM + ", ORDER_PRODUCT_CODE=" + ORDER_PRODUCT_CODE
				+ ", ORDER_QT=" + ORDER_QT + ", ORDER_PR_EA=" + ORDER_PR_EA + ", ORDER_WR=" + ORDER_WR
				+ ", ORDER_SUMMA=" + ORDER_SUMMA + ", ORDER_STAT=" + ORDER_STAT + ", ORDER_END=" + ORDER_END + "]";
	}
	
	
	
	
}
