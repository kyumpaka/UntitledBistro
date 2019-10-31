package com.bit.UntitledBistro.model.balju;

import java.sql.Date;

public class OrderPlanDTO {
	
	//발주계획상세내역 테이블
	private int ordpl_ordlin_num;
	private int ordpl_onum;
	private String ordpl_product_code;
	private String ordpl_product_name;
	private String ordpl_product_stndr;
	private int ordpl_qt;
	private int ordpl_pr_ea;
	private String ordpl_wr;
	
	private String orplin_date;  
	
	public int getOrdpl_ordlin_num() {
		return ordpl_ordlin_num;
	}
	public void setOrdpl_ordlin_num(int ordpl_ordlin_num) {
		this.ordpl_ordlin_num = ordpl_ordlin_num;
	}
	public int getOrdpl_onum() {
		return ordpl_onum;
	}
	public void setOrdpl_onum(int ordpl_onum) {
		this.ordpl_onum = ordpl_onum;
	}
	public String getOrdpl_product_code() {
		return ordpl_product_code;
	}
	public void setOrdpl_product_code(String ordpl_product_code) {
		this.ordpl_product_code = ordpl_product_code;
	}
	public String getOrdpl_product_name() {
		return ordpl_product_name;
	}
	public void setOrdpl_product_name(String ordpl_product_name) {
		this.ordpl_product_name = ordpl_product_name;
	}
	public String getOrdpl_product_stndr() {
		return ordpl_product_stndr;
	}
	public void setOrdpl_product_stndr(String ordpl_product_stndr) {
		this.ordpl_product_stndr = ordpl_product_stndr;
	}
	public int getOrdpl_qt() {
		return ordpl_qt;
	}
	public void setOrdpl_qt(int ordpl_qt) {
		this.ordpl_qt = ordpl_qt;
	}
	public int getOrdpl_pr_ea() {
		return ordpl_pr_ea;
	}
	public void setOrdpl_pr_ea(int ordpl_pr_ea) {
		this.ordpl_pr_ea = ordpl_pr_ea;
	}
	public String getOrdpl_wr() {
		return ordpl_wr;
	}
	public void setOrdpl_wr(String ordpl_wr) {
		this.ordpl_wr = ordpl_wr;
	}
	public String getOrplin_date() {
		return orplin_date;
	}
	public void setOrplin_date(String orplin_date) {
		this.orplin_date = orplin_date;
	}
	
	@Override
	public String toString() {
		return "OrderPlanDTO [ordpl_ordlin_num=" + ordpl_ordlin_num + ", ordpl_onum=" + ordpl_onum
				+ ", ordpl_product_code=" + ordpl_product_code + ", ordpl_product_name=" + ordpl_product_name
				+ ", ordpl_product_stndr=" + ordpl_product_stndr + ", ordpl_qt=" + ordpl_qt + ", ordpl_pr_ea="
				+ ordpl_pr_ea + ", ordpl_wr=" + ordpl_wr + ", orplin_date=" + orplin_date + "]";
	}
	
}
