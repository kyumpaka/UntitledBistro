package com.bit.UntitledBistro.model.jumun;

import java.util.ArrayList;

public class SalesDTO {
	
	private String sales_No;
	private ArrayList<SalesDetailsDTO> salesDetailsDTOs;
	private PaymentDTO paymentDTO;
	
	public String getSales_No() {
		return sales_No;
	}
	public void setSales_No(String sales_No) {
		this.sales_No = sales_No;
	}
	public ArrayList<SalesDetailsDTO> getSalesDetailsDTOs() {
		return salesDetailsDTOs;
	}
	public void setSalesDetailsDTOs(ArrayList<SalesDetailsDTO> salesDetailsDTOs) {
		this.salesDetailsDTOs = salesDetailsDTOs;
	}
	public PaymentDTO getPaymentDTO() {
		return paymentDTO;
	}
	public void setPaymentDTO(PaymentDTO paymentDTO) {
		this.paymentDTO = paymentDTO;
	}
	
}
