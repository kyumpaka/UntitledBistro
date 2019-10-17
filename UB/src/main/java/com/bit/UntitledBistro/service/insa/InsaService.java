package com.bit.UntitledBistro.service.insa;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.model.insa.Insa_ScheduleDTO;

public interface InsaService {

	public int EmpRegisterInsert(Insa_EmpRegisterDTO dto);

	public List<Insa_EmpRegisterDTO> EmpRegisterList(HashMap map);
	
	public int getEmpCount();//사원리스트 카운트

	public Insa_EmpRegisterDTO EmpRegisterRead(String empregister_empnum);
		
	public String imgUpload(MultipartHttpServletRequest mRequest);

	public int EmpRegisterUpdate(Insa_EmpRegisterDTO dto);

	public Insa_EmpRegisterDTO viewMember(Insa_EmpRegisterDTO dto);
	
	public boolean InsaLoginCheck(Insa_EmpRegisterDTO dto, HttpSession session);
	
	public void logout(HttpSession session);



	boolean WorkLoginCheck(Insa_EmpRegisterDTO dto, HttpSession session);

	public void WorkLogout(HttpSession session);

	public int WorkCheck(Insa_EmpRegisterDTO dto);





	
	
	
}
