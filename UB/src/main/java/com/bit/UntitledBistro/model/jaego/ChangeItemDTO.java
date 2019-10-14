package com.bit.UntitledBistro.model.jaego;

public class ChangeItemDTO {
	private String product_code;
	private String product_name;
	private int total_qty;
	private int before_qty;
	private int in_qty;
	private int out_qty;
	
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getTotal_qty() {
		return total_qty;
	}
	public void setTotal_qty(int total_qty) {
		this.total_qty = total_qty;
	}
	public int getBefore_qty() {
		return before_qty;
	}
	public void setBefore_qty(int before_qty) {
		this.before_qty = before_qty;
	}
	public int getIn_qty() {
		return in_qty;
	}
	public void setIn_qty(int in_qty) {
		this.in_qty = in_qty;
	}
	public int getOut_qty() {
		return out_qty;
	}
	public void setOut_qty(int out_qty) {
		this.out_qty = out_qty;
	}
	
}
