package com.bit.UntitledBistro.model.insa;

public class Insa_EmpSalaryJoinDTO {
   
   private String empregister_name;//이름
   private String empregister_paytime; // 시급
   private String empregister_payday;//일급
   private int salary_workingtime; // 근무시간
   private int salary_workingdate; //근무일수
   private int salary_pay;
   
   public int getSalary_pay() {
      return salary_pay;
   }
   public void setSalary_pay(int salary_pay) {
      this.salary_pay = salary_pay;
   }
   public String getEmpregister_name() {
      return empregister_name;
   }
   public void setEmpregister_name(String empregister_name) {
      this.empregister_name = empregister_name;
   }
   public String getEmpregister_paytime() {
      return empregister_paytime;
   }
   public void setEmpregister_paytime(String empregister_paytime) {
      this.empregister_paytime = empregister_paytime;
   }
   public String getEmpregister_payday() {
      return empregister_payday;
   }
   public void setEmpregister_payday(String empregister_payday) {
      this.empregister_payday = empregister_payday;
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
   @Override
   public String toString() {
      return "Insa_EmpSalaryJoinDTO [empregister_name=" + empregister_name + ", empregister_paytime="
            + empregister_paytime + ", empregister_payday=" + empregister_payday + ", salary_workingtime="
            + salary_workingtime + ", salary_workingdate=" + salary_workingdate + ", salary_pay=" + salary_pay
            + "]";
   }
   
}
