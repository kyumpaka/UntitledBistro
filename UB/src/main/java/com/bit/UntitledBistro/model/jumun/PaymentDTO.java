package com.bit.UntitledBistro.model.jumun;

import java.util.Date;

public class PaymentDTO {

	private int payment_No;
	private String payment_Sales_No;
	private String payment_Member_Id;
	private String payment_Table;
	private String payment_State;
	private Date payment_Date;
	private int payment_Point;
	private int payment_Discount;
	private int payment_Cash;
	private int payment_Card;
	
	public int getPayment_No() {
		return payment_No;
	}
	public void setPayment_No(int payment_No) {
		this.payment_No = payment_No;
	}
	public String getPayment_Sales_No() {
		return payment_Sales_No;
	}
	public void setPayment_Sales_No(String payment_Sales_No) {
		this.payment_Sales_No = payment_Sales_No;
	}
	public String getPayment_Member_Id() {
		return payment_Member_Id;
	}
	public void setPayment_Member_Id(String payment_Member_Id) {
		this.payment_Member_Id = payment_Member_Id;
	}
	public String getPayment_Table() {
		return payment_Table;
	}
	public void setPayment_Table(String payment_Table) {
		this.payment_Table = payment_Table;
	}
	public String getPayment_State() {
		return payment_State;
	}
	public void setPayment_State(String payment_State) {
		this.payment_State = payment_State;
	}
	public Date getPayment_Date() {
		return payment_Date;
	}
	public void setPayment_Date(Date payment_Date) {
		this.payment_Date = payment_Date;
	}
	public int getPayment_Point() {
		return payment_Point;
	}
	public void setPayment_Point(int payment_Point) {
		this.payment_Point = payment_Point;
	}
	public int getPayment_Discount() {
		return payment_Discount;
	}
	public void setPayment_Discount(int payment_Discount) {
		this.payment_Discount = payment_Discount;
	}
	public int getPayment_Cash() {
		return payment_Cash;
	}
	public void setPayment_Cash(int payment_Cash) {
		this.payment_Cash = payment_Cash;
	}
	public int getPayment_Card() {
		return payment_Card;
	}
	public void setPayment_Card(int payment_Card) {
		this.payment_Card = payment_Card;
	}
	
}
