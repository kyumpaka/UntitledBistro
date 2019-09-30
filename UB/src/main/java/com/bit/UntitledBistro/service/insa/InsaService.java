package com.bit.UntitledBistro.service.insa;

import java.util.HashMap;
import java.util.List;

import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;

public interface InsaService {

	public void EmpRegisterInsert(Insa_EmpRegisterDTO dto);

	public List<Insa_EmpRegisterDTO> EmpRegisterList(HashMap map);
	
	public int getEmpCount();//사원리스트 카운트

	public Insa_EmpRegisterDTO EmpRegisterRead(String empregister_empnum);
		
	

	
}
