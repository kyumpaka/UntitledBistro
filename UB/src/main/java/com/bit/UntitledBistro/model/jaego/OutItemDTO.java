package com.bit.UntitledBistro.model.jaego;

public class OutItemDTO {
	private int oi_no;
	private String oi_product_code;
	private String product_name;
	private int oi_qty;
	private String oi_date;
	private String oi_type;
	
	public OutItemDTO() {}
	
	public OutItemDTO(String oi_product_code, int oi_qty) {
		this.oi_product_code = oi_product_code;
		this.oi_qty = oi_qty;
	}

	public int getOi_no() {
		return oi_no;
	}
	public void setOi_no(int oi_no) {
		this.oi_no = oi_no;
	}
	public String getOi_product_code() {
		return oi_product_code;
	}
	public void setOi_product_code(String oi_product_code) {
		this.oi_product_code = oi_product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getOi_qty() {
		return oi_qty;
	}
	public void setOi_qty(int oi_qty) {
		this.oi_qty = oi_qty;
	}
	public String getOi_date() {
		return oi_date;
	}
	public void setOi_date(String oi_date) {
		this.oi_date = oi_date;
	}
	public String getOi_type() {
		return oi_type;
	}
	public void setOi_type(String oi_type) {
		this.oi_type = oi_type;
	}
	
}
