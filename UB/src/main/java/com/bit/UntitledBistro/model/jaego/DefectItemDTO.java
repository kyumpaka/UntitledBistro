package com.bit.UntitledBistro.model.jaego;

public class DefectItemDTO {
	private int di_no;
	private String di_product_code;
	private String di_product_name;
	private int di_qty;
	private String di_date;
	private String di_state;
	private String di_reason;
	
	public int getDi_no() {
		return di_no;
	}
	public void setDi_no(int di_no) {
		this.di_no = di_no;
	}
	public String getDi_product_code() {
		return di_product_code;
	}
	public void setDi_product_code(String di_product_code) {
		this.di_product_code = di_product_code;
	}
	public String getDi_product_name() {
		return di_product_name;
	}
	public void setDi_product_name(String di_product_name) {
		this.di_product_name = di_product_name;
	}
	public int getDi_qty() {
		return di_qty;
	}
	public void setDi_qty(int di_qty) {
		this.di_qty = di_qty;
	}
	public String getDi_date() {
		return di_date;
	}
	public void setDi_date(String di_date) {
		this.di_date = di_date;
	}
	public String getDi_state() {
		return di_state;
	}
	public void setDi_state(String di_state) {
		this.di_state = di_state;
	}
	public String getDi_reason() {
		return di_reason;
	}
	public void setDi_reason(String di_reason) {
		this.di_reason = di_reason;
	}
	
	@Override
	public String toString() {
		return "DefectItemDTO [di_no=" + di_no + ", di_product_code=" + di_product_code + ", di_product_name="
				+ di_product_name + ", di_qty=" + di_qty + ", di_date=" + di_date + ", di_state=" + di_state
				+ ", di_reason=" + di_reason + "]";
	}
	
}
