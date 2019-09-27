package com.bit.UntitledBistro.model.jungsan;

import java.util.Date;

public class JungsanDTO {
	private String cash;
	private String card;
	private String orderdan;
	private String cod;
	private String code_2;
	private String orsa;
	private Date timedate;
	
	public String getCash() {
		return cash;
	}
	public void setCash(String cash) {
		this.cash = cash;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getOrderdan() {
		return orderdan;
	}
	public void setOrderdan(String orderdan) {
		this.orderdan = orderdan;
	}
	public String getCod() {
		return cod;
	}
	public void setCod(String cod) {
		this.cod = cod;
	}
	public String getCode_2() {
		return code_2;
	}
	public void setCode_2(String code_2) {
		this.code_2 = code_2;
	}
	public String getOrsa() {
		return orsa;
	}
	public void setOrsa(String orsa) {
		this.orsa = orsa;
	}
	public Date getTimedate() {
		return timedate;
	}
	public void setTimedate(Date timedate) {
		this.timedate = timedate;
	}
	@Override
	public String toString() {
		return "jungsanDTO [cash=" + cash + ", card=" + card + ", orderdan=" + orderdan + ", cod=" + cod + ", code_2="
				+ code_2 + ", orsa=" + orsa + ", timedate=" + timedate + "]";
	}
	
	
}
