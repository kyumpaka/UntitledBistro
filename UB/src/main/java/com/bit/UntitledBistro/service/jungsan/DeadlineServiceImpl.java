package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.jungsan.DeadlineDAO;
import com.bit.UntitledBistro.model.jungsan.DeadlineDTO;
@Service(value = "Deadline_Test")
public class DeadlineServiceImpl implements DeadlineService {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<DeadlineDTO> getdeadlineList(HashMap map) {
		System.out.println("=============서비스서비스=================");
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		System.out.println(deadlineDAO.getdeadlineList(map));
		System.out.println("=============서비스서비스=================");
		return deadlineDAO.getdeadlineList(map);
	}

	@Override
	public int day_profit() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.day_profit();
	}

	@Override
	public int month_profit() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.month_profit();
	}

	@Override
	public int day_expenditure() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.day_expenditure();
	}

	@Override
	public int month_expenditure() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.month_expenditure();
	}

	@Override
	public int day_refund() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.day_refund();
	}

	@Override
	public int day_worktime() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.day_worktime();
	}

	@Override
	public int month_worktime() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.month_worktime();
	}

	@Override
	public int day_max_profit() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.day_max_profit();
	}

	@Override
	public int month_max_profit() {
		DeadlineDAO deadlineDAO=sqlsession.getMapper(DeadlineDAO.class);
		return deadlineDAO.month_max_profit();
	}

	@Override
	public void insert_deadline() {
		// TODO Auto-generated method stub
	}

	@Override
	public void update_deadline() {
		// TODO Auto-generated method stub
	}

}
