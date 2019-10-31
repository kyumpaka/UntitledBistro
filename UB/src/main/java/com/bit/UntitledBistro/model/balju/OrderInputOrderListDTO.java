package com.bit.UntitledBistro.model.balju;

import java.sql.Date;

public class OrderInputOrderListDTO {
	
	private String order_ordin_num;
    private Date orplin_date;
    private String order_wr;
    private String order_product_name;
    private int order_product_count;
    private int total_pr;
    private String order_end;
	public String getOrder_ordin_num() {
		return order_ordin_num;
	}
	public void setOrder_ordin_num(String order_ordin_num) {
		this.order_ordin_num = order_ordin_num;
	}
	public Date getOrplin_date() {
		return orplin_date;
	}
	public void setOrplin_date(Date orplin_date) {
		this.orplin_date = orplin_date;
	}
	public String getOrder_wr() {
		return order_wr;
	}
	public void setOrder_wr(String order_wr) {
		this.order_wr = order_wr;
	}
	public String getOrder_product_name() {
		return order_product_name;
	}
	public void setOrder_product_name(String order_product_name) {
		this.order_product_name = order_product_name;
	}
	public int getOrder_product_count() {
		return order_product_count;
	}
	public void setOrder_product_count(int order_product_count) {
		this.order_product_count = order_product_count;
	}
	public int getTotal_pr() {
		return total_pr;
	}
	public void setTotal_pr(int total_pr) {
		this.total_pr = total_pr;
	}
	public String getOrder_end() {
		return order_end;
	}
	public void setOrder_end(String order_end) {
		this.order_end = order_end;
	}
	
	@Override
	public String toString() {
		return "OrderInputOrderListDTO [order_ordin_num=" + order_ordin_num + ", orplin_date=" + orplin_date
				+ ", order_wr=" + order_wr + ", order_product_name=" + order_product_name + ", order_product_count="
				+ order_product_count + ", total_pr=" + total_pr + ", order_end=" + order_end + "]";
	}
    
}
