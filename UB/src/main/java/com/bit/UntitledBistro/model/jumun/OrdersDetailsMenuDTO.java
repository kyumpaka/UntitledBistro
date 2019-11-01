package com.bit.UntitledBistro.model.jumun;

public class OrdersDetailsMenuDTO {

	private String od_no;
    private String od_orders_no;
    private String od_menu_code;
    private int od_qty;
    private String menu_name;
    private int menu_price;
    
	public String getOd_no() {
		return od_no;
	}
	public void setOd_no(String od_no) {
		this.od_no = od_no;
	}
	public String getOd_orders_no() {
		return od_orders_no;
	}
	public void setOd_orders_no(String od_orders_no) {
		this.od_orders_no = od_orders_no;
	}
	public String getOd_menu_code() {
		return od_menu_code;
	}
	public void setOd_menu_code(String od_menu_code) {
		this.od_menu_code = od_menu_code;
	}
	public int getOd_qty() {
		return od_qty;
	}
	public void setOd_qty(int od_qty) {
		this.od_qty = od_qty;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	
	@Override
	public String toString() {
		return "OrdersDetailsMenuDTO [od_no=" + od_no + ", od_orders_no=" + od_orders_no + ", od_menu_code="
				+ od_menu_code + ", od_qty=" + od_qty + ", menu_name=" + menu_name + ", menu_price=" + menu_price + "]";
	}
    
}
