package com.bit.UntitledBistro.model.jungsan;

import java.util.Date;

public class Jungsan_view_DTO {
     private int payment_point;  		//포인트 사용금액
     private int payment_discount; 		// 할인금액(서비스)
     private int payment_cash; 		// 현금결제금액
     private int payment_card; 		// 카드결제금액
     private Date payment_date; 		// 결제시간
     private String payment_state; 	//결제상태
     private String menu_code; 			// 메뉴코드(PK)
     private String menu_mt_code; 		// 분류코드(FK)
     private String menu_name; 			// 메뉴이름
     //뷰 리스트 규민 table 불러오기
	public int getPayment_point() {
		return payment_point;
	}
	public void setPayment_point(int payment_point) {
		this.payment_point = payment_point;
	}
	public int getPayment_discount() {
		return payment_discount;
	}
	public void setPayment_discount(int payment_discount) {
		this.payment_discount = payment_discount;
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
	@Override
	public String toString() {
		return "Jungsan_view_DTO [payment_point=" + payment_point + ", payment_discount=" + payment_discount
				+ ", payment_cash=" + payment_cash + ", payment_card=" + payment_card + ", payment_date=" + payment_date
				+ ", payment_state=" + payment_state + ", menu_code=" + menu_code + ", menu_mt_code=" + menu_mt_code
				+ ", menu_name=" + menu_name + "]";
	}
}
