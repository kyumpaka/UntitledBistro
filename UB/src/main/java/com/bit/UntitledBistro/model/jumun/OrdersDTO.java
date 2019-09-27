package com.bit.UntitledBistro.model.jumun;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class OrdersDTO {
	
	private String orders_No;
	private String orders_TableSave_Code;
	private Date orders_First;
	private Date orders_Final;
	private ArrayList<HashMap<String, Object>> OrdersListDTO;
	
	public String getOrders_No() {
		return orders_No;
	}
	public void setOrders_No(String orders_No) {
		this.orders_No = orders_No;
	}
	public String getOrders_TableSave_Code() {
		return orders_TableSave_Code;
	}
	public void setOrders_TableSave_Code(String orders_TableSave_Code) {
		this.orders_TableSave_Code = orders_TableSave_Code;
	}
	public Date getOrders_First() {
		return orders_First;
	}
	public void setOrders_First(Date orders_First) {
		this.orders_First = orders_First;
	}
	public Date getOrders_Final() {
		return orders_Final;
	}
	public void setOrders_Final(Date orders_Final) {
		this.orders_Final = orders_Final;
	}
	public ArrayList<HashMap<String, Object>> getOrdersListDTO() {
		return OrdersListDTO;
	}
	public void setOrdersListDTO(ArrayList<HashMap<String, Object>> ordersListDTO) {
		OrdersListDTO = ordersListDTO;
	}
	
}
