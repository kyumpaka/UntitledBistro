package com.bit.UntitledBistro.service.balju;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.balju.BaljuResultDTO;
import com.bit.UntitledBistro.model.balju.Balju_DAO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.BookMarkDTO;
import com.bit.UntitledBistro.model.balju.ItemBookMarkDTO;
import com.bit.UntitledBistro.model.balju.ItemResultListDTO;
import com.bit.UntitledBistro.model.balju.OrderInputDTO;
import com.bit.UntitledBistro.model.balju.OrderInputOrderListDTO;
import com.bit.UntitledBistro.model.balju.OrderInputOrderPlanDTO;
import com.bit.UntitledBistro.model.balju.OrderListDTO;
import com.bit.UntitledBistro.model.balju.OrderPlanDTO;
import com.bit.UntitledBistro.model.balju.ProductDTO;
import com.bit.UntitledBistro.service.jaego.JaegoService;

@Service
public class Balju_ServiceImpl implements Balju_Service {
	
	@Autowired
	private Balju_DAO balju_DAO;

	@Autowired
	private JaegoService jaego;
	
	@Override
	public void insert_Balju_Plan1() {
		this.balju_DAO.insert_Balju_Plan1();
	}
	

	@Override
	public void insert_Balju_Plan2(OrderPlanDTO orderPlanDTO) {
		this.balju_DAO.insert_Balju_Plan2(orderPlanDTO);
		
	}
	

	@Override
	public void insert_Balju1() {
		this.balju_DAO.insert_Balju1();
	}
	
	@Override
	public void insert_Balju2(OrderListDTO orderListDTO) {
		this.balju_DAO.insert_Balju2(orderListDTO);
		
	}
	
	//관심품목 리스트 데이터 입력
	@Override
	public void insert_BookMark(BookMarkDTO bookMarkDTO) {
		this.balju_DAO.insert_BookMark(bookMarkDTO);
	}
	
	//공통품목 리스트 불러오기용
	@Override
	public List<ProductDTO> item_list() {
		List<ProductDTO> item_list = this.balju_DAO.item_list();
		return item_list;
	}
	
	//재고현황 리스트 불러오기용
	@Override
	public List<ItemResultListDTO> item_resultList() {
		List<ItemResultListDTO> item_resultList = this.balju_DAO.item_resultList();
		return item_resultList;
	}
	
	@Override
	public List<OrderPlanDTO> balju_Plan_list() {
		List<OrderPlanDTO> balju_Plan_list = this.balju_DAO.balju_Plan_list();
		return balju_Plan_list;
	}

	@Override
	public List<BaljuResultDTO> balju_Result() {
		List<BaljuResultDTO> balju_Result = this.balju_DAO.balju_Result();
		return balju_Result;
	}
	
	//발주서 현황 일자 검색
	@Override
	public List<BaljuResultDTO> balju_Result_Search(String DATESTART, String DATEEND){
		BaljuResultDTO Bdto = new BaljuResultDTO();
		Bdto.setDatestart(DATESTART);
		Bdto.setDateend(DATEEND);
		List<BaljuResultDTO> balju_Result_Search = this.balju_DAO.balju_Result_Search(Bdto);
		return balju_Result_Search;
	}
	
	//발주서 관리 불러오기
	@Override
	public List<OrderInputOrderListDTO> balju_Mng_List() {
		List<OrderInputOrderListDTO> balju_Mng_List = this.balju_DAO.balju_Mng_List();
		return balju_Mng_List;
	}
		
	//발주서 관리 불러오기 필터링
	@Override
	public List<OrderInputOrderListDTO> balju_Mng_Filter(String FilterParam){
		List<OrderInputOrderListDTO> balju_Mng_Filter = this.balju_DAO.balju_Mng_Filter(FilterParam);
		return balju_Mng_Filter;
	}
	
	//관심품목 리스트 불러오기
	@Override
	public List<ItemBookMarkDTO> item_BookMark(ItemBookMarkDTO itemBookMarkDTO) {
		List<ItemBookMarkDTO> item_BookMark = this.balju_DAO.item_BookMark(itemBookMarkDTO);
		return item_BookMark;
	}
	
	@Override
	public void balju_Plan_modi(OrderPlanDTO orderPlanDTO) {
		this.balju_DAO.balju_Plan_modi(orderPlanDTO);
	}

	@Override
	public void balju_Modi(OrderListDTO orderListDTO) {
		this.balju_DAO.balju_Modi(orderListDTO);
	}
	
	//발주서 종결처리
	@Override
	public int End_Balju(List<Map<String,String>> endRow) {
		OrderInputDTO orderInputDTO = new OrderInputDTO();
		for (Map<String, String> data : endRow) {
			
			orderInputDTO.setOrdin_num(data.get("ordin_num"));
			orderInputDTO.setOrdin_end(data.get("ordin_end"));
			this.balju_DAO.End_Balju(orderInputDTO);
			
			if(data.get("ordin_end").equals("종결")) {
				jaego.inItemDelete(Integer.parseInt(data.get("ordin_num")));;
			} else {
				jaego.inItemInsert(Integer.parseInt(data.get("ordin_num")));
				balju_DAO.orderListInItemUpdate(Integer.parseInt(data.get("ordin_num")));
			}
		}
		
		int riskItemCount = jaego.riskItemCount();
		return riskItemCount;
	}
	
	//관심품목 목록 수정
	@Override
	public void BookMark_Modi(BookMarkDTO bookMarkDTO) {
		this.balju_DAO.BookMark_Modi(bookMarkDTO);
		
	}
	
	@Override
	public void Delete_Balju_Plan(OrderPlanDTO orderPlanDTO) {
		//발주계획하위테이블(상세내역)을 삭제함
		this.balju_DAO.Delete_Balju_Plan2(orderPlanDTO);
	}
	

	@Override
	public void Delete_Balju_Plan_Check(Balju_PlanDTO BPdto) {
		//발주계획상위테이블(목록번호)를 삭제함
		this.balju_DAO.Delete_Balju_Plan1();
		
	}

	@Override
	public void Delete_Balju(ArrayList<String> DeleteRow) {
		OrderInputDTO BIdto = new OrderInputDTO();
		OrderListDTO BLdto = new OrderListDTO();
		for (int i = 0; i < DeleteRow.size(); i++) {
			BLdto.setOrder_ordin_num(Integer.parseInt(DeleteRow.get(i)));
			this.balju_DAO.Delete_Balju2(BLdto);
			BIdto.setOrdin_num(DeleteRow.get(i));
			this.balju_DAO.Delete_Balju1(BIdto);
		}
		
	}
	
	//관심품목 목록삭제
	@Override
	public void Delete_BookMark(ArrayList<String> DeleteList) {
		BookMarkDTO Idto = new BookMarkDTO();
		Idto.setBk_code(DeleteList.get(0));
		this.balju_DAO.Delete_BookMark(Idto);
		
	}


	@Override
	public List<OrderInputOrderPlanDTO> BPlan_Load() {
		List<OrderInputOrderPlanDTO> BPlan_Load = this.balju_DAO.BPlan_Load();
		return BPlan_Load;
	}


	@Override
	public List<OrderListDTO> BPlan_Search(ArrayList<String> SearchParam) {
		OrderInputOrderPlanDTO BPdto = new OrderInputOrderPlanDTO();
		System.out.println("SearchParam의 0번째 값 : " + SearchParam.get(0));
		BPdto.setOrdpl_ordlin_num(SearchParam.get(0));
		List<OrderListDTO> BPlan_Search = this.balju_DAO.BPlan_Search(BPdto);
		return BPlan_Search;
	}

}
