package com.bit.UntitledBistro.model.balju;

import java.sql.Date;

public class OrderInputOrderPlanDTO {

	private Date orplin_date;
	private String ordpl_ordlin_num;
	private String ordpl_product_name;
	private int ordpl_product_name_count;
	
	public Date getOrplin_date() {
		return orplin_date;
	}
	public void setOrplin_date(Date orplin_date) {
		this.orplin_date = orplin_date;
	}
	public String getOrdpl_ordlin_num() {
		return ordpl_ordlin_num;
	}
	public void setOrdpl_ordlin_num(String ordpl_ordlin_num) {
		this.ordpl_ordlin_num = ordpl_ordlin_num;
	}
	public String getOrdpl_product_name() {
		return ordpl_product_name;
	}
	public void setOrdpl_product_name(String ordpl_product_name) {
		this.ordpl_product_name = ordpl_product_name;
	}
	public int getOrdpl_product_name_count() {
		return ordpl_product_name_count;
	}
	public void setOrdpl_product_name_count(int ordpl_product_name_count) {
		this.ordpl_product_name_count = ordpl_product_name_count;
	}
	
	@Override
	public String toString() {
		return "OrderInputOrderPlanDTO [orplin_date=" + orplin_date + ", ordpl_ordlin_num=" + ordpl_ordlin_num
				+ ", ordpl_product_name=" + ordpl_product_name + ", ordpl_product_name_count="
				+ ordpl_product_name_count + "]";
	}
	
}
