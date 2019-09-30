
	
	package com.bit.UntitledBistro.model.balju;

	import java.util.Date;

	public class Balju_PlanDTO {

		//발주계획 넘버링 테이블
		private int ORPLIN_NUM;
		private Date ORPLIN_DATE;
		
		//발주계획상세내역 테이블
		private int ORDPL_ORDLIN_NUM;
		private int ORDPL_ONUM;
		private String ORDPL_PRODUCT_CODE;
		private String ORDPL_PRODUCT_NAME;
		private String ORDPL_PRODUCT_STNDR;
		private int ORDPL_QT;
		private int ORDPL_PR_EA;
		private String ORDPL_WR;
		private String ORDPL_END;
		
		
		@Override
		public String toString() {
			return "Balju_PlanDTO [ORPLIN_NUM=" + ORPLIN_NUM + ", ORPLIN_DATE=" + ORPLIN_DATE + ", ORDPL_ORDLIN_NUM="
					+ ORDPL_ORDLIN_NUM + ", ORDPL_ONUM=" + ORDPL_ONUM + ", ORDPL_PRODUCT_CODE=" + ORDPL_PRODUCT_CODE
					+ ", ORDPL_PRODUCT_NAME=" + ORDPL_PRODUCT_NAME + ", ORDPL_PRODUCT_STNDR=" + ORDPL_PRODUCT_STNDR
					+ ", ORDPL_QT=" + ORDPL_QT + ", ORDPL_PR_EA=" + ORDPL_PR_EA + ", ORDPL_WR=" + ORDPL_WR
					+ ", ORDPL_END=" + ORDPL_END + "]";
		}
		
		public int getORPLIN_NUM() {
			return ORPLIN_NUM;
		}
		public void setORPLIN_NUM(int oRPLIN_NUM) {
			ORPLIN_NUM = oRPLIN_NUM;
		}
		public Date getORPLIN_DATE() {
			return ORPLIN_DATE;
		}
		public void setORPLIN_DATE(Date oRPLIN_DATE) {
			ORPLIN_DATE = oRPLIN_DATE;
		}
		public int getORDPL_ORDLIN_NUM() {
			return ORDPL_ORDLIN_NUM;
		}
		public void setORDPL_ORDLIN_NUM(int oRDPL_ORDLIN_NUM) {
			ORDPL_ORDLIN_NUM = oRDPL_ORDLIN_NUM;
		}
		public int getORDPL_ONUM() {
			return ORDPL_ONUM;
		}
		public void setORDPL_ONUM(int oRDPL_ONUM) {
			ORDPL_ONUM = oRDPL_ONUM;
		}
		public String getORDPL_PRODUCT_CODE() {
			return ORDPL_PRODUCT_CODE;
		}
		public void setORDPL_PRODUCT_CODE(String oRDPL_PRODUCT_CODE) {
			ORDPL_PRODUCT_CODE = oRDPL_PRODUCT_CODE;
		}
		public String getORDPL_PRODUCT_NAME() {
			return ORDPL_PRODUCT_NAME;
		}
		public void setORDPL_PRODUCT_NAME(String oRDPL_PRODUCT_NAME) {
			ORDPL_PRODUCT_NAME = oRDPL_PRODUCT_NAME;
		}
		public String getORDPL_PRODUCT_STNDR() {
			return ORDPL_PRODUCT_STNDR;
		}
		public void setORDPL_PRODUCT_STNDR(String oRDPL_PRODUCT_STNDR) {
			ORDPL_PRODUCT_STNDR = oRDPL_PRODUCT_STNDR;
		}
		public int getORDPL_QT() {
			return ORDPL_QT;
		}
		public void setORDPL_QT(int oRDPL_QT) {
			ORDPL_QT = oRDPL_QT;
		}
		public int getORDPL_PR_EA() {
			return ORDPL_PR_EA;
		}
		public void setORDPL_PR_EA(int oRDPL_PR_EA) {
			ORDPL_PR_EA = oRDPL_PR_EA;
		}
		public String getORDPL_WR() {
			return ORDPL_WR;
		}
		public void setORDPL_WR(String oRDPL_WR) {
			ORDPL_WR = oRDPL_WR;
		}
		public String getORDPL_END() {
			return ORDPL_END;
		}
		public void setORDPL_END(String oRDPL_END) {
			ORDPL_END = oRDPL_END;
		}
		
		
		
	

		

		
		
		
	}
