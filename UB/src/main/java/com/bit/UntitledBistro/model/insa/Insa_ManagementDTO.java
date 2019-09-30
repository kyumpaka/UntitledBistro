package com.bit.UntitledBistro.model.insa;

import java.util.Date;

public class Insa_ManagementDTO {
private int management_num; //번호
private String management_empregister_empnum; //사번 
private int management_worktime; // 근무가능시간 EX)~시부터
private int management_worktime2; // 근무가능시간2   EX)~시까지
private Date management_date; //날짜
private int management_dailywages; //일급
public int getManagement_num() {
	return management_num;
}
public void setManagement_num(int management_num) {
	this.management_num = management_num;
}
public String getManagement_empregister_empnum() {
	return management_empregister_empnum;
}
public void setManagement_empregister_empnum(String management_empregister_empnum) {
	this.management_empregister_empnum = management_empregister_empnum;
}
public int getManagement_worktime() {
	return management_worktime;
}
public void setManagement_worktime(int management_worktime) {
	this.management_worktime = management_worktime;
}
public int getManagement_worktime2() {
	return management_worktime2;
}
public void setManagement_worktime2(int management_worktime2) {
	this.management_worktime2 = management_worktime2;
}
public Date getManagement_date() {
	return management_date;
}
public void setManagement_date(Date management_date) {
	this.management_date = management_date;
}
public int getManagement_dailywages() {
	return management_dailywages;
}
public void setManagement_dailywages(int management_dailywages) {
	this.management_dailywages = management_dailywages;
}
@Override
public String toString() {
	return "Insa_ManagementDTO [management_num=" + management_num + ", management_empregister_empnum="
			+ management_empregister_empnum + ", management_worktime=" + management_worktime + ", management_worktime2="
			+ management_worktime2 + ", management_date=" + management_date + ", management_dailywages="
			+ management_dailywages + "]";
} 

	
	
}
