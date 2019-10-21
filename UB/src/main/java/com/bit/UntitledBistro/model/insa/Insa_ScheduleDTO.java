package com.bit.UntitledBistro.model.insa;

import java.util.Date;

public class Insa_ScheduleDTO {
	private String schedule_no; // 번호
	private String schedule_empregister_empnum; // 사번
	private Date schedule_workingstart; // 출근시간
	private Date schedule_workingend; // DATE, -- 퇴근시간
	private String schedule_workingtime; // 일한시간
	private int schedule_workingdate;// 당월근무일수
	private String schedule_hollydaystart;// 휴가시작
	private String schedule_hollydayend; // 휴가종료
	private String summary; //googleApi에서 필요
	private String calendarId; //googleApi에서 필요
    private String description; //googleApi에서 필요 
	public String getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(String schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSchedule_empregister_empnum() {
		return schedule_empregister_empnum;
	}
	public void setSchedule_empregister_empnum(String schedule_empregister_empnum) {
		this.schedule_empregister_empnum = schedule_empregister_empnum;
	}
	public String getSchedule_workingtime() {
		return schedule_workingtime;
	}
	public void setSchedule_workingtime(String schedule_workingtime) {
		this.schedule_workingtime = schedule_workingtime;
	}
	public int getSchedule_workingdate() {
		return schedule_workingdate;
	}
	public void setSchedule_workingdate(int schedule_workingdate) {
		this.schedule_workingdate = schedule_workingdate;
	}
	public String getSchedule_hollydaystart() {
		return schedule_hollydaystart;
	}
	public void setSchedule_hollydaystart(String schedule_hollydaystart) {
		this.schedule_hollydaystart = schedule_hollydaystart;
	}
	public String getSchedule_hollydayend() {
		return schedule_hollydayend;
	}
	public void setSchedule_hollydayend(String schedule_hollydayend) {
		this.schedule_hollydayend = schedule_hollydayend;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getCalendarId() {
		return calendarId;
	}
	public void setCalendarId(String calendarId) {
		this.calendarId = calendarId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getSchedule_workingstart() {
		return schedule_workingstart;
	}
	public void setSchedule_workingstart(Date schedule_workingstart) {
		this.schedule_workingstart = schedule_workingstart;
	}
	public Date getSchedule_workingend() {
		return schedule_workingend;
	}
	public void setSchedule_workingend(Date schedule_workingend) {
		this.schedule_workingend = schedule_workingend;
	}
	@Override
	public String toString() {
		return "Insa_ScheduleDTO [schedule_no=" + schedule_no + ", schedule_empregister_empnum="
				+ schedule_empregister_empnum + ", schedule_workingstart=" + schedule_workingstart
				+ ", schedule_workingend=" + schedule_workingend + ", schedule_workingtime=" + schedule_workingtime
				+ ", schedule_workingdate=" + schedule_workingdate + ", schedule_hollydaystart="
				+ schedule_hollydaystart + ", schedule_hollydayend=" + schedule_hollydayend + ", summary=" + summary
				+ ", calendarId=" + calendarId + ", description=" + description + "]";
	}



	
	
}

	
