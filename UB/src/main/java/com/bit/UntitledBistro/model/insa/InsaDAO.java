package com.bit.UntitledBistro.model.insa;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

public interface InsaDAO {

	public int EmpRegisterInsert(Insa_EmpRegisterDTO dto);

	public List<Insa_EmpRegisterDTO> EmpRegisterList(HashMap map);

	public Insa_EmpRegisterDTO EmpRegisterRead(String empregister_empnum);

	public int getEmpCount();

	public int EmpRegisterUpdate(Insa_EmpRegisterDTO dto);

	public Insa_EmpRegisterDTO viewMember(Insa_EmpRegisterDTO dto);

	public String InsaLoginCheck(Insa_EmpRegisterDTO dto);
	
	public void logout(HttpSession session);
	
	
	
}
