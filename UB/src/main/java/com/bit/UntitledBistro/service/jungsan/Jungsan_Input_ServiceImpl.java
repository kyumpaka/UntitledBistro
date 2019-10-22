package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DAO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DTO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DAO;
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
	public void update_Monthly(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		jungsan_input_DAO.update_Monthly(dto);
	}

	@Override
	public String to_date() {
		Jungsan_Input_DAO jungsan_input_DAO=sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.to_date();
	}
	
	@Override
	public void Show_Month(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO dao = sqlsession.getMapper(Jungsan_Input_DAO.class);
		int tmp = dao.Benchmark();
		if(tmp == 0){
			dao.insert_Initial_value(dto);
			}
		}
	
	@Override
	public void insert_Initial_value(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		jungsan_input_DAO.insert_Initial_value(dto);
		
	}

	@Override
	public int Benchmark() {
		Jungsan_Input_DAO jungsan_input_DAO=sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.Benchmark();
	}

	@Override
	public int to_difference() {
		Jungsan_Input_DAO jungsan_input_DAO=sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.to_difference();
	}

	@Override
	public void insert_difference(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		jungsan_input_DAO.insert_difference(dto);
	}

	@Override
	public void update_difference(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		jungsan_input_DAO.update_difference(dto);
	}

	@Override
	public void update_difference_Month(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		jungsan_input_DAO.update_difference_Month(dto);
	}

	@Override
	public void Show_difference(Jungsan_Input_DTO dto) {
		Jungsan_Input_DAO dao = sqlsession.getMapper(Jungsan_Input_DAO.class);
		int tmp = dao.count_difference();
		if(tmp == 0){
			dao.insert_difference(dto);
	}
		
	}
	@Override
	public int count_difference() {
		Jungsan_Input_DAO jungsan_input_DAO=sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.count_difference();
	}
	
	@Override
	public List<Jungsan_Input_DTO> differenceList(HashMap map) {
		Jungsan_Input_DAO jungsan_input_DAO =sqlsession.getMapper(Jungsan_Input_DAO.class);
		return jungsan_input_DAO.differenceList(map);
	}


}
