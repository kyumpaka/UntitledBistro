package com.bit.UntitledBistro.service.balju;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bit.UntitledBistro.model.balju.Balju_DAO;
import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Item_DTO;

@Service
public class Balju_ServiceImpl implements Balju_Service {
	
	@Autowired
	private Balju_DAO balju_DAO;

	@Override
	public void insert_Balju_Plan1() {
		this.balju_DAO.insert_Balju_Plan1();
	}
	

	@Override
	public void insert_Balju_Plan2(Balju_PlanDTO BPdto) {
		this.balju_DAO.insert_Balju_Plan2(BPdto);
		
	}
	

	@Override
	public void insert_Balju1() {
		this.balju_DAO.insert_Balju1();
	}
	
	@Override
	public void insert_Balju2(Balju_DTO Bdto) {
		this.balju_DAO.insert_Balju2(Bdto);
		
	}
	
	//관심품목 리스트 데이터 입력
	@Override
	public void insert_BookMark(Item_DTO Idto) {
		this.balju_DAO.insert_BookMark(Idto);
	}
	
	//공통품목 리스트 불러오기용
	@Override
	public List<Map<String, String>> item_list(Item_DTO Idto) {
		List<Map<String, String>> item_list = this.balju_DAO.item_list(Idto);
		return item_list;
	}
	
	//재고현황 리스트 불러오기용
	@Override
	public List<Map<String, String>> item_resultList(Item_DTO Idto) {
		List<Map<String, String>> item_resultList = this.balju_DAO.item_resultList(Idto);
		return item_resultList;
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
	
	//관심품목 리스트 불러오기
	@Override
	public List<Map<String, String>> item_BookMark(Item_DTO Idto) {
		List<Map<String,String>> item_BookMark = this.balju_DAO.item_BookMark(Idto);
		return item_BookMark;
	}
	
	@Override
	public void balju_Plan_modi(Balju_PlanDTO BPdto) {
		this.balju_DAO.balju_Plan_modi(BPdto);
	}

	@Override
	public void balju_Modi(Balju_DTO Bdto) {
		this.balju_DAO.balju_Modi(Bdto);
	}
	
	//관심품목 목록 수정
	@Override
	public void BookMark_Modi(Item_DTO Idto) {
		this.balju_DAO.BookMark_Modi(Idto);
		
	}
	
	@Override
	public void Delete_Balju_Plan(Balju_PlanDTO BPdto) {
		//발주계획하위테이블(상세내역)을 삭제함
		this.balju_DAO.Delete_Balju_Plan2(BPdto);
	}
	

	@Override
	public void Delete_Balju_Plan_Check(Balju_PlanDTO BPdto) {
		//발주계획상위테이블(목록번호)를 삭제함
		this.balju_DAO.Delete_Balju_Plan1(BPdto);
		
	}

	@Override
	public void Delete_Balju1(Balju_DTO Bdto) {
		this.balju_DAO.Delete_Balju1(Bdto);
		this.balju_DAO.Delete_Balju2(Bdto);
	}
	
	//관심품목 목록삭제
	@Override
	public void Delete_BookMark(ArrayList<String> DeleteList) {
		Item_DTO Idto = new Item_DTO();
		Idto.setBK_CODE(DeleteList.get(0));
		this.balju_DAO.Delete_BookMark(Idto);
		
	}


	@Override
	public List<Map<String, String>> BPlan_Load(Balju_PlanDTO BPdto) {
		List<Map<String,String>> BPlan_Load = this.balju_DAO.BPlan_Load(BPdto);
		return BPlan_Load;
	}


	@Override
	public List<Map<?, ?>> BPlan_Search(ArrayList<String> SearchParam) {
		Balju_PlanDTO BPdto = new Balju_PlanDTO();
		System.out.println("SearchParam의 0번째 값 : " + SearchParam.get(0));
		BPdto.setORDPL_ORDLIN_NUM(Integer.parseInt(SearchParam.get(0)));
		List<Map<?,?>> BPlan_Search = this.balju_DAO.BPlan_Search(BPdto);
		return BPlan_Search;
	}


}
