package com.bit.UntitledBistro.service.insa;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.insa.InsaDAO;
import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;


@Service("test")
public class InsaServiceImpl implements InsaService{

	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void EmpRegisterInsert(Insa_EmpRegisterDTO dto) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		insaDAO.EmpRegisterInsert(dto);
		
		
	}

	@Override
	public List<Insa_EmpRegisterDTO> EmpRegisterList(HashMap map) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		
		return insaDAO.EmpRegisterList(map);
	}

	@Override
	public int getEmpCount() {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		
		
		return insaDAO.getEmpCount();
	}


	
	
}
