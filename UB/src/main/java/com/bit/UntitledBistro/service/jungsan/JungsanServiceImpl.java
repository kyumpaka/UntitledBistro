package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.jungsan.JungsanDAO;
import com.bit.UntitledBistro.model.jungsan.JungsanDTO;
@Service(value = "Jungsan_Test")
public class JungsanServiceImpl implements JungsanService {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<JungsanDTO> getjungsanList(HashMap map) {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.getjungsanList(map);
	}

	@Override
	public int befor_cash() {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.befor_cash();
	}

	@Override
	public int befor_card() {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.befor_card();
	}

	@Override
	public int today_cash() {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.today_cash();
	}

	@Override
	public int today_card() {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.today_card();
	}

	@Override
	public int total_cash() {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.total_cash();
	}

	@Override
	public int total_card() {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.total_card();
	}

	@Override
	public int timeto_jungsan() {
		JungsanDAO jungsanDAO=sqlsession.getMapper(JungsanDAO.class);
		return jungsanDAO.timeto_jungsan();
	}

}
