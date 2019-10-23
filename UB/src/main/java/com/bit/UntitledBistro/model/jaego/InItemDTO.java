package com.bit.UntitledBistro.model.jaego;

public class InItemDTO {
	private int ii_no;
	private int ii_ordin_num;
    private String ii_product_code;
	private String ii_product_name;
	private int ii_qty;
	private String ii_date;
	
	public int getIi_no() {
		return ii_no;
	}
	public void setIi_no(int ii_no) {
		this.ii_no = ii_no;
	}
	public int getIi_ordin_num() {
		return ii_ordin_num;
	}
	public void setIi_ordin_num(int ii_ordin_num) {
		this.ii_ordin_num = ii_ordin_num;
	}
	public String getIi_product_code() {
		return ii_product_code;
	}
	public void setIi_product_code(String ii_product_code) {
		this.ii_product_code = ii_product_code;
	}
	public String getIi_product_name() {
		return ii_product_name;
	}
	public void setIi_product_name(String ii_product_name) {
		this.ii_product_name = ii_product_name;
	}
	public int getIi_qty() {
		return ii_qty;
	}
	public void setIi_qty(int ii_qty) {
		this.ii_qty = ii_qty;
	}
	public String getIi_date() {
		return ii_date;
	}
	public void setIi_date(String ii_date) {
		this.ii_date = ii_date;
	}

	@Override
	public String toString() {
		return "InItemDTO [ii_no=" + ii_no + ", ii_product_code=" + ii_product_code + ", ii_product_name="
				+ ii_product_name + ", ii_qty=" + ii_qty + ", ii_date=" + ii_date + "]";
	}
	
}
