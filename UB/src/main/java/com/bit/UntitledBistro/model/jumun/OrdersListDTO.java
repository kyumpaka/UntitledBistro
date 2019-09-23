package com.bit.UntitledBistro.model.jumun;

public class OrdersListDTO {
    
    private String od_No;
    private String od_Orders_No;
    private String od_Menu_Code;
    private String menu_Name;
    private int menu_Price;
    private int od_Qty;
    
	public String getOd_No() {
		return od_No;
	}
	public void setOd_No(String od_No) {
		this.od_No = od_No;
	}
	public String getOd_Orders_No() {
		return od_Orders_No;
	}
	public void setOd_Orders_No(String od_Orders_No) {
		this.od_Orders_No = od_Orders_No;
	}
	public String getOd_Menu_Code() {
		return od_Menu_Code;
	}
	public void setOd_Menu_Code(String od_Menu_Code) {
		this.od_Menu_Code = od_Menu_Code;
	}
	public String getMenu_Name() {
		return menu_Name;
	}
	public void setMenu_Name(String menu_Name) {
		this.menu_Name = menu_Name;
	}
	public int getMenu_Price() {
		return menu_Price;
	}
	public void setMenu_Price(int menu_Price) {
		this.menu_Price = menu_Price;
	}
	public int getOd_Qty() {
		return od_Qty;
	}
	public void setOd_Qty(int od_Qty) {
		this.od_Qty = od_Qty;
	}
    
}
