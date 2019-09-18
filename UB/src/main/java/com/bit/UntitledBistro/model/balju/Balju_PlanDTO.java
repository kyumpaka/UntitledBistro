package com.bit.UntitledBistro.model.balju;

import java.util.Date;

public class Balju_PlanDTO {

	//발주계획 넘버링 테이블
	private String ORPLIN_NUM;
	private Date ORPLIN_DATE;
	
	//발주계획상세내역 테이블
	private String ORDPL_ORDLIN_NUM;
	private String ORDPL_ONUM;
	private String ORDPL_PRODUCT_CODE;
	private int ORDPL_QT;
	private String ORDPL_WR;
	private String ORDPL_STAT;
	private String ORDPL_END;
	
	
	public String getORPLIN_NUM() {
		return ORPLIN_NUM;
	}
	public void setORPLIN_NUM(String oRPLIN_NUM) {
		ORPLIN_NUM = oRPLIN_NUM;
	}
	public Date getORPLIN_DATE() {
		return ORPLIN_DATE;
	}
	public void setORPLIN_DATE(Date oRPLIN_DATE) {
		ORPLIN_DATE = oRPLIN_DATE;
	}
	public String getORDPL_ORDLIN_NUM() {
		return ORDPL_ORDLIN_NUM;
	}
	public void setORDPL_ORDLIN_NUM(String oRDPL_ORDLIN_NUM) {
		ORDPL_ORDLIN_NUM = oRDPL_ORDLIN_NUM;
	}
	public String getORDPL_ONUM() {
		return ORDPL_ONUM;
	}
	public void setORDPL_ONUM(String oRDPL_ONUM) {
		ORDPL_ONUM = oRDPL_ONUM;
	}
	public String getORDPL_PRODUCT_CODE() {
		return ORDPL_PRODUCT_CODE;
	}
	public void setORDPL_PRODUCT_CODE(String oRDPL_PRODUCT_CODE) {
		ORDPL_PRODUCT_CODE = oRDPL_PRODUCT_CODE;
	}
	public int getORDPL_QT() {
		return ORDPL_QT;
	}
	public void setORDPL_QT(int oRDPL_QT) {
		ORDPL_QT = oRDPL_QT;
	}
	public String getORDPL_WR() {
		return ORDPL_WR;
	}
	public void setORDPL_WR(String oRDPL_WR) {
		ORDPL_WR = oRDPL_WR;
	}
	public String getORDPL_STAT() {
		return ORDPL_STAT;
	}
	public void setORDPL_STAT(String oRDPL_STAT) {
		ORDPL_STAT = oRDPL_STAT;
	}
	public String getORDPL_END() {
		return ORDPL_END;
	}
	public void setORDPL_END(String oRDPL_END) {
		ORDPL_END = oRDPL_END;
	}
	
	@Override
	public String toString() {
		return "Balju_DTO [ORPLIN_NUM=" + ORPLIN_NUM + ", ORPLIN_DATE=" + ORPLIN_DATE + ", ORDPL_ORDLIN_NUM="
				+ ORDPL_ORDLIN_NUM + ", ORDPL_ONUM=" + ORDPL_ONUM + ", ORDPL_PRODUCT_CODE=" + ORDPL_PRODUCT_CODE
				+ ", ORDPL_QT=" + ORDPL_QT + ", ORDPL_WR=" + ORDPL_WR + ", ORDPL_STAT=" + ORDPL_STAT + ", ORDPL_END="
				+ ORDPL_END + "]";
	}
	
	
	
	
	
}
