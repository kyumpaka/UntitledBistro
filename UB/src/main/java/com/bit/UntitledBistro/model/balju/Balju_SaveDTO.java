package com.bit.UntitledBistro.model.balju;

import java.util.Date;

public class Balju_SaveDTO {

	//발주 저장 넘버링 테이블
	private String ORSP_NUM;
	private Date ORSP_DATE;
	
	//발주 저장 내역 상세 테이블
	private String ORSA_ORSP_NUM;
	private String ORSA_NUM;
	private String ORSA_PRODUCT_CODE;
	private int ORSA_QT;
	private String ORSA_WR;
	
	
	public String getORSP_NUM() {
		return ORSP_NUM;
	}
	public void setORSP_NUM(String oRSP_NUM) {
		ORSP_NUM = oRSP_NUM;
	}
	public Date getORSP_DATE() {
		return ORSP_DATE;
	}
	public void setORSP_DATE(Date oRSP_DATE) {
		ORSP_DATE = oRSP_DATE;
	}
	public String getORSA_ORSP_NUM() {
		return ORSA_ORSP_NUM;
	}
	public void setORSA_ORSP_NUM(String oRSA_ORSP_NUM) {
		ORSA_ORSP_NUM = oRSA_ORSP_NUM;
	}
	public String getORSA_NUM() {
		return ORSA_NUM;
	}
	public void setORSA_NUM(String oRSA_NUM) {
		ORSA_NUM = oRSA_NUM;
	}
	public String getORSA_PRODUCT_CODE() {
		return ORSA_PRODUCT_CODE;
	}
	public void setORSA_PRODUCT_CODE(String oRSA_PRODUCT_CODE) {
		ORSA_PRODUCT_CODE = oRSA_PRODUCT_CODE;
	}
	public int getORSA_QT() {
		return ORSA_QT;
	}
	public void setORSA_QT(int oRSA_QT) {
		ORSA_QT = oRSA_QT;
	}
	public String getORSA_WR() {
		return ORSA_WR;
	}
	public void setORSA_WR(String oRSA_WR) {
		ORSA_WR = oRSA_WR;
	}
	
	
	@Override
	public String toString() {
		return "Balju_SaveDTO [ORSP_NUM=" + ORSP_NUM + ", ORSP_DATE=" + ORSP_DATE + ", ORSA_ORSP_NUM=" + ORSA_ORSP_NUM
				+ ", ORSA_NUM=" + ORSA_NUM + ", ORSA_PRODUCT_CODE=" + ORSA_PRODUCT_CODE + ", ORSA_QT=" + ORSA_QT
				+ ", ORSA_WR=" + ORSA_WR + "]";
	}
	
	
}
