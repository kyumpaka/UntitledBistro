package com.bit.UntitledBistro.model.jungsan;

import java.util.Date;

public class Jungsan_view_DTO {
     private int payment_point;  		//포인트 사용금액
     private int payment_cash; 		// 현금결제금액
     private int payment_card; 		// 카드결제금액
     private Date payment_date; 		// 결제시간
     private String payment_state; 	//결제상태
     private String menu_code; 			// 메뉴코드(PK)
     private String menu_mt_code; 		// 분류코드(FK)
     private String menu_name; 			// 메뉴이름
     private int to_total;
     private int to_cash;
     private int to_card;
     private int to_point;
     private int before_total;
     private int before_cash;
     private int before_card;
     private int before_point;
     private Date state_date;
     
     
	public int getPayment_point() {
		return payment_point;
	}
	public void setPayment_point(int payment_point) {
		this.payment_point = payment_point;
	}
	public int getPayment_cash() {
		return payment_cash;
	}
	public void setPayment_cash(int payment_cash) {
		this.payment_cash = payment_cash;
	}
	public int getPayment_card() {
		return payment_card;
	}
	public void setPayment_card(int payment_card) {
		this.payment_card = payment_card;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_state() {
		return payment_state;
	}
	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}
	public String getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}
	public String getMenu_mt_code() {
		return menu_mt_code;
	}
	public void setMenu_mt_code(String menu_mt_code) {
		this.menu_mt_code = menu_mt_code;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getTo_total() {
		return to_total;
	}
	public void setTo_total(int to_total) {
		this.to_total = to_total;
	}
	public int getTo_cash() {
		return to_cash;
	}
	public void setTo_cash(int to_cash) {
		this.to_cash = to_cash;
	}
	public int getTo_card() {
		return to_card;
	}
	public void setTo_card(int to_card) {
		this.to_card = to_card;
	}
	public int getTo_point() {
		return to_point;
	}
	public void setTo_point(int to_point) {
		this.to_point = to_point;
	}
	public int getBefore_total() {
		return before_total;
	}
	public void setBefore_total(int before_total) {
		this.before_total = before_total;
	}
	public int getBefore_cash() {
		return before_cash;
	}
	public void setBefore_cash(int before_cash) {
		this.before_cash = before_cash;
	}
	public int getBefore_card() {
		return before_card;
	}
	public void setBefore_card(int before_card) {
		this.before_card = before_card;
	}
	public int getBefore_point() {
		return before_point;
	}
	public void setBefore_point(int before_point) {
		this.before_point = before_point;
	}
	public Date getState_date() {
		return state_date;
	}
	public void setState_date(Date state_date) {
		this.state_date = state_date;
	}
	@Override
	public String toString() {
		return "Jungsan_view_DTO [payment_point=" + payment_point + ", payment_cash=" + payment_cash + ", payment_card="
				+ payment_card + ", payment_date=" + payment_date + ", payment_state=" + payment_state + ", menu_code="
				+ menu_code + ", menu_mt_code=" + menu_mt_code + ", menu_name=" + menu_name + ", to_total=" + to_total
				+ ", to_cash=" + to_cash + ", to_card=" + to_card + ", to_point=" + to_point + ", before_total="
				+ before_total + ", before_cash=" + before_cash + ", before_card=" + before_card + ", before_point="
				+ before_point + ", state_date=" + state_date + "]";
	}
}
