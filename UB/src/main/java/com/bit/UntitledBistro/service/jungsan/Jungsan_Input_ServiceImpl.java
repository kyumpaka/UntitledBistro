package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DAO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DTO;
@Service(value = "input")
public class Jungsan_Input_ServiceImpl implements Jungsan_Input_Service {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<Jungsan_Input_DTO> getjungsan_inputList(HashMap map) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.getjungsan_inputList(map);
	}

	@Override
	public void insert_daily(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		jungsan_input_DAO.insert_daily(dto);
	}

	@Override
	public int update(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.update(dto);
	}

	@Override
	public List<Jungsan_Input_DTO> MonthList(HashMap map) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.MonthList(map);
	}

	@Override
	public void insert_Monthly(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		jungsan_input_DAO.insert_Monthly(dto);
	}

	@Override
	public String to_date() {
		Jungsan_Input_DAO jungsan_input_DAO=sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.to_date();
	}


}
