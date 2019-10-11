package com.bit.UntitledBistro.model.jungsan;

import java.util.Date;

public class Jungsan_Input_DTO {
	private int jungsan_input_cash;
	private int jungsan_input_card;
	private int jungsan_input_worktime;
	private int jungsan_input_expenditure;
	private int jungsan_input_point;
	private int jungsan_input_refund;
	private String jungsan_input_reason;
	private String jungsan_input_grade;
	private Date jungsan_input_date;
	//정산테이블 Jungsan_Input
	
	public int getJungsan_input_cash() {
		return jungsan_input_cash;
	}
	public void setJungsan_input_cash(int jungsan_input_cash) {
		this.jungsan_input_cash = jungsan_input_cash;
	}
	public int getJungsan_input_card() {
		return jungsan_input_card;
	}
	public void setJungsan_input_card(int jungsan_input_card) {
		this.jungsan_input_card = jungsan_input_card;
	}
	public int getJungsan_input_worktime() {
		return jungsan_input_worktime;
	}
	public void setJungsan_input_worktime(int jungsan_input_worktime) {
		this.jungsan_input_worktime = jungsan_input_worktime;
	}
	public int getJungsan_input_expenditure() {
		return jungsan_input_expenditure;
	}
	public void setJungsan_input_expenditure(int jungsan_input_expenditure) {
		this.jungsan_input_expenditure = jungsan_input_expenditure;
	}
	public int getJungsan_input_point() {
		return jungsan_input_point;
	}
	public void setJungsan_input_point(int jungsan_input_point) {
		this.jungsan_input_point = jungsan_input_point;
	}
	public int getJungsan_input_refund() {
		return jungsan_input_refund;
	}
	public void setJungsan_input_refund(int jungsan_input_refund) {
		this.jungsan_input_refund = jungsan_input_refund;
	}
	public String getJungsan_input_reason() {
		return jungsan_input_reason;
	}
	public void setJungsan_input_reason(String jungsan_input_reason) {
		this.jungsan_input_reason = jungsan_input_reason;
	}
	public String getJungsan_input_grade() {
		return jungsan_input_grade;
	}
	public void setJungsan_input_grade(String jungsan_input_grade) {
		this.jungsan_input_grade = jungsan_input_grade;
	}
	public Date getJungsan_input_date() {
		return jungsan_input_date;
	}
	public void setJungsan_input_date(Date jungsan_input_date) {
		this.jungsan_input_date = jungsan_input_date;
	}
	@Override
	public String toString() {
		return "Jungsan_Input_DTO [jungsan_input_cash=" + jungsan_input_cash + ", jungsan_input_card="
				+ jungsan_input_card + ", jungsan_input_worktime=" + jungsan_input_worktime
				+ ", jungsan_input_expenditure=" + jungsan_input_expenditure + ", jungsan_input_point="
				+ jungsan_input_point + ", jungsan_input_refund=" + jungsan_input_refund + ", jungsan_input_reason="
				+ jungsan_input_reason + ", jungsan_input_grade=" + jungsan_input_grade + ", jungsan_input_date="
				+ jungsan_input_date + "]";
	}
}
