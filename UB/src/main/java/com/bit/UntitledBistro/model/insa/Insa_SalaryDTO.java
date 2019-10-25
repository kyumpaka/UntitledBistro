package com.bit.UntitledBistro.model.insa;

import java.util.Date;

public class Insa_SalaryDTO {
	private String salary_no; // 번호
	private String salary_empRegister_empnum; // 사번
	private String salary_calendar; // 년월구분
	private int salary_workingtime; // 근무시간
	private int salary_workingdate; // 근무일수
	private int salary_pay;
	private String salaraydate;
	private String salary_hollydaystart;// 휴가시작
	private String salary_hollydayend; // 휴가종료
	public String getSalary_no() {
		return salary_no;
	}
	public void setSalary_no(String salary_no) {
		this.salary_no = salary_no;
	}
	public String getSalary_empRegister_empnum() {
		return salary_empRegister_empnum;
	}
	public void setSalary_empRegister_empnum(String salary_empRegister_empnum) {
		this.salary_empRegister_empnum = salary_empRegister_empnum;
	}
	public String getSalary_calendar() {
		return salary_calendar;
	}
	public void setSalary_calendar(String salary_calendar) {
		this.salary_calendar = salary_calendar;
	}
	public int getSalary_workingtime() {
		return salary_workingtime;
	}
	public void setSalary_workingtime(int salary_workingtime) {
		this.salary_workingtime = salary_workingtime;
	}
	public int getSalary_workingdate() {
		return salary_workingdate;
	}
	public void setSalary_workingdate(int salary_workingdate) {
		this.salary_workingdate = salary_workingdate;
	}
	public int getSalary_pay() {
		return salary_pay;
	}
	public void setSalary_pay(int salary_pay) {
		this.salary_pay = salary_pay;
	}
	public String getSalaraydate() {
		return salaraydate;
	}
	public void setSalaraydate(String salaraydate) {
		this.salaraydate = salaraydate;
	}
	public String getSalary_hollydaystart() {
		return salary_hollydaystart;
	}
	public void setSalary_hollydaystart(String salary_hollydaystart) {
		this.salary_hollydaystart = salary_hollydaystart;
	}
	public String getSalary_hollydayend() {
		return salary_hollydayend;
	}
	public void setSalary_hollydayend(String salary_hollydayend) {
		this.salary_hollydayend = salary_hollydayend;
	}
	@Override
	public String toString() {
		return "Insa_SalaryDTO [salary_no=" + salary_no + ", salary_empRegister_empnum=" + salary_empRegister_empnum
				+ ", salary_calendar=" + salary_calendar + ", salary_workingtime=" + salary_workingtime
				+ ", salary_workingdate=" + salary_workingdate + ", salary_pay=" + salary_pay + ", salaraydate="
				+ salaraydate + ", salary_hollydaystart=" + salary_hollydaystart + ", salary_hollydayend="
				+ salary_hollydayend + "]";
	}
	
	
	
	
}
