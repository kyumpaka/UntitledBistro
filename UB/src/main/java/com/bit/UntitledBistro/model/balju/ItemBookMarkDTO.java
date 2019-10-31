package com.bit.UntitledBistro.model.balju;

public class ItemBookMarkDTO {

	private int rownum;
	private String order_product_code;
	private String order_product_name;
	private String order_product_stndr;
	private int order_pr_ea;
	private int order_qt;
	private String order_wr;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getOrder_product_code() {
		return order_product_code;
	}
	public void setOrder_product_code(String order_product_code) {
		this.order_product_code = order_product_code;
	}
	public String getOrder_product_name() {
		return order_product_name;
	}
	public void setOrder_product_name(String order_product_name) {
		this.order_product_name = order_product_name;
	}
	public String getOrder_product_stndr() {
		return order_product_stndr;
	}
	public void setOrder_product_stndr(String order_product_stndr) {
		this.order_product_stndr = order_product_stndr;
	}
	public int getOrder_pr_ea() {
		return order_pr_ea;
	}
	public void setOrder_pr_ea(int order_pr_ea) {
		this.order_pr_ea = order_pr_ea;
	}
	public int getOrder_qt() {
		return order_qt;
	}
	public void setOrder_qt(int order_qt) {
		this.order_qt = order_qt;
	}
	public String getOrder_wr() {
		return order_wr;
	}
	public void setOrder_wr(String order_wr) {
		this.order_wr = order_wr;
	}
	
	@Override
	public String toString() {
		return "ItemBookMark [rownum=" + rownum + ", order_product_code=" + order_product_code + ", order_product_name="
				+ order_product_name + ", order_product_stndr=" + order_product_stndr + ", order_pr_ea=" + order_pr_ea
				+ ", order_qt=" + order_qt + ", order_wr=" + order_wr + "]";
	}

}
