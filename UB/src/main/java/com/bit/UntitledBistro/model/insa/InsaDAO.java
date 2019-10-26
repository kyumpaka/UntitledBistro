package com.bit.UntitledBistro.model.insa;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

public interface InsaDAO {

	public int EmpRegisterInsert(Insa_EmpRegisterDTO dto);

	public List<Insa_EmpRegisterDTO> EmpRegisterList(HashMap map);

	public Insa_EmpRegisterDTO EmpRegisterRead(String empregister_empnum);

	public int EmpRegisterUpdate(Insa_EmpRegisterDTO dto);

	public Insa_EmpRegisterDTO viewMember(Insa_EmpRegisterDTO dto);

	public String InsaLoginCheck(Insa_EmpRegisterDTO dto);
	
	public int WorkAdd(Insa_EmpRegisterDTO dto);

	public int WorkEnd(Insa_EmpRegisterDTO dto);

	public int WorkCheck(Insa_EmpRegisterDTO dto);

	public int DayCheck(Insa_EmpRegisterDTO dto);

	public List <Insa_ScheduleDTO> EmpWork();

	public int getWorkCount();

	public List<Insa_ScheduleDTO> EmpWorkList();

	public List<Insa_SalaryDTO> PayCheck();

	public void SalaryAdd(Insa_EmpRegisterDTO dto);

	public void SalaryDayAdd(Insa_EmpRegisterDTO dto);
	   
	public void SalaryUpdate(Insa_EmpRegisterDTO dto);
	
	public void SalaryDayUpdate(Insa_EmpRegisterDTO dto);	

	public List<Insa_SalaryDTO> HollyDay();

	public int HollydayAdd(Insa_SalaryDTO dto);

	public Insa_SalaryDTO SelectNum(HashMap<String, String> map);

	public List<Insa_SalaryDTO> Schedule();
	
	public int PayCheckByNum(Insa_EmpRegisterDTO dto);
}
