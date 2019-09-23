package com.bit.UntitledBistro.service.balju;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bit.UntitledBistro.model.balju.Balju_DAO;
import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Balju_SaveDTO;
import com.bit.UntitledBistro.model.balju.Item_DTO;

@Transactional
@Service
public class Balju_ServiceImpl implements Balju_Service {
	
	@Autowired
	private Balju_DAO balju_DAO;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert_Balju_Plan1(Balju_PlanDTO BPdto) {
		this.balju_DAO.insert_Balju_Plan1(BPdto);
		this.balju_DAO.insert_Balju_Plan2(BPdto);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert_Balju1(Balju_DTO Bdto) {
		this.balju_DAO.insert_Balju1(Bdto);
		this.balju_DAO.insert_Balju2(Bdto);
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert_Balju_Save1(Balju_SaveDTO BSdto) {
		this.balju_DAO.insert_Balju_Save1(BSdto);
		this.balju_DAO.insert_Balju_Save2(BSdto);
		
	}
	
	//공통품목 리스트 불러오기용
	@Override
	public List<Map<String, String>> item_list(Item_DTO Idto) {
		List<Map<String, String>> item_list = this.balju_DAO.item_list(Idto);
		return item_list;
	}
	
	
	@Override
	public List<Map<String, String>> balju_Dummy(Balju_PlanDTO BPdto){
		List<Map<String, String>> balju_Dummy  = this.balju_DAO.balju_Dummy(BPdto);
		return balju_Dummy;
		
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
		this.balju_DAO.balju_Plan_modi(BPdto);
	}

	@Override
	public void balju_Modi(Balju_DTO Bdto) {
		this.balju_DAO.balju_Modi(Bdto);
	}

	@Override
	public void balju_Save_modi(Balju_SaveDTO BSdto) {
		this.balju_DAO.balju_Save_modi(BSdto);
	}

	@Override
	public void Delete_Balju_Plan1(Balju_PlanDTO BPdto) {
		this.balju_DAO.Delete_Balju_Plan1(BPdto);
		this.balju_DAO.Delete_Balju_Plan2(BPdto);
	}

	@Override
	public void Delete_Balju1(Balju_DTO Bdto) {
		this.balju_DAO.Delete_Balju1(Bdto);
		this.balju_DAO.Delete_Balju2(Bdto);
	}

	@Override
	public void Delete_Balju_Save1(Balju_SaveDTO BSdto) {
		this.balju_DAO.Delete_Balju_Save1(BSdto);
		this.balju_DAO.Delete_Balju_Save2(BSdto);
	}

	
	
	
	
	
}
