package com.bit.UntitledBistro.service.balju;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bit.UntitledBistro.model.balju.BaljuResultDTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.BookMarkDTO;
import com.bit.UntitledBistro.model.balju.ItemBookMarkDTO;
import com.bit.UntitledBistro.model.balju.ItemResultListDTO;
import com.bit.UntitledBistro.model.balju.Item_DTO;
import com.bit.UntitledBistro.model.balju.OrderInputOrderListDTO;
import com.bit.UntitledBistro.model.balju.OrderInputOrderPlanDTO;
import com.bit.UntitledBistro.model.balju.OrderListDTO;
import com.bit.UntitledBistro.model.balju.OrderPlanDTO;
import com.bit.UntitledBistro.model.balju.ProductDTO;

public interface Balju_Service {

	void insert_Balju_Plan1();

	void insert_Balju_Plan2(OrderPlanDTO orderPlanDTO);

	void insert_Balju1();

	void insert_Balju2(OrderListDTO orderListDTO);

	//관심품목 리스트 데이터 입력
	void insert_BookMark(BookMarkDTO bookMarkDTO);

	//공통품목 리스트 불러오기용
	List<ProductDTO> item_list();

	//재고현황 리스트 불러오기용
	List<ItemResultListDTO> item_resultList();

	List<OrderPlanDTO> balju_Plan_list();

	List<BaljuResultDTO> balju_Result();

	//발주서 현황 일자 검색
	List<BaljuResultDTO> balju_Result_Search(String DATESTART, String DATEEND);

	//발주서 관리 불러오기
	List<OrderInputOrderListDTO> balju_Mng_List();

	//발주서 관리 불러오기 필터링
	List<OrderInputOrderListDTO> balju_Mng_Filter(String FilterParam);

	//관심품목 리스트 불러오기
	List<ItemBookMarkDTO> item_BookMark(ItemBookMarkDTO itemBookMarkDTO);

	void balju_Plan_modi(OrderPlanDTO orderPlanDTO);

	void balju_Modi(OrderListDTO orderListDTO);

	//발주서 종결처리
	int End_Balju(List<Map<String, String>> endRow);

	//관심품목 목록 수정
	void BookMark_Modi(BookMarkDTO bookMarkDTO);

	void Delete_Balju_Plan(OrderPlanDTO orderPlanDTO);

	void Delete_Balju_Plan_Check(Balju_PlanDTO BPdto);

	void Delete_Balju(ArrayList<String> DeleteRow);

	//관심품목 목록삭제
	void Delete_BookMark(ArrayList<String> DeleteList);

	List<OrderInputOrderPlanDTO> BPlan_Load();

	List<OrderListDTO> BPlan_Search(ArrayList<String> SearchParam);

}