package com.bit.UntitledBistro.model.insa;

import java.util.HashMap;
import java.util.List;

public interface InsaDAO {

	public void EmpRegisterInsert(Insa_EmpRegisterDTO dto);

	public List<Insa_EmpRegisterDTO> EmpRegisterList(HashMap map);

	public Insa_EmpRegisterDTO EmpRegisterRead(String empregister_empnum);

	public int getEmpCount();

}
