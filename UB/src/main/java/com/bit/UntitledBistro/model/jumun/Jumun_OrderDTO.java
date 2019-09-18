package com.bit.UntitledBistro.model.jumun;

import java.util.ArrayList;
import java.util.Date;

public class Jumun_OrderDTO {
	
	private String order_No;
	private String order_Table;
	private Date order_First;
	private Date order_Final;
	private ArrayList<Jumun_OrderDetailDTO> jumun_OrderDetailDTO;
	
	public String getOrder_No() {
		return order_No;
	}
	public void setOrder_No(String order_No) {
		this.order_No = order_No;
	}
	public String getOrder_Table() {
		return order_Table;
	}
	public void setOrder_Table(String order_Table) {
		this.order_Table = order_Table;
	}
	public Date getOrder_First() {
		return order_First;
	}
	public void setOrder_First(Date order_First) {
		this.order_First = order_First;
	}
	public Date getOrder_Final() {
		return order_Final;
	}
	public void setOrder_Final(Date order_Final) {
		this.order_Final = order_Final;
	}
	public ArrayList<Jumun_OrderDetailDTO> getJumun_OrderDetailDTO() {
		return jumun_OrderDetailDTO;
	}
	public void setJumun_OrderDetailDTO(ArrayList<Jumun_OrderDetailDTO> jumun_OrderDetailDTO) {
		this.jumun_OrderDetailDTO = jumun_OrderDetailDTO;
	}
	
}
