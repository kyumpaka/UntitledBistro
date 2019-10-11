package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DAO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DTO;
@Service(value = "view")
public class Jungsan_view_ServiceImpl implements Jungsan_view_Service {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<Jungsan_view_DTO> getjungsan_viewList(HashMap map) {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.getjungsan_viewList(map);
	}

	@Override
	public int befor_cash() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_cash();
	}

	@Override
	public int befor_card() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_card();
	}

	@Override
	public int befor_code() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_code();
	}

	@Override
	public int today_cash() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_cash();
	}

	@Override
	public int today_card() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_card();
	}

	@Override
	public int today_code() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_code();
	}

	@Override
	public int today_point() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_point();
	}

	@Override
	public int today_refund() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int menucount_total() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.menucount_total();
	}

	@Override
	public int menucount_drink() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.menucount_drink();
	}

	@Override
	public int menucount_cooking() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.menucount_cooking();
	}

	@Override
	public int menucount_soup() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.menucount_soup();
	}

}
