package com.bit.UntitledBistro.model.balju;

import java.sql.Date;

public class BaljuResultDTO {
	
	private Date ordin_date;
	private String order_ordin_num;
	private String order_wr;
	private String order_product_name;
	private int order_qt;
	private int order_pr_ea;
	private int order_pr_tot;
	
	private String datestart;
	private String dateend;
	
	public Date getOrdin_date() {
		return ordin_date;
	}
	public void setOrdin_date(Date ordin_date) {
		this.ordin_date = ordin_date;
	}
	public String getOrder_ordin_num() {
		return order_ordin_num;
	}
	public void setOrder_ordin_num(String order_ordin_num) {
		this.order_ordin_num = order_ordin_num;
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
	public int getOrder_qt() {
		return order_qt;
	}
	public void setOrder_qt(int order_qt) {
		this.order_qt = order_qt;
	}
	public int getOrder_pr_ea() {
		return order_pr_ea;
	}
	public void setOrder_pr_ea(int order_pr_ea) {
		this.order_pr_ea = order_pr_ea;
	}
	public int getOrder_pr_tot() {
		return order_pr_tot;
	}
	public void setOrder_pr_tot(int order_pr_tot) {
		this.order_pr_tot = order_pr_tot;
	}
	public String getDatestart() {
		return datestart;
	}
	public void setDatestart(String datestart) {
		this.datestart = datestart;
	}
	public String getDateend() {
		return dateend;
	}
	public void setDateend(String dateend) {
		this.dateend = dateend;
	}
	
	@Override
	public String toString() {
		return "BaljuResultDTO [ordin_date=" + ordin_date + ", order_ordin_num=" + order_ordin_num + ", order_wr="
				+ order_wr + ", order_product_name=" + order_product_name + ", order_qt=" + order_qt + ", order_pr_ea="
				+ order_pr_ea + ", order_pr_tot=" + order_pr_tot + ", datestart=" + datestart + ", dateend=" + dateend
				+ "]";
	}
	
}
