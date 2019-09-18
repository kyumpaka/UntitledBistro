package com.bit.UntitledBistro.service.balju;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bit.UntitledBistro.model.balju.Balju_DAO;
import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Balju_SaveDTO;

@Service("Balju_Service")
@Transactional
public class Balju_ServiceImpl implements Balju_Service {

	@Autowired
	private Balju_DAO balju_DAO;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert_Balju_Plan(Balju_PlanDTO BPdto) {
		this.balju_DAO.insert_Balju_Plan1(BPdto);
		this.balju_DAO.insert_Balju_Plan2(BPdto);
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert_Balju(Balju_DTO Bdto) {
		this.balju_DAO.insert_Balju1(Bdto);
		this.balju_DAO.insert_Balju2(Bdto);
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert_Balju_Save(Balju_SaveDTO BSdto) {
		this.balju_DAO.insert_Balju_Save1(BSdto);
		this.balju_DAO.insert_Balju_Save2(BSdto);
		
	}

	@Override
	public List<Map<String, String>> balju_Plan_list(Balju_PlanDTO BPdto) {
		List<Map<String, String>> balju_Plan_list = this.balju_DAO.balju_Plan_list(BPdto);
		return balju_Plan_list;
	}

	@Override
	public List<Map<String, String>> balju_List(Balju_DTO Bdto) {
		List<Map<String, String>> balju_List = this.balju_DAO.balju_List(Bdto);
		return balju_List;
	}

	@Override
	public List<Map<String, String>> balju_Save_list(Balju_SaveDTO BSdto) {
		List<Map<String, String>> balju_Save_list = this.balju_DAO.balju_Save_list(BSdto);
		return balju_Save_list;
	}

	@Override
	public void balju_Plan_modi(Balju_PlanDTO BPdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void balju_Modi(Balju_DTO Bdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void balju_Save_modi(Balju_SaveDTO BSdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Delete_Balju_Plan(Balju_PlanDTO BPdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Delete_Balju(Balju_DTO Bdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Delete_Balju_Save(Balju_SaveDTO BSdto) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
