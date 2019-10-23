package com.bit.UntitledBistro.model.insa;

public class Insa_EmpSalaryJoinDTO {
	
	private String empregister_name;//이름
	private int empregister_pay;//시급
	private int salary_workingtime; // 근무시간
	private int salary_workingdate; //근무일수
	private int pay; 
	
	
	@Override
	public String toString() {
		return "Insa_EmpSalaryJoinDTO [empregister_name=" + empregister_name + ", empregister_pay=" + empregister_pay
				+ ", salary_workingtime=" + salary_workingtime + ", salary_workingdate=" + salary_workingdate + ", pay="
				+ pay + "]";
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getEmpregister_name() {
		return empregister_name;
	}
	public void setEmpregister_name(String empregister_name) {
		this.empregister_name = empregister_name;
	}
	public int getEmpregister_pay() {
		return empregister_pay;
	}
	public void setEmpregister_pay(int empregister_pay) {
		this.empregister_pay = empregister_pay;
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
	
}

