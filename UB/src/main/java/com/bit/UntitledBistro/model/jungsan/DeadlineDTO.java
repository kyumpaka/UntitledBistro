package com.bit.UntitledBistro.model.jungsan;

import java.util.Date;

public class DeadlineDTO {

	private int salary_workingTime;
	private int salary_workingDate;
	private int laborcosts;
	private int laborcosts_total;
	private int payment_cash; 
	private int payment_card;
	private int payment_point;
	private int order_pr_ea;
	private int orsa_qt;
	private String salary_empregister_empnum;
	private String empregister_grade;
	private String payment_state;
	private String order_end;
	private Date laborcosts_date;
	public int getSalary_workingTime() {
		return salary_workingTime;
	}
	public void setSalary_workingTime(int salary_workingTime) {
		this.salary_workingTime = salary_workingTime;
	}
	public int getSalary_workingDate() {
		return salary_workingDate;
	}
	public void setSalary_workingDate(int salary_workingDate) {
		this.salary_workingDate = salary_workingDate;
	}
	public int getLaborcosts() {
		return laborcosts;
	}
	public void setLaborcosts(int laborcosts) {
		this.laborcosts = laborcosts;
	}
	public int getLaborcosts_total() {
		return laborcosts_total;
	}
	public void setLaborcosts_total(int laborcosts_total) {
		this.laborcosts_total = laborcosts_total;
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
	public int getPayment_point() {
		return payment_point;
	}
	public void setPayment_point(int payment_point) {
		this.payment_point = payment_point;
	}
	public int getOrder_pr_ea() {
		return order_pr_ea;
	}
	public void setOrder_pr_ea(int order_pr_ea) {
		this.order_pr_ea = order_pr_ea;
	}
	public int getOrsa_qt() {
		return orsa_qt;
	}
	public void setOrsa_qt(int orsa_qt) {
		this.orsa_qt = orsa_qt;
	}
	public String getSalary_empregister_empnum() {
		return salary_empregister_empnum;
	}
	public void setSalary_empregister_empnum(String salary_empregister_empnum) {
		this.salary_empregister_empnum = salary_empregister_empnum;
	}
	public String getEmpregister_grade() {
		return empregister_grade;
	}
	public void setEmpregister_grade(String empregister_grade) {
		this.empregister_grade = empregister_grade;
	}
	public String getPayment_state() {
		return payment_state;
	}
	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}
	public String getOrder_end() {
		return order_end;
	}
	public void setOrder_end(String order_end) {
		this.order_end = order_end;
	}
	public Date getLaborcosts_date() {
		return laborcosts_date;
	}
	public void setLaborcosts_date(Date laborcosts_date) {
		this.laborcosts_date = laborcosts_date;
	}
	@Override
	public String toString() {
		return "DeadlineDTO [salary_workingTime=" + salary_workingTime + ", salary_workingDate=" + salary_workingDate
				+ ", laborcosts=" + laborcosts + ", laborcosts_total=" + laborcosts_total + ", payment_cash="
				+ payment_cash + ", payment_card=" + payment_card + ", payment_point=" + payment_point
				+ ", order_pr_ea=" + order_pr_ea + ", orsa_qt=" + orsa_qt + ", salary_empregister_empnum="
				+ salary_empregister_empnum + ", empregister_grade=" + empregister_grade + ", payment_state="
				+ payment_state + ", order_end=" + order_end + ", laborcosts_date=" + laborcosts_date + "]";
	}
}
