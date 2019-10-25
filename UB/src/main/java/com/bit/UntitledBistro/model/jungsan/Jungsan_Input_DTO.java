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
	private int month_cash;
	private int month_card; 
	private int month_worktime;
	private int	month_expenditure;
	private int month_point;
	private int month_refund;
	private int month_sum;
	private int month_real_sum;
	private Date month_date;
	private int difference;
	private int difference_month;
	private Date difference_date;
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



	public int getMonth_cash() {
		return month_cash;
	}



	public void setMonth_cash(int month_cash) {
		this.month_cash = month_cash;
	}



	public int getMonth_card() {
		return month_card;
	}



	public void setMonth_card(int month_card) {
		this.month_card = month_card;
	}



	public int getMonth_worktime() {
		return month_worktime;
	}



	public void setMonth_worktime(int month_worktime) {
		this.month_worktime = month_worktime;
	}



	public int getMonth_expenditure() {
		return month_expenditure;
	}



	public void setMonth_expenditure(int month_expenditure) {
		this.month_expenditure = month_expenditure;
	}



	public int getMonth_point() {
		return month_point;
	}



	public void setMonth_point(int month_point) {
		this.month_point = month_point;
	}



	public int getMonth_refund() {
		return month_refund;
	}



	public void setMonth_refund(int month_refund) {
		this.month_refund = month_refund;
	}



	public int getMonth_sum() {
		return month_sum;
	}



	public void setMonth_sum(int month_sum) {
		this.month_sum = month_sum;
	}



	public int getMonth_real_sum() {
		return month_real_sum;
	}



	public void setMonth_real_sum(int month_real_sum) {
		this.month_real_sum = month_real_sum;
	}



	public Date getMonth_date() {
		return month_date;
	}



	public void setMonth_date(Date month_date) {
		this.month_date = month_date;
	}



	public int getDifference() {
		return difference;
	}



	public void setDifference(int difference) {
		this.difference = difference;
	}



	public int getDifference_month() {
		return difference_month;
	}



	public void setDifference_month(int difference_month) {
		this.difference_month = difference_month;
	}



	public Date getDifference_date() {
		return difference_date;
	}



	public void setDifference_date(Date difference_date) {
		this.difference_date = difference_date;
	}


	@Override
	public String toString() {
		return "Jungsan_Input_DTO [jungsan_input_cash=" + jungsan_input_cash + ", jungsan_input_card="
				+ jungsan_input_card + ", jungsan_input_worktime=" + jungsan_input_worktime
				+ ", jungsan_input_expenditure=" + jungsan_input_expenditure + ", jungsan_input_point="
				+ jungsan_input_point + ", jungsan_input_refund=" + jungsan_input_refund + ", jungsan_input_reason="
				+ jungsan_input_reason + ", jungsan_input_grade=" + jungsan_input_grade + ", jungsan_input_date="
				+ jungsan_input_date + ", month_cash=" + month_cash + ", month_card=" + month_card + ", month_worktime="
				+ month_worktime + ", month_expenditure=" + month_expenditure + ", month_point=" + month_point
				+ ", month_refund=" + month_refund + ", month_sum=" + month_sum + ", month_real_sum=" + month_real_sum
				+ ", month_date=" + month_date + ", difference=" + difference + ", difference_month=" + difference_month
				+ ", difference_date=" + difference_date + "]";
	}
	

}
